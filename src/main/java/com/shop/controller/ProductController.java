package com.shop.controller;

import com.shop.model.Category;
import com.shop.model.PageBean;
import com.shop.model.Product;
import com.shop.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
*@author asus11
*@create 2018/7/23 14:02
*@desc 商品控制器
**/
@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    private IProductService productService;

    PageBean<Product> pageBean =new PageBean<Product>();


    /**
    *@author asus11
    *@create 2018/7/29 9:22
    *@desc  查询一级分类下的商品
    **/
    @RequestMapping("/findProductByCid")
    public String findProductsByCid(Model model, int cid, Integer pageNow){
        //查询一级分类
        List<Category> categoryList = productService.findAllCategory();
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("cid", cid);
        //封装pageBean
        pageBean.setCid(cid);
        pageBean.setPageNow(pageNow);
        //查询商品
        pageBean = productService.findByPage(pageBean);
        model.addAttribute("pageBean", pageBean);
        return "list";
    }


    /**
    *@author asus11
    *@create 2018/7/30 10:04
    *@desc 查询二级分类下的商品
    **/
    @RequestMapping("/findProductByCsid")
    public String findProductByCsid(Model model,int csid,Integer pageNow){
        //查询一级分类
        List<Category> categoryList = productService.findAllCategory();
        model.addAttribute("categoryList", categoryList);
        //封装pageBean
        pageBean.setCsid(csid);
        pageBean.setPageNow(pageNow);
        //查询二级分类的商品
        pageBean = productService.findByCsid(pageBean);
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("csid", csid);
        return "cslist";
    }


    /**
    *@author asus11
    *@create 2018/7/30 10:35
    *@desc 查询商品详情
    **/
    @RequestMapping("/findProductByPid")
    public String findProductByPid(Model model,int pid){
        // 查询所有一级分类:
        List<Category> categoryList = productService.findAllCategory();
        model.addAttribute("categoryList", categoryList);
        //根据商品id查询商品详情
        Product product=productService.findProductByPid(pid);
        model.addAttribute("product", product);
        return "productDesc";
    }


    /**
     * 管理员条件查找商品
     * @return
     */
    @RequestMapping("/findProducts")
    public String findProduct(Model model,PageBean pageBean){

        pageBean = productService.findProducts(pageBean);
        model.addAttribute("pageBean",pageBean);
        return "product_list";
    }


    /**
     * 管理员添加商品
     * @param product
     * @param model
     * @return
     */
    @RequestMapping("/addProduct")
    public String addProduct(Product product,Model model){

        return "forward:add_product";
    }


}
