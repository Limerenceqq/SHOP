package com.shop.service;

import com.shop.entity.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;

/**
*@author asus11
*@create 2018/8/6 14:07
*@desc 订单业务处理接口
**/
public interface IOrderService {

    /**
     * 获取全部勾选的商品id数组
     * @param checked
     * @return
     */
    int[] getCheckedPid(String[] checked, HttpServletRequest request);

    /**
     * 根据商品id找商品
     * @param pid
     * @return
     */
    Product findProductByPid(int pid);

    /**
     * 查找用户已选择的商品项
     * @param checked
     * @return
     */
    Collection<CartItem> findCheckedItem(HttpServletRequest request, String[] checked);

    /**
     * 计算总价
     * @param cart
     * @param checked
     * @return
     */
    double calculateTotal(Cart cart, String[] checked);

    /**
     * 保存订单
     * @param orders
     * @return
     */
    Integer submitOrders(Orders orders);

    /**
     * 保存订单项
     * @param orderItem
     * @return
     */
    Integer saveOrderItem(OrderItem orderItem);

    /**
     * 根据订单id查找订单
     * @param oid
     * @return
     */
    Orders findOrderByOid(int oid);

    /**
     * 根据用户id查找订单
     * @param pageBean
     * @return
     *//*
    List<Orders> findOrderByUid(PageBean pageBean);*/

    /**
     * 根据订单id查找订单项信息
     * @param oid
     * @return
     */
    List<OrderItem> findOrderItemByOid(int oid);

    /**
     * 修改订单
     * @param orders
     */
    void updateOrder(Orders orders);

    /**
     * 查找所有订单
     * @param pageBean
     * @return
     */
    PageBean<Orders> findOrders(PageBean<Orders> pageBean);

    /**
     * 删除订单
     * @param oid
     */
    void deleteOrder(int oid);


}
