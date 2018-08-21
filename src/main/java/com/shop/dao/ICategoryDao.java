package com.shop.dao;

import com.shop.model.Category;
import java.util.List;


/**
*@author asus11
*@create 2018/7/30 14:12
*@desc 查找所有一级目录
**/
public interface ICategoryDao {

    /**
     * 查找所有一级目录
     * @return
     */
    List<Category> findAllCategory();
}
