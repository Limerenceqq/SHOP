package com.shop.model;

import java.util.Date;
import java.util.List;

/**
*@author asus11
*@create 2018/7/30 19:11
*@desc 订单实体类
**/
public class Orders {
    /**
     * 订单id
     */
    private int oid;
    /**
     * 总计
     */
    private double total;
    /**
     * 订单时间
     */
    private Date orderTime;
    /**
     * 订单状态
     */
    private int state;
    /**
     * 收货人名字
     */
    private String name;
    /**
     * 收货人电话
     */
    private String phone;
    /**
     * 收货人地址
     */
    private String addr;
    /**
     * 下单的用户
     */
    private User user;
    /**
     * 订单项集合
     */
    List<OrderItem> orderItems;

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    /**
     * 无参构造
     */
    public Orders(){
        super();
    }

    /**
     * 带参构造
     */
    public Orders(int oid, double total, Date orderTime, int state,
                  String name, String phone, String addr, User user){
        super();
        this.oid = oid;
        this.addr = addr;
        this.name = name;
        this.orderTime = orderTime;
        this.state = state;
        this.total = total;
        this.phone = phone;
        this.user = user;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    @Override
    public String toString() {
        return "Orders{" +
                "oid=" + oid +
                ", total=" + total +
                ", orderTime=" + orderTime +
                ", state=" + state +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                ", user=" + user +
                ", orderItems=" + orderItems +
                '}';
    }
}
