package com.igeek.service;

import com.igeek.pojo.Catelog;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-04 19:19
 */
public interface CatelogService {
    Catelog getCatelog(Connection conn,int id);
    List<Catelog> getAllCatelog(Connection conn);
    Catelog getCatelog(Connection conn,String name);
}
