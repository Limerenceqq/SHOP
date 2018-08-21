package com.shop.controller;

import com.shop.model.Category;
import com.shop.service.ICategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;


/**
*@author asus11
*@create 2018/7/23 17:40
*@desc  一级类目控制器
**/
@Controller
@RequestMapping("/category")
public class CategoryController {

    @Resource
    private ICategoryService categoryService;

    @RequestMapping("/getCategoryList")
    public String getCategoryList(HttpSession session){
        List<Category> categoryList = categoryService.findAllCategory();
        session.setAttribute("categoryList",categoryList);
        return "index";
    }
}
