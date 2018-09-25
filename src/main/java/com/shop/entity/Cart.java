package com.shop.entity;


import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
*@author asus11
*@create 2018/7/31 10:17
*@desc 购物车实体类
**/
public class Cart {
    /**
     * 总计
     */
    private double total = 0;
    /**
     *购物项集合
     */
    private Map<Integer,CartItem> map = new HashMap<Integer,CartItem>();
    /**
     * 获取购物项
     */
    public Collection<CartItem> getCartItems(){
        return map.values();
    }
    /**
     * 添加购物项
     */
    public void addCartItem(CartItem cartItem){
        //获取购物项商品id
       Integer pid = cartItem.getProduct().getPid();
        if(map.containsKey(pid)){
            //商品已存在,追加新购物项的数量
            CartItem cartItem1 = map.get(pid);
            cartItem1.setCount(cartItem1.getCount() + cartItem.getCount());
        }else{
            //商品不存在,直接添加
            map.put(pid,cartItem);
        }
        //修改总计
        total += map.get(pid).getSubtotal();
    }

    /**
     * 移除购物项
     */
    public void removeCartItem(Integer pid){
        //先修改总计
        total -= map.get(pid).getSubtotal();
        //再移除
        CartItem cartItem = map.remove(pid);
    }

    /**
     * 清空购物车
     */
    public void clearCart(){
        map.clear();
        //总计为0
        total = 0;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

}
