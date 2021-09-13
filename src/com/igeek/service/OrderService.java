package com.igeek.service;

import com.igeek.pojo.*;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-05 12:29
 */
public interface OrderService {
    Order createOrder(Connection conn, Cart cart, Integer userId);
    //修改订单状态
    void deleteOrder(String orderId);
    void  updateOrderState(String order_id);
    void cancelOrderState(String order_id);
    Page<Order> page(Connection conn, int pageNo, int pageSize);
    Page<Order> pageforone(Connection conn,Integer user_id,int pageNo, int pageSize);
    List<OrderItem> OrderItemByOid(Connection conn,String order_id);
    Double getUserPrice(Connection conn,Integer user_id);
    Double getALLPrice(Connection conn);
}
