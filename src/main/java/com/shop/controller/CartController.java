package com.shop.controller;

import com.shop.entity.Cart;
import com.shop.entity.CartItem;
import com.shop.entity.Product;
import com.shop.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collection;

/**
*@author asus11
*@create 2018/7/31 13:45
*@desc 购物车控制器
**/
@Controller
@RequestMapping("/cart")
public class CartController {
    @Resource
    private IProductService productService;

    /**
     * 查看购物车
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/showCart")
    public String showCart(Model model,HttpServletRequest request){
        //判断用户是否登陆,没登陆则提示登陆
        String user = "user";
        HttpSession session = request.getSession();
        String msg = "请选择至少一件商品！";
        /*if(session.getAttribute(user) == null){
            model.addAttribute("msg","您还没有登陆，请先去登录!");
            return "loginPromot";
        }else {*/
            model.addAttribute("msg",msg);
            //从session中拿购物车，若没有则创建一个
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            return "cart";
        /*}*/
    }


    /**
     * 添加购物车
     * @param model
     * @param session
     * @param pid
     * @param count
     * @return
     */
    @RequestMapping("/addCartItem")
    public String addCart(Model model,HttpSession session,Integer pid,String count){
        //判断用户是否登陆,没登陆则提示登陆
        String user = "user";
        /*if(session.getAttribute(user) == null) {
            model.addAttribute("msg","您还没有登陆，请先去登录!");
            return "loginPromot";
        }else {*/
            if(pid != null && count != null) {
                Product product = productService.findProductByPid(pid);
                CartItem cartItem = new CartItem();
                int count1 = Integer.parseInt(count);
                cartItem.setCount(count1);
                cartItem.setProduct(product);
                cartItem.setSubtotal(count1 * product.getShopPrice());
                //获取购物车
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                    session.setAttribute("cart", cart);
                }
                //添加商品到购物车
                cart.addCartItem(cartItem);
                return "redirect:/cart/showCart";
            }else {
                //
                return "cart";
            }
        }
    /*}*/

    /**
     * 清空购物车
     * @param session
     * @return
     */
    @RequestMapping("/clearCart")
    public String clearCart(HttpSession session){
        Cart cart = (Cart)session.getAttribute("cart");
        if(cart == null){
            cart = new Cart();
            session.setAttribute("cart",cart);
        }
        cart.clearCart();
        return "cart";
    }

    /**
     * 移除购物项
     * @param session
     * @param pid
     * @return
     */
    @RequestMapping("/removeCartItem")
    public String removeCartItem(HttpSession session,Integer pid){
        Cart cart = (Cart)session.getAttribute("cart");
        if(cart == null){
            cart = new Cart();
            session.setAttribute("cart",cart);
        }
        if(pid != null){
            cart.removeCartItem(pid);
        }
        return "cart";
    }

    /**
     * 当点击购物车中的“+”号时触发ajax使商品的数量加1
     *
     */
    @RequestMapping("plus")
    public void add(String pid, HttpServletRequest request){
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        /*Collection<CartItem> cartItems = cart.getCartItems();*/
        for(CartItem cartItem:cart.getCartItems()) {
            if(cartItem.getProduct().getPid() == Integer.parseInt(pid)){
                cartItem.setCount(cartItem.getCount()+1);
                break;
            }
        }
    }

    /**
     * 当点击购物车的“+”号时出发ajax使商品的数量减1
     */
    @RequestMapping("minus")
    public void minus(String pid, HttpServletRequest request){
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        for(CartItem cartItem:cart.getCartItems()) {
            if(cartItem.getProduct().getPid() == Integer.parseInt(pid)){
                cartItem.setCount(cartItem.getCount()-1);
                break;
            }
        }
    }

    /**
     * 当用户手动改变购物车内商品数量时session里的count也改变
     */
    @RequestMapping("/changCount")
    public void changCount(String pid,String count,HttpServletRequest request){
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        Collection<CartItem> cartItems = cart.getCartItems();
        for(CartItem cartItem:cartItems){
            if(cartItem.getProduct().getPid() == Integer.parseInt(pid)){
                cartItem.setCount(Integer.parseInt(count));
                break;
            }
        }
    }


}
