package com.shop.dao;

import com.shop.entity.Category;
import com.shop.entity.CategorySecond;

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

    /**
     * 根据一级目录查找二级目录
     * @param cid
     * @return
     */
    List<CategorySecond> findCategorySecond(int cid);
}
