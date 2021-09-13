package com.igeek.dao;

import com.igeek.pojo.Food;
import com.igeek.pojo.Order;
import com.igeek.pojo.OrderItem;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-05 11:48
 */
public interface OrderDao {
    int saveOrder(Connection conn, Order order);
    //更新订单状态
    int cancelOrderState(Connection conn,String order_id);
    int updateOrderState(Connection conn,String order_id);
    //通过用户编号id，查看拥有的订单的分页列表
    List<Order> selectOrderByUId(Connection conn,Integer user_id);

    void deleteOrder(Connection conn,String orderId);
    Integer queryForPageTotalCount(Connection conn);
    //查分页所有订单
    List<Order> queryForPageItems(Connection conn, int begin, int pageSize);
    double queryForTotalPrice(Connection conn);

    Integer queryForPageForOneCount(Connection conn,Integer user_id);

    List<Order> queryForPageForOne(Connection conn,Integer user_id, int begin, int pageSize);

    Double queryForUserPrice(Connection conn,Integer user_id);

    Double queryForPrice(Connection conn);
}
