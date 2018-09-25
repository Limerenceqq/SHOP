package com.shop.controller;

import com.shop.entity.Category;
import com.shop.entity.CategorySecond;
import com.shop.service.ICategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
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
     * 添加商品页面带一级目录
     * @param model
     * @return
     */
    @RequestMapping("/getCategory")
    public String getCategory(Model model){
        List<Category> categoryList = categoryService.findAllCategory();
        model.addAttribute("categoryList",categoryList);
        return "add_product";
    }
    /**
     * 管理员添加商品页面，将一级目录和二级目录传过去
     * @return
     */
    @RequestMapping("/getCategorySecond")
    public void getCategorySecond(String cid, HttpServletResponse response){
        try {
            response.setContentType("text/html;charSet=utf-8");
            response.resetBuffer();
            PrintWriter writer = response.getWriter();
            if(cid==null){
                //前台未选择一级类目,则打印""
                writer.print("");
                return;
            }
            /*List<CategorySecond> categorySecondListByCid =
            categorySecondService.getCategorySecondListByCid(Integer.valueOf(cid));*/
            List<Category> categoryList = categoryService.findAllCategory();
            List<CategorySecond> categorySecondList = null;
            for (Category category:categoryList) {
                if(category.getCid() == Integer.parseInt(cid)){
                    categorySecondList = category.getCategorySeconds();
                }
            }
            String str = "";
            //以名称?id&名称?id的形式传回前台解析
            for (int i = 0; i < categorySecondList.size() ; i++) {
                if(i==0){
                    str+=categorySecondList.get(i).getCsname();
                    str+="?";
                    str+=categorySecondList.get(i).getCsid();
                }else{
                    str+="&";
                    str+=categorySecondList.get(i).getCsname();
                    str+="?";
                    str+=categorySecondList.get(i).getCsid();
                }
            }
            writer.print(str);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
