package com.shop.dao;

import com.shop.model.User;

/**
*@author asus11
*@create 2018/8/2 8:51
*@desc 用户数据持久层
**/
public interface IUserDao {


    /**
     * 添加用户
     * @param user
     * @return
     */
    int addUser(User user);

    /**
     * 检查是否重名
     * @param userName
     * @return
     */
    int userNameCheck(String userName);


}
