package com.shop.service.impl;

import com.shop.entity.Orders;
import com.shop.entity.PageBean;
import com.shop.service.IAdminService;
import com.shop.service.IOrderService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;


@Service
@RequestMapping("adminService")
public class AdminServiceImpl implements IAdminService {

    private IOrderService orderService;

    @Override
    public PageBean<Orders> findOrders(PageBean pageBean) {
        return orderService.findOrders(pageBean);
    }
}
