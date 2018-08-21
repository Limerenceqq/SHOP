package com.shop.service;


import com.shop.model.User;

/**
*@author asus11
*@create 2018/8/2 8:55
*@desc 登陆接口
**/
public interface ILoginService {
    /**
     * 根据用户名密码查找用户
     * @param user
     * @return
     */
    User findUserByUserNameAndPassword(User user);

    /**
     * 管理员登陆
     * @return
     */
    User findAdminUser(User user);
}
