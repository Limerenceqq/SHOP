package com.shop.controller;

import com.shop.entity.Category;
import com.shop.entity.Product;
import com.shop.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
*@author asus11
*@create 2018/7/31 17:14
*@desc 网站主控制器
**/
@Controller
@RequestMapping("/home")
public class HomeController {

    @Resource
    private IProductService productService;

    /**
     * 热门商品
     */
    private List<Product> hotList;
    /**
     * 最新商品
     */
    private List<Product> newList;

    /**
     * 普通用户首页页面
     */
    @RequestMapping("/index")
    public String index(HttpSession session, Model model){

        //查询一级分类
        List<Category> categoryList = productService.findAllCategory();
        //将一级分类存放在session中
        model.addAttribute("categoryList",categoryList);
        //查询所有热门商品
        hotList = productService.findAllHotProduct();
        //查询最新商品
        newList = productService.findAllNewProduct();
        //将二者存放到model中
        model.addAttribute("hotList",hotList);
        model.addAttribute("newList",newList);
        return "index";
    }

    /**
     *注册页面
     */
    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    /**
     * 用户登陆页面
     */
    @RequestMapping("/login")
    public String login(){
        return "login";
    }







}
