package com.shop.controller;

import com.shop.model.Orders;
import com.shop.model.PageBean;
import com.shop.service.IAdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
*@author asus11
*@create 2018/8/20 11:25
*@desc 管理员控制器
**/
@Controller
@RequestMapping("/admin")
public class AdminController {

    /**
     * 管理员登陆页面
     */
    @RequestMapping("/adminLogin")
    public String adminLogin(){
        return "adminLogin";
    }

    /**
     * 管理员top页面
     * @return
     */
    @RequestMapping("/top")
    public String top(){
        return "top";
    }

    /**
     * 管理员登陆adminmenu页面
     */
    @RequestMapping("/adminmenu")
    public String adminmenu(){
        return "adminmenu";
    }

    /**
     * 管理员登陆bar页面
     */
    @RequestMapping("/bar")
    public String bar(){
        return "bar";
    }

    /**
     * 管理员登陆main页面
     */
    @RequestMapping("/main")
    public String main(){
        return "main";
    }

}
