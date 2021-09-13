package com.igeek.dao;

import com.igeek.pojo.Catelog;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-04 19:07
 */
public interface CatelogDao {
    Catelog getCatelogById(Connection conn,int id);
    List<Catelog> getAllCatelog(Connection conn);
    Catelog getCatelogByname(Connection conn,String name);
}
