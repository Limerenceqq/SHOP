package com.shop.model;

import java.util.List;

/**
*@author asus11
*@create 2018/7/30 15:02
*@desc 二级分类实体类
**/
public class CategorySecond {

    /**
     * 二级分类id
     */
    private int csid;
    /**
     * 二级分类名称
     */
    private String csname;
    /**
     * 二级分类所属一级分类对象
     */
    private Category category;
    /**
     * 商品集合
     */
    private List<Product> products;

    public Integer getCsid() {
        return csid;
    }
    public void setCsid(int csid) {
        this.csid = csid;
    }
    public String getCsname() {
        return csname;
    }
    public void setCsname(String csname) {
        this.csname = csname;
    }
    public Category getCategory() {
        return category;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public void setCategory(Category category) {
        this.category = category;
    }


    @Override
    public String toString() {
        return "CategorySecond{" +
                "csid=" + csid +
                ", csname='" + csname + '\'' +
                ", category=" + category +
                ", products=" + products +
                '}';
    }
}