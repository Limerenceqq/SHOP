package com.shop.controller;

import com.shop.model.Category;
import com.shop.model.CategorySecond;
import com.shop.service.ICategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    /**
     * 获取一级目录
     * @param session
     * @return
     */
    @RequestMapping("/getCategoryList")
    public String getCategoryList(HttpSession session){
        List<Category> categoryList = categoryService.findAllCategory();
        session.setAttribute("categoryList",categoryList);
        return "index";
    }

    /**
     * 管理员添加商品页面，将一级目录和二级目录传过去
     * @return
     */
    @RequestMapping("/getCategory")
    public String addProduct(Model model, HttpServletRequest request){
        //查询一级分类
        List<Category> categoryList = categoryService.findAllCategory();
        //存放在model中
        model.addAttribute("categoryList",categoryList);
        //点击的一级目录id
        List<CategorySecond> categorySeconds = null;
        int cid = Integer.parseInt(request.getParameter("categoryId"));
        for (Category category:categoryList) {
            if(category.getCid() == cid){
                categorySeconds = category.getCategorySeconds();
            }
        }
        //StringBuffer对象拼接字符串
        StringBuffer sb = new StringBuffer();
        String str = "";
        for (CategorySecond categorySecond:categorySeconds) {
            //通过逗号连接list集合中的数据
            str = sb.append(categorySecond.getCsname()).append(",").toString();
        }
        //利用字符串函数substring，截取字符串，去掉末尾的逗号
        str = str.substring(0,str.length()-1);
        model.addAttribute("categorySecond",str);
        return "add_product";
    }
}
