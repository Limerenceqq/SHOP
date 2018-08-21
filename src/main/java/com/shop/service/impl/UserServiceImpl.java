package com.shop.service.impl;

import com.shop.dao.IUserDao;
import com.shop.model.CheckCodeGenerator;
import com.shop.model.User;
import com.shop.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Map;

/**
*@author asus11
*@create 2018/7/25 15:08
*@desc  用户注册实现类
**/

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    /**
     *@author asus11
     *@create 2018/7/25 15:08
     *@desc 添加用户
     **/
    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean addUser(User user) {
        user.setCode(Math.random()*10+"");
        user.setState(1);
        int result = userDao.addUser(user);
        if(result>0){
            return true;
        }else{
            return false;
        }
    }


    /**
    *@author asus11
    *@create 2018/7/25 15:10
    *@desc 按用户名找用户
    **/
    @Override
    public int findUserByName(String username) {
        return userDao.userNameCheck(username);
    }


    /**
     * 获取验证码
     * @return
     */
    @Override
    public Map<String, Object> getCheckCodeGenerator(){
        CheckCodeGenerator checkCodeGenerator = new CheckCodeGenerator();
        return checkCodeGenerator.generlateCheckCode();
    }

}
