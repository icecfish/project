package com.igeek.service;


import com.igeek.Impl.OrderDaoImp;
import com.igeek.Impl.OrderItemDaoImpl;

import com.igeek.dao.OrderDao;
import com.igeek.dao.OrderItemDao;
import com.igeek.pojo.*;
import com.igeek.utils.JDBCUtils;


import java.sql.Connection;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @auther zcb
 * @create 2021-08-05 12:29
 */
public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao = new OrderDaoImp();
    private OrderItemDao orderItemDao = new OrderItemDaoImpl();
    @Override
    public Order createOrder(Connection conn, Cart cart, Integer userId) {
        String orderId = System.currentTimeMillis() + "" + userId;

        Order order = new Order(orderId, new Date(), cart.getTotalPrice(), "未付款", userId);
        orderDao.saveOrder(conn, order);
        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
            CartItem cartItem = entry.getValue();
            OrderItem orderItem = new OrderItem(null, cartItem.getFoodname(), cartItem.getCount(), cartItem.getPrice(), cartItem.getTotalPrice(), orderId);
            orderItemDao.saveOrderItem(conn, orderItem);
        }
        cart.clear();
        return order;
    }

    @Override
    public void deleteOrder(String orderId) {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            orderItemDao.deleteOrderItem(conn,orderId);
            orderDao.deleteOrder(conn,orderId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Override
    public void updateOrderState(String order_id) {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            System.out.println(order_id);
            orderDao.updateOrderState(conn,order_id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Override
    public void cancelOrderState(String order_id) {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            System.out.println(order_id);
            orderDao.cancelOrderState(conn,order_id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Override
    public Page<Order> page(Connection conn, int pageNo, int pageSize) {
        Page<Order> page=new Page<>();



        page.setPageSize(pageSize);

        Integer pageTotalCount= orderDao.queryForPageTotalCount(conn);
        page.setPageTotalCount(pageTotalCount);

        Integer pageTotal=pageTotalCount/pageSize;

        if(pageTotalCount%pageSize>0){
            pageTotal++;
        }
        page.setPageTotal(pageTotal);


        page.setPageNo(pageNo);

        int begin=(page.getPageNo()-1)*pageSize;
        List<Order> items=orderDao.queryForPageItems(conn,begin,pageSize);
        page.setItems(items);

        return page;
    }

    @Override
    public Page<Order> pageforone(Connection conn, Integer user_id, int pageNo, int pageSize) {
        Page<Order> page=new Page<>();



        page.setPageSize(pageSize);

        Integer pageTotalCount= orderDao.queryForPageForOneCount(conn,user_id);
        page.setPageTotalCount(pageTotalCount);

        Integer pageTotal=pageTotalCount/pageSize;

        if(pageTotalCount%pageSize>0){
            pageTotal++;
        }
        page.setPageTotal(pageTotal);


        page.setPageNo(pageNo);

        int begin=(page.getPageNo()-1)*pageSize;
        List<Order> items=orderDao.queryForPageForOne(conn,user_id,begin,pageSize);
        page.setItems(items);

        return page;
    }

    @Override
    public List<OrderItem> OrderItemByOid(Connection conn, String order_id) {
       return orderItemDao.selectOrderItemByOid(conn, order_id);
    }

    @Override
    public Double getUserPrice(Connection conn, Integer user_id) {
        return orderDao.queryForUserPrice(conn,user_id);
    }

    @Override
    public Double getALLPrice(Connection conn) {
        return orderDao.queryForPrice(conn);
    }
}


