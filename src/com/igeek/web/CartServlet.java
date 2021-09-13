package com.igeek.web;


import com.google.gson.Gson;
import com.igeek.pojo.Cart;
import com.igeek.pojo.CartItem;

import com.igeek.pojo.Food;
import com.igeek.service.FoodService;
import com.igeek.service.FoodServiceImpl;

import com.igeek.utils.JDBCUtils;
import com.igeek.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * @auther zcb
 * @create 2021-08-01 16:25
 */
@WebServlet(name = "CartServlet", urlPatterns = "/cartServlet")
public class CartServlet extends BaseServlet{
    private FoodService foodService = new FoodServiceImpl();

    //更新商品数量
    protected void updateCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        int count = WebUtils.parseInt(req.getParameter("count"), 1);
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart!=null){
            if (count>0){
                cart.updateCount(id,count);
                resp.sendRedirect(req.getHeader("Referer"));
            }else{
                cart.getItems().remove(id);
                resp.sendRedirect(req.getHeader("Referer"));
            }
        }
    }


//清楚购物车
    protected void clear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart!=null){
            cart.clear();
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }


//删除购物车某一项
    protected void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int id = WebUtils.parseInt(req.getParameter("id"), 0);
            Cart cart = (Cart) req.getSession().getAttribute("cart");
            if(cart!=null){
                cart.deleteItem(id);
                resp.sendRedirect(req.getHeader("Referer"));
            }
    }
    //添加购物车（已不用）
    protected void addItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            int id = WebUtils.parseInt(req.getParameter("id"), 0);
            Food food = foodService.queryFoodById(conn, id);
            CartItem cartItem=new CartItem(food.getId(),food.getFoodname(),food.getFoodinfo(),1,food.getPrice(),food.getPrice());
            Cart cart= (Cart) req.getSession().getAttribute("cart");
            if(cart==null){
                cart=new Cart();
                req.getSession().setAttribute("cart",cart);
            }
            cart.addItem(cartItem);

            req.getSession().setAttribute("lastName",cartItem.getFoodname());
            resp.sendRedirect(req.getHeader("Referer"));
//            resp.sendRedirect(req.getContextPath());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }

    }
    //ajax添加购物车（若不存在则创建购物车）
    protected void ajaxAddItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            int id = WebUtils.parseInt(req.getParameter("id"), 0);
            Food food = foodService.queryFoodById(conn, id);
            CartItem cartItem=new CartItem(food.getId(),food.getFoodname(),food.getFoodinfo(),1,food.getPrice(),food.getPrice());
            Cart cart= (Cart) req.getSession().getAttribute("cart");
            if(cart==null){
                cart=new Cart();
                req.getSession().setAttribute("cart",cart);
            }
            cart.addItem(cartItem);

            req.getSession().setAttribute("lastName",cartItem.getFoodname());


            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("totalCount",cart.getTotalCount());
            resultMap.put("lastName",cartItem.getFoodname());
            resultMap.put("totalCountPrice",cart.getTotalPrice());
            Gson gson = new Gson();
            String resultMapJsonString = gson.toJson(resultMap);
            resp.getWriter().write(resultMapJsonString);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }

    }
}
