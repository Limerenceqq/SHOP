package com.shop.service.impl;

import com.shop.dao.ICategoryDao;
import com.shop.entity.Category;
import com.shop.service.ICategoryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
*@author asus11
*@create 2018/7/30 9:13
*@desc  一级目录实现类
**/
@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {
    @Resource
    private ICategoryDao categoryDao;


    /**
    *@desc 查询所有一级目录
    **/
    @Transactional(rollbackFor = Exception.class)
    @Override
    public List<Category> findAllCategory() {

        List<Category> lists = categoryDao.findAllCategory();
        return lists;
    }
}
