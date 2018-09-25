package com.shop.dao;

import com.shop.entity.PageBean;
import com.shop.entity.Product;

import java.util.List;


/**
*@author asus11
*@create 2018/7/23 14:33
*@desc 商品数据持久层
**/
public interface IProductDao {
    /**
     * 查询热门商品（is_hot为1的商品）
     * @return
     */
    List<Product> findAllHotProduct();

    /**
     * 查询最新商品
     * @return
     */
    List<Product> findAllNewProduct();

    /**
     * 查询总记录数
     * @param cid
     * @return
     */
    Integer findCountByCid(int cid);

    /**
     * 一级类目下商品数据
     * @param pageBean
     * @return
     */
    List<Product> findByPage(PageBean pageBean);

    /**
     * 二级类目下商品数据
     * @param pageBean
     * @return
     */
    List<Product> findByPageCsid(PageBean pageBean);

    /**
     * 查询二级类目下总记录数
     * @param csid
     * @return
     */
    Integer findCountByCsid(int csid);

    /**
     * 查询商品详情
     * @param pid
     * @return
     */
    Product findProductByPid(int pid);

    /**
     * 查询所有商品的数量
     * @return
     */
    int findProductCount();

    /**
     * 管理员条件查询商品
     * @param pageBean
     * @return
     */
    List<Product> findProducts(PageBean pageBean);

    /**
     * 管理员删除商品
     * @param pid
     */
    int delProduct(int pid);

    /**
     * 添加商品
     * @param product
     */
    void addProduct(Product product);

}