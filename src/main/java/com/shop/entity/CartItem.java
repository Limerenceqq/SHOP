package com.shop.entity;

/**
*@author asus11
*@create 2018/7/30 17:17
*@desc 购物车购物项
**/
public class CartItem {
    /**
     * 商品信息
     */
    private Product product;
    /**
     * 数量
     */
    private int count;
    /**
     * 小计
     */
    private double subtotal;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "product=" + product +
                ", count=" + count +
                ", subtotal=" + subtotal +
                '}';
    }
}
