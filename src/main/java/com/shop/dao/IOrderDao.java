package com.shop.dao;

import com.shop.model.Orders;
import com.shop.model.OrderItem;
import com.shop.model.PageBean;

import java.util.List;

/**
*@author asus11
*@create 2018/8/6 10:05
*@desc 订单数据永久层
**/
public interface IOrderDao {

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
     */
    List<Orders> findOrderByUid(PageBean pageBean);

    /**
     * 根据订单id查找订单项
     * @param oid
     * @return
     */
    List<OrderItem> findOrderItemByOid(int oid);

    /**
     * 修改订单
     * @param order
     */
    void updateOrders(Orders order);

    /**
     * 条件查询订单
     * @param pageBean
     * @return
     */
    List<Orders> findOrders(PageBean pageBean);

    /**
     * 所有订单数
     * @return
     */
    int findOrdersCount();

    /**
     * 用户自己的订单数
     * @param uid
     * @return
     */
    int findMyOrdersCount(int uid);

    /**
     * 删除订单
     * @param oid
     */
    void deleteOrder(int oid);
}
