package com.igeek.Impl;

import com.igeek.dao.OrderItemDao;
import com.igeek.pojo.Order;
import com.igeek.pojo.OrderItem;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-05 12:25
 */
public class OrderItemDaoImpl extends BaseDao implements OrderItemDao {
    @Override
    public void deleteOrderItem(Connection conn, String orderId) {
        String sql = "delete from t_order_item where order_id = ?";
        update(conn,sql,orderId);
    }

    @Override
    public int saveOrderItem(Connection conn, OrderItem orderItem) {
        String sql = "insert into t_order_item(`name`,count,price,totalprice,order_id)values(?,?,?,?,?)";
        return update(conn, sql, orderItem.getName(), orderItem.getCount(), orderItem.getPrice(), orderItem.getTotalPrice(), orderItem.getOrderId());
    }

    @Override
    public List<OrderItem> selectOrderItemByOid(Connection conn, String oid) {
        String sql = "select * from t_order_item where order_id=?";
        List<OrderItem> list = queryForList(OrderItem.class, conn, sql, oid);
        return list;
    }


    public Integer queryForPageTotalCount(Connection conn) {
        String sql ="select count(*) from t_order_item";
        Number count = getValue(conn, sql);
        System.out.println(count);
        return count.intValue();
    }
    @Override
    public List<OrderItem> queryForPageItems(Connection conn, int begin, int pageSize) {
        String sql="select `name`,count,price,totalprice totalPrice,order_id orderId from t_order_item limit ?,?";

        return queryForList(OrderItem.class,conn,sql,begin,pageSize);
    }

}
