package com.shop.controller;

import com.shop.model.*;
import com.shop.service.IOrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
*@author asus11
*@create 2018/8/6 14:01
*@desc 订单控制器
**/
@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    private IOrderService orderService;


    /**
     * 提交订单
     * @param model
     * @param checked
     * @param request
     * @return
     */
    @RequestMapping("/submitOrders")
    public String submitOrders(Model model,String[] checked,HttpServletRequest request){

        if(checked == null){
            /*request.setAttribute("msg","请选择至少一件商品！");*/
            return "redirect:/cart/showCart";
        }else {
            Orders orders = new Orders();
            OrderItem orderItem = new OrderItem();
            /*封装订单数据*/
            orders.setOrderTime(new Date());
            //1 未付款   2 已经付款  3.已经发货   4 已经收货
            orders.setState(1);
            //获取购物车
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            //设置订单总价
            orders.setTotal(orderService.calculateTotal(cart, checked));


            //设置下单的用户
            User user = (User) session.getAttribute("user");
            orders.setUser(user);
            //提交订单
            Integer oid = orderService.submitOrders(orders);
            Integer oids = orders.getOid();

            /*封装订单项数据*/
            Collection<CartItem> cartItems = orderService.findCheckedItem(request, checked);
            for (CartItem cartItem : cartItems) {
                orderItem.setCount(cartItem.getCount());
                orderItem.setSubtotal(cartItem.getProduct().getShopPrice() * cartItem.getCount());
                orderItem.setProduct(cartItem.getProduct());
                orderItem.setOrders(orders);
                //保存订单项
                Integer orderItemId = orderService.saveOrderItem(orderItem);
            }

            //根据订单id查找所有订单项
            List<OrderItem> cartItemList = orderService.findOrderItemByOid(oids);
            orders.setOrderItems(cartItemList);
            //把已勾选的商品从购物车中移除
            int[] pid = orderService.getCheckedPid(checked, request);
            for (int i = 0; pid[i] != 0; i++) {
                cart.removeCartItem(pid[i]);
            }
            model.addAttribute("orders", orders);
            return "order";
        }
}


    /**
     * 付钱
     * @param oid
     * @param name
     * @param orderPhone
     * @param orderAddr
     * @param model
     * @return
     */
    @RequestMapping("/payOrder")
    public String payOrder(int oid,String name,String orderPhone,String orderAddr,Model model){
        //修改订单
        //根据订单id查询订单
        Orders currOrder = orderService.findOrderByOid(oid);
        currOrder.setAddr(orderAddr);
        currOrder.setName(name);
        currOrder.setPhone(orderPhone);
        orderService.updateOrder(currOrder);
        // 付款:
        //2代表已付款
        currOrder.setState(2);
        //修改订单状态
        orderService.updateOrder(currOrder);
        model.addAttribute("msg", "订单付款成功!订单号:"+oid+"支付金额:"+currOrder.getTotal());
        //返回消息页面
        return "loginPromot";
    }

    /**
     * 我的订单
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/findMyOrders")
    public String myOrder(HttpServletRequest request,Model model,PageBean<Orders> pageBean,String state){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if(user == null){
            model.addAttribute("msg","您还没有登陆，请先登录！");
            return "loginPromot";
        }else{
            int uid = user.getUid();
            if(state == null || state.equals("")){
                pageBean.setState(null);
            }else {
                pageBean.setState(Integer.parseInt(state));
            }
            pageBean.setUid(uid);
            pageBean = orderService.findOrders(pageBean);
            model.addAttribute("pageBean", pageBean);
            return "myOrder";
            }
    }


    /**
     * 根据订单id找订单
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping("/findByOid")
    public String findByOid(Model model,int oid){
        Orders order = orderService.findOrderByOid(oid);
        model.addAttribute("order",order);
        return "order";
    }


    /**
     * 管理员订单分页
     * @param model
     * @return
     */
    @RequestMapping("/findOrders")
    public String findOrders(Model model,PageBean<Orders> pageBean){

        pageBean = orderService.findOrders(pageBean);
        model.addAttribute("pageBean",pageBean);
        return "order_list";
    }



    /**
     * 管理员订单详情
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping("/findOrderByOid")
    public String orderDetail(Model model,int oid){
        Orders order = orderService.findOrderByOid(oid);
        model.addAttribute("order",order);
        return "order_detail";
    }


    /**
     * 改变订单状态
     * @param order
     */
    @RequestMapping("/changeState")
    public void changeState(Orders order){
        if(order.getState() <= 2){
            order.setState(3);
            orderService.updateOrder(order);
        }
    }


    @RequestMapping("deleteOrder")
    public void deleteOrder(int oid){

    }




}
