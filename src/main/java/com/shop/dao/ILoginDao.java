package com.shop.dao;

import com.shop.entity.User;

/**
*@author asus11
*@create 2018/7/31 16:10
*@desc 用户登陆
**/
public interface ILoginDao {
    /**
     * 通过用户名密码校验
     * @param user
     * @return
     */
    User findUserByUserNameAndPassword(User user);

    /**
     * 管理员登陆
     * @param user
     * @return
     */
    User findAdminUser(User user);
}
