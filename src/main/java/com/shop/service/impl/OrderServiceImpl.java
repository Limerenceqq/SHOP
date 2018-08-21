package com.shop.service.impl;

import com.shop.dao.IOrderDao;
import com.shop.dao.IProductDao;
import com.shop.model.*;
import com.shop.service.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

/**
*@author asus11
*@create 2018/8/7 10:08
*@desc 订单业务处理层
**/
@Service("orderService")
public class OrderServiceImpl implements IOrderService {
    @Resource
    private IOrderDao orderDao;
    @Resource
    private IProductDao productDao;


    /**
     * 查找已勾选的商品id
     * @param checked
     * @return
     */
    @Override
    public int[] getCheckedPid(String[] checked,HttpServletRequest request){
        int [] pid = new int[10];
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        Collection<CartItem> cartItems = cart.getCartItems();
        for(int i=0;i<checked.length;i++) {
            for (CartItem cartItem : cartItems) {
                if (cartItem.getProduct().getPid() == Integer.parseInt(checked[i])){
                    pid[i] = cartItem.getProduct().getPid();
                }
            }
        }
        return pid;
    }

    /**
     * 根据商品id找商品
     */
    @Override
    public Product findProductByPid(int pid){
        return productDao.findProductByPid(pid);
    }


    /**
     * 查找已勾选的商品项
     * @param checked
     * @return
     */
    @Override
    public Collection<CartItem> findCheckedItem(HttpServletRequest request, String[] checked){
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        Collection<CartItem> cartItems = cart.getCartItems();
        Collection<CartItem> cartItem1 = new LinkedList<CartItem>();
        for(int i=0;i<checked.length;i++) {
            for (CartItem cartItem : cartItems) {
                if (cartItem.getProduct().getPid() == Integer.parseInt(checked[i])){
                    cartItem1.add(cartItem);
                    System.out.println("pid:::::"+cartItem.getProduct().getPid());
                }
            }
        }
        return cartItem1;
    }

    /**
     * 计算总价
     * @param checked
     * @return
     */
    @Override
    public double calculateTotal(Cart cart,String[] checked){
        double total = 0.0;
        if(checked == null) {
            return 0;
        }else{
            Collection<CartItem> cartItems = cart.getCartItems();

            for(int i=0;i<checked.length;i++) {
                for (CartItem cartItem : cartItems) {
                    if (cartItem.getProduct().getPid() == Integer.valueOf(checked[i])){
                        cartItem.setSubtotal(cartItem.getProduct().getShopPrice()*cartItem.getCount());
                        total += cartItem.getSubtotal();
                    }
                }
            }
            return total;
        }
    }

    /**
     * 保存订单
     * @param orders
     * @return
     */
    @Override
    public Integer submitOrders(Orders orders) {
        return orderDao.submitOrders(orders);
    }

    /**
     * 保存订单项
     * @param orderItem
     * @return
     */
    @Override
    public Integer saveOrderItem(OrderItem orderItem) {
        return orderDao.saveOrderItem(orderItem);
    }

    /**
     * 根据订单id查找订单
     * @param oid
     * @return
     */
    @Override
    public Orders findOrderByOid(int oid) {
        return orderDao.findOrderByOid(oid);
    }

    /**
     * 根据用户id查找订单
     * @param uid
     * @return
     */
    @Override
    public List<Orders> findOrderByUid(int uid) {
        return orderDao.findOrderByUid(uid);
    }

    /**
     * 根据订单id查找订单项
     * @param oid
     * @return
     */
    @Override
    public List<OrderItem> findOrderItemByOid(int oid) {
        return orderDao.findOrderItemByOid(oid);
    }

    /**
     * 修改订单
     * @param orders
     */
    @Override
    public void updateOrder(Orders orders) {
        orderDao.updateOrders(orders);
    }


    @Override
    public PageBean<Orders> findOrders(PageBean pageBean){

        //设置每页显示订单数
        int limit = 8;
        //总页数
        int totalPage = 0;
        //总订单数
        int totalCount = orderDao.findOrdersCount();
        //封装总页数
        if(totalCount%limit == 0){
            totalPage = totalCount  / limit;
        }else{
            totalPage = totalCount / limit + 1;
        }
        int begin = (pageBean.getPageNow() - 1) * limit;
        //封装PageBean
        pageBean.setBegin(begin);
        pageBean.setLimit(limit);
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage(totalPage);

        //订单数据集合
        List<Orders> orders = orderDao.findOrders(pageBean);

        pageBean.setList(orders);
        return pageBean;
    }

}
