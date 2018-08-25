package com.shop.service;


import com.shop.model.Category;
import com.shop.model.CategorySecond;

import java.util.List;

/**
*@author asus11
*@create 2018/8/2 8:57
*@desc 目录接口
**/
public interface ICategoryService {
    /**
     * 查找所有目录
     * @return
     */
    List<Category> findAllCategory();

}
