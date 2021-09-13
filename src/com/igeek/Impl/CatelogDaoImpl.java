package com.igeek.Impl;

import com.igeek.dao.CatelogDao;
import com.igeek.pojo.Catelog;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-04 19:15
 */
public class CatelogDaoImpl extends BaseDao implements CatelogDao {
    @Override
    public Catelog getCatelogById(Connection conn, int id) {
        String sql= "select id,catelog_name catelogName,catelog_info catelogInfo from t_catelog where id= ?";
        return querydForOne(Catelog.class, conn, sql, id);
    }

    @Override
    public List<Catelog> getAllCatelog(Connection conn) {
        String sql= "select id,catelog_name catelogName,catelog_info catelogInfo from t_catelog";
        return queryForList(Catelog.class,conn,sql);
    }

    @Override
    public Catelog getCatelogByname(Connection conn,String name) {
        String sql="select id,catelog_name catelogName,catelog_info catelogInfo from t_catelog where catelog_name = ?";
        return querydForOne(Catelog.class,conn,sql,name);
    }
}
