package com.shop.service;

import com.shop.model.Orders;
import com.shop.model.PageBean;


public interface IAdminService {

    PageBean<Orders> findOrders(PageBean pageBean);
}
