package com.shop.entity;

/**
*@author asus11
*@create 2018/7/30 17:11
*@desc  订单项
**/
public class OrderItem {
    /**
     * 订单项id
     */
    private int orderItemId;
    /**
     * 购买数量
     */
    private int count;
    /**
     *小计
     */
    private double subtotal;
    /**
     *所属商品
     */
    private Product product;
    /**
     *所属订单
     */
    private Orders orders;

    public int get0rderItemId() {
        return orderItemId;
    }

    public void set0rderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders order) {
        this.orders = order;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "orderItemId=" + orderItemId +
                ", count=" + count +
                ", subtotal=" + subtotal +
                ", product=" + product +
                ", orders=" + orders +
                '}';
    }
}
