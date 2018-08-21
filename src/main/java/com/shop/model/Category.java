package com.shop.model;

import java.util.List;


/**
*@author asus11
*@create 2018/7/30 14:52
*@desc 一级分类实体类
**/
public class Category {

    /**
     * 一级分类id
     */
    private int cid;
    /**
     * 一级分类名称
     */
    private String cname;
    /**
     * 二级分类集合
     */
    private List<CategorySecond> categorySeconds;

    /**
     * 无参构造器
     */
    public Category() {
        super();
    }
    /**
     * 带参构造器
     * @param cid
     * @param cname
     * @param categorySeconds
     */

    public Category(Integer cid, String cname, List<CategorySecond> categorySeconds) {
        super();
        this.cid = cid;
        this.cname = cname;
        this.categorySeconds = categorySeconds;
    }


    public Integer getCid() {
        return cid;
    }
    public void setCid(Integer cid) {
        this.cid = cid;
    }
    public String getCname() {
        return cname;
    }
    public void setCname(String cname) {
        this.cname = cname;
    }

    public List<CategorySecond> getCategorySeconds() {
        return categorySeconds;
    }
    public void setCategorySeconds(List<CategorySecond> categorySeconds) {
        this.categorySeconds = categorySeconds;
    }

    @Override
    public String toString() {
        return "Category{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", categorySeconds=" + categorySeconds +
                '}';
    }
}

