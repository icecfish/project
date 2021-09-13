package com.igeek.Impl;

import com.igeek.dao.OrderDao;
import com.igeek.pojo.Food;
import com.igeek.pojo.Order;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-05 11:49
 */
public class OrderDaoImp extends BaseDao implements OrderDao {
    @Override
    public int saveOrder(Connection conn, Order order) {
        String sql="insert into t_order(order_id,create_time,price,`status`,user_id) values(?,?,?,?,?)";
        return update(conn,sql,order.getOrderId(),order.getCreatetime(),order.getPrice(),order.getStatus(),order.getUserId());
    }
    @Override
    public int updateOrderState(Connection conn,String order_id) {
        String sql = "update t_order set status = '已付款' where order_id = ?";
        int i = update(conn, sql,order_id);
        return i;
    }
    @Override
    public int cancelOrderState(Connection conn,String order_id) {
        String sql = "update t_order set status = '已取消' where order_id = ?";
        int i = update(conn, sql,order_id);
        return i;
    }

    @Override
    public double queryForTotalPrice(Connection conn) {
        String sql ="select sum(price) from t_order";
        Number count = getValue(conn, sql);
//        System.out.println(count);
        return count.doubleValue();
    }

    @Override
    public Integer queryForPageTotalCount(Connection conn) {
        String sql ="select count(*) from t_order";
        Number count = getValue(conn, sql);
//        System.out.println(count);
        return count.intValue();
    }

    @Override
    public List<Order> queryForPageItems(Connection conn, int begin, int pageSize) {
        String sql="select order_id orderId,create_time createtime,price,status,user_id userId from t_order limit ?,?";

        return queryForList(Order.class,conn,sql,begin,pageSize);
    }

    @Override
    public Integer queryForPageForOneCount(Connection conn,Integer user_id) {
        String sql = "select count(*) from t_order where user_id = ?";
        Number count = getValue(conn,sql,user_id);
        return count.intValue();
    }

    @Override
    public List<Order> queryForPageForOne(Connection conn,Integer user_id, int begin, int pageSize) {
        String sql="select order_id orderId,create_time createtime,price,status,user_id userId from t_order where user_id=? limit ?,?";

        return queryForList(Order.class,conn,sql,user_id,begin,pageSize);
    }



    @Override
    public List<Order> selectOrderByUId(Connection conn, Integer user_id) {
        String sql = "select * from t_order where user_id = ?";
        List<Order> list = queryForList(Order.class, conn, sql, user_id);
        return list;
    }

    @Override
    public void deleteOrder(Connection conn, String orderId) {
        String sql="delete from t_order where order_id=?";
        update(conn,sql,orderId);
    }

    @Override
    public Double queryForUserPrice(Connection conn, Integer user_id) {
        String sql="select sum(price) from t_order where user_id = ? and `status` = '已付款'";
        if(getValue(conn,sql,user_id)==null){
            return Double.valueOf(0);
        }else{
            Number count = getValue(conn,sql,user_id);
            return count.doubleValue();
        }

    }

    @Override
    public Double queryForPrice(Connection conn) {
        String sql="select sum(price) from t_order where `status` = '已付款'";
        Number count = getValue(conn,sql);
        return count.doubleValue();
    }


}
