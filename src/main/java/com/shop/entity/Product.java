package com.shop.entity;

import java.util.Date;

/**
*@author asus11
*@create 2018/7/30 15:08
*@desc 商品信息实体类
**/
public class Product {
    /**
     * 商品id
     */
    private int pid;
    /**
     * 商品名称
     */
    private String pname;
    /**
     * 市场价
     */
    private double marketPrice;
    /**
     * 商城价
     */
    private double shopPrice;
    /**
     * 图片地址
     */
    private String image;
    /**
     * 商品描述
     */
    private String pdesc;
    /**
     * 是否热门商品
     */
    private int isHot;
    /**
     * 日期
     */
    private Date pdate;
    /**
     * 所属二级类目
     */
    private CategorySecond categorySecond;


    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(double marketPrice) {
        this.marketPrice = marketPrice;
    }

    public double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public int getIsHot() {
        return isHot;
    }

    public void setIsHot(int isHot) {
        this.isHot = isHot;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdata) {
        this.pdate = pdata;
    }

    public CategorySecond getCategorySecond() {
        return categorySecond;
    }

    public void setCategorySecond(CategorySecond categorySecond) {
        this.categorySecond = categorySecond;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", marketPrice=" + marketPrice +
                ", shopPrice=" + shopPrice +
                ", image='" + image + '\'' +
                ", pdesc='" + pdesc + '\'' +
                ", isHot=" + isHot +
                ", pdata=" + pdate +
                ", categorySecond=" + categorySecond +
                '}';
    }
}
