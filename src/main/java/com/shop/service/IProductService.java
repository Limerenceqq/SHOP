package com.shop.service;

import com.shop.model.Category;
import com.shop.model.PageBean;
import com.shop.model.Product;

import java.util.List;

/**
*@author asus11
*@create 2018/8/2 8:50
*@desc 商品业务接口
**/
public interface IProductService {

    /**
     * 查询热门商品
     * @return
     */

    List<Product> findAllHotProduct();
    /**
     * 查询最新商品
     * @return
     */
    List<Product> findAllNewProduct();
    /**
     * 分页查询商品
     * @param pageBean
     * @return
     */
    PageBean<Product> findByPage(PageBean pageBean);
    /**
     * 查询二级分类的商品
     * @param pageBean
     * @return
     */
    PageBean<Product> findByCsid(PageBean pageBean);
    /**
     * 根据商品id查询商品详情
     * @param pid
     * @return
     */
    Product findProductByPid(int pid);
    /**
     * 查找所有目录
     * @return
     */
    List<Category> findAllCategory();

}