package com.shop.service.impl;

import com.shop.dao.ILoignDao;
import com.shop.entity.User;
import com.shop.service.ILoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
*@author asus11
*@create 2018/8/3 11:55
*@desc  用户登陆
**/
@Service("loginService")
public class LoginServiceImpl implements ILoginService {

    @Resource
    private ILoignDao loginDao;

    /**
     * 根据用户名和密码查询用户
     * @param user
     * @return
     */
    @Override
    public User findUserByUserNameAndPassword(User user) {
        user = loginDao.findUserByUserNameAndPassword(user);
        System.out.println("loginService:"+user);
        return user;
    }

    /**
     * 管理员登陆
     * @return
     */
    @Override
    public User findAdminUser(User user){
        user = loginDao.findAdminUser(user);
        return user;
    }
}
