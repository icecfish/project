package com.igeek.dao;

import com.igeek.pojo.Order;
import com.igeek.pojo.OrderItem;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-05 11:51
 */
public interface OrderItemDao {
    void deleteOrderItem(Connection conn,String orderId);
    int saveOrderItem(Connection conn, OrderItem orderItem);
    //通过订单编号oid查询订单明细
    List<OrderItem> selectOrderItemByOid(Connection conn, String oid);
    //查分页所有订单

    Integer queryForPageTotalCount(Connection conn);

    List<OrderItem> queryForPageItems(Connection conn, int begin, int pageSize);
}

