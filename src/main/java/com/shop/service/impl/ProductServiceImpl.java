package com.shop.service.impl;

import com.shop.dao.IProductDao;
import com.shop.model.Category;
import com.shop.model.PageBean;
import com.shop.model.Product;
import com.shop.service.ICategoryService;
import com.shop.service.IProductService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
*@author asus11
*@create 2018/7/23 14:24
*@desc   商品接口实现类
**/
@Service("productService")
public class ProductServiceImpl implements IProductService {

    @Resource
    private IProductDao productDao;
    @Resource
    private ICategoryService categoryService;


    /**
     * 查询热门商品
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public List<Product> findAllHotProduct() {
        return productDao.findAllHotProduct();
    }


    /**
     * 查询最新商品
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public List<Product> findAllNewProduct() {
        return productDao.findAllNewProduct();
    }


    /**
     * 分类页面分页查询商品
     */
    @Override
    public PageBean<Product> findByPage(PageBean pageBean) {

        /*System.out.println("该目录id为："+pageBean.getCid());*/

        //每页显示记录数
        int limit = 12;
        //总页数
        int totalPage = 0;
        // 查询一级目录总记录数:
        Integer totalCount = productDao.findCountByCid(pageBean.getCid());

        /*System.out.println("该目录下的商品总数："+totalCount);*/

        // 总页数的封装
        if(totalCount % limit == 0){
            totalPage = totalCount / limit;
        }else{
            totalPage = totalCount / limit + 1;
        }
        // 起始记录:
        int begin = (pageBean.getPageNow() - 1) * limit;

        //封装pageBean
        pageBean.setLimit(limit);
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage(totalPage);
        pageBean.setBegin(begin);

        //商品数据集合
        List<Product> list = productDao.findByPage(pageBean);

        /*System.out.println("该页的商品："+list);*/

        pageBean.setList(list);
        return pageBean;
    }


    /**
     * 根据二级分类查询商品
     */
    @Override
    public PageBean<Product> findByCsid(PageBean pageBean) {
        // 每页显示记录数
        int limit = 8;
        // 总页数
        int totalPage = 0;
        // 二级目录总记录数
        Integer totalCount = productDao.findCountByCsid(pageBean.getCsid());
        // 计算总页数:
        if(totalCount % limit == 0){
            totalPage = totalCount / limit;
        }else{
            totalPage = totalCount / limit + 1;
        }
        //计算起始记录
        int begin = (pageBean.getPageNow() - 1) * limit;
        //封装pageBean
        pageBean.setBegin(begin);
        pageBean.setLimit(limit);
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage(totalPage);
        // 数据的集合:
        List<Product> list = productDao.findByPageCsid(pageBean);
        pageBean.setList(list);
        return pageBean;
    }


    /**
     * 查询商品详情
     */
    @Override
    public Product findProductByPid(int pid) {
        return productDao.findProductByPid(pid);
    }


    /**
     * 查找所有目录
     * @return
     */
    @Override
    public List<Category> findAllCategory(){
        return categoryService.findAllCategory();
    }

}
