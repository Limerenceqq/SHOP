package com.shop.controller;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.model.User;
import com.shop.service.IUserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


/**
*@author asus11
*@create 2018/7/30 10:53
*@desc
**/
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;


    /**
    *@author asus11
    *@create 2018/7/18 17:14
    *@desc 用户注册后台验证
    **/
    @RequestMapping("/registerCheck")
    public String registerCheck(User user, String checkCode, HttpSession session,HttpServletRequest request) throws Exception{
        //比较验证码
        String sessionCode=(String) session.getAttribute("checkCode");
        if(checkCode!=null && checkCode.equalsIgnoreCase(sessionCode)){
            System.out.println(user);
            boolean flag = userService.addUser(user);
            if(flag) {
                request.setAttribute("message", "注册成功，请去登录！");
                return "registerSucess";
            }else{
                request.setAttribute("err","用户注册失败!");
                return "register";
            }
        }else{
            request.setAttribute("err", "验证码错误！");
            return "register";
        }
    }


    /**
     * 前台:注册AJAX校验用户名.
     * @throws IOException
     */
    @RequestMapping("/CheckUserName")
    @ResponseBody
    public Map<String, String> checkUserName(String username,HttpServletRequest request) throws IOException{
        if(username==""||username==null){
            Map<String, String> result = new HashMap<String, String>();
            result.put("msg","null");
            return result;
        }else{
            int existUser = userService.findUserByName(username);
            if(existUser == 0){
                // 用户名可以使用的
                Map<String, String> result = new HashMap<String, String>();
                result.put("msg","true");
                return result;
            }else{
                // 用户名已经存在
                Map<String, String> result = new HashMap<String, String>();
                result.put("msg","false");
                return result;
            }
        }
    }


    /**
     * 获取图形验证码 将返回一个包含4位字符（字母或数字）的图形验证码，并且将图形验证码的值设置到用户的 session 中
     *
     * @param time     时间戳
     * @param response 返回的 HttpServletResponse 响应
     */
    @RequestMapping("checkCode/{time}")
    public void getCheckCode(String time, HttpServletResponse response, HttpServletRequest request) {

        BufferedImage checkCodeImage = null;
        String checkCodeString = null;

        // 获取图形验证码
        Map<String, Object> checkCode = userService.getCheckCodeGenerator();

        if (checkCode != null) {
            checkCodeString = (String) checkCode.get("checkCodeString");
            checkCodeImage = (BufferedImage) checkCode.get("checkCodeImage");
        }

        if (checkCodeString != null && checkCodeImage != null) {
            try (ServletOutputStream outputStream = response.getOutputStream()) {
                // 设置 Session
                HttpSession session = request.getSession();
                session.setAttribute("checkCode", checkCodeString);

                // 将验证码输出
                ImageIO.write(checkCodeImage, "png", outputStream);

                response.setHeader("Pragma", "no-cache");
                response.setHeader("Cache-Control", "no-cache");
                response.setDateHeader("Expires", 0);
                response.setContentType("image/png");
            } catch (IOException e) {
            }
        }
    }
}