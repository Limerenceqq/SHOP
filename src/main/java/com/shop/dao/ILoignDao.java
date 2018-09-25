package com.shop.dao;

import com.shop.entity.User;

/**
*@author asus11
*@create 2018/7/31 16:10
*@desc 用户登陆
**/
public interface ILoignDao {
    /**
     * 根据用户名和密码查询用户
     */
    User findUserByUserNameAndPassword(User user);

    /**
     * 管理员登陆
     * @return
     */
    User findAdminUser(User user);
}
