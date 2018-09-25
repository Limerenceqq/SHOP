package com.shop.service;

import com.shop.entity.Orders;
import com.shop.entity.PageBean;


public interface IAdminService {

    PageBean<Orders> findOrders(PageBean pageBean);
}
