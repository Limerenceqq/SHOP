package com.shop.service;

import com.shop.entity.User;

import java.util.Map;
/**
*@author asus11
*@create 2018/8/2 8:51
*@desc 用户业务接口
**/
public interface IUserService {
     /**
      * 添加用户
      * @param user
      * @return
      */
     boolean addUser(User user);
     /**
      * 根据用户名查找用户
      * @param username
      * @return
      */
     int findUserByName(String username);
     /**
      * 获取验证码
      * @return
      */
     Map<String, Object> getCheckCodeGenerator();
}
