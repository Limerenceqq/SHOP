package com.shop.controller;

import com.shop.entity.User;
import com.shop.service.ILoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *@author asus11
 *@create 2018/8/2 14:49
 *@desc 用户登录出
 **/
@Controller
@RequestMapping("/login")
public class LoginController {

    @Resource
    private ILoginService loginService;

    /**
     *@author asus11
     *@create 2018/7/25 17:15
     *@desc 用户登陆
     **/
    @RequestMapping("/loginCheck")
    public String loginCheck(User user, String checkCode,HttpServletRequest request) {

        HttpSession session = request.getSession();
        //1.比较验证码
        String sessionCode = (String) session.getAttribute("checkCode");
        if (checkCode != null && checkCode.equalsIgnoreCase(sessionCode)) {
            //登录操作
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            user.setUsername(username);
            user.setPassword(password);
            User userTemp = loginService.findUserByUserNameAndPassword(user);
            if (userTemp != null) {
                //普通用户
                //验证用户状态
                int state = userTemp.getState();
                if (state == 1) {
                    session.setAttribute("user", userTemp);
                    return "redirect:/home/index.do";
                } else {
                    request.setAttribute("msg", "无效账号！");
                    return "forward:login";
                }
            }else{
                request.setAttribute("msg","用户名密码错误！");
                return "login";
            }
        } else {
            //验证码错误
            request.setAttribute("msg", "验证码错误");
            return "login";
        }
    }


    /**
     *@author asus11
     *@create 2018/8/22 9:15
     *@desc 管理员登陆
     **/
    @RequestMapping("/adminLoginCheck")
    public String adminLoginCheck(User user, String checkCode,HttpServletRequest request){

        HttpSession session = request.getSession();
        //1.比较验证码
        String sessionCode=(String) session.getAttribute("checkCode");
        if(checkCode !=null && checkCode.equalsIgnoreCase(sessionCode)) {
            //登录操作
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            user.setUsername(username);
            user.setPassword(password);
            User adminTemp = loginService.findAdminUser(user);
            if (adminTemp != null) {
                //管理员登陆
                session.setAttribute("user", adminTemp);
                return "adminIndex";
            } else {
                //账号密码错误
                request.setAttribute("msg", "用户名或者密码错误");
                return "forward:adminLogin";
            }
        }else{
            //验证码错误
            request.setAttribute("msg","验证码错误");
            return "adminLogin";
        }
    }

    /**
     *@author asus11
     *@create 2018/7/25 17:17
     *@desc  用户退出登陆
     **/
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session){
        session.invalidate();
        return "redirect:/home/index";
    }
}
