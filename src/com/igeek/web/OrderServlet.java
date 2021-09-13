package com.igeek.web;

import com.igeek.pojo.*;
import com.igeek.service.OrderService;
import com.igeek.service.OrderServiceImpl;
import com.igeek.service.UserService;
import com.igeek.service.UserServiceImpl;
import com.igeek.utils.JDBCUtils;
import com.igeek.utils.WebUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @auther zcb
 * @create 2021-08-02 11:28
 */
@WebServlet(name = "OrderServlet", urlPatterns = "/orderServlet")
public class OrderServlet extends BaseServlet{
    private OrderService orderService = new OrderServiceImpl();
    private UserService userService = new UserServiceImpl();
    //管理员删除订单
    protected void deleteOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        orderService.deleteOrder(orderId);
        resp.sendRedirect(req.getHeader("Referer"));
    }
    //用户取消订单
    protected void cancel(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            Order order = (Order) req.getSession().getAttribute("order");
            orderService.cancelOrderState(order.getOrderId());
            resp.sendRedirect(req.getContextPath()+"/index.jsp");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }


    }

//获取该订单的订单项
    protected void scanOrderItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            String orderid = req.getParameter("orderid");
            int pageNo = Integer.parseInt(req.getParameter("pageNo"));
            List<OrderItem> orderItems = orderService.OrderItemByOid(conn, orderid);
            double totalPrice=0;
            for (OrderItem orderItem : orderItems) {
                totalPrice+=orderItem.getTotalPrice();
            }
            req.setAttribute("pageNo",pageNo);
            req.setAttribute("totalPrice",totalPrice);
            req.setAttribute("orderitems",orderItems);
            req.setAttribute("orderid",orderid);
            if(req.getSession().getAttribute("admin")!=null){
                req.getRequestDispatcher("/pages/manager/ordersubmit.jsp").forward(req,resp);
            }else{
                req.getRequestDispatcher("/pages/user/ordersubmit.jsp").forward(req,resp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            JDBCUtils.closeConnection(conn);
        }
    }
    //用户创建订单
    protected void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            Cart cart = (Cart) req.getSession().getAttribute("cart");
            User loginUser= (User) req.getSession().getAttribute("user");
            Integer id = loginUser.getId();
            Order order = orderService.createOrder(conn, cart, id);
            String orderId = order.getOrderId();
            List<OrderItem> orderItems = orderService.OrderItemByOid(conn, orderId);
            req.getSession().setAttribute("orderItems",orderItems);
            req.getSession().setAttribute("order",order);
            resp.sendRedirect(req.getContextPath()+"/pages/order/ordersubmit.jsp");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }

    }
    //管理员获取订单分页
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
//            System.out.println("报错了吗111111");
            int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
//            System.out.println(pageNo);
            int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);

//            List<Catelog> catelog = catelogService.getAllCatelog(conn);
//            req.getSession().setAttribute("catelog",catelog);

            Page<Order> page = orderService.page(conn,pageNo,pageSize);
            List<User> users = userService.getAllUser(conn);
//            System.out.println(page);
            req.setAttribute("users",users);
            req.setAttribute("page",page);
            req.getRequestDispatcher("/pages/manager/order.jsp").forward(req,resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }
//用户获取订单分页
    protected void pageForUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
//            System.out.println("报错了吗111111");
            int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
//            System.out.println(pageNo);
            int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);

//            List<Catelog> catelog = catelogService.getAllCatelog(conn);
//            req.getSession().setAttribute("catelog",catelog);
            User user = (User) req.getSession().getAttribute("user");
            Page<Order> page = orderService.pageforone(conn,user.getId(),pageNo,pageSize);
//            System.out.println(page);

            req.setAttribute("page",page);
            req.getRequestDispatcher("/pages/user/order.jsp").forward(req,resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }



}
