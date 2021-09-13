package com.igeek.service;

import com.igeek.Impl.CatelogDaoImpl;
import com.igeek.dao.CatelogDao;
import com.igeek.pojo.Catelog;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-04 19:20
 */
public class CatelogServicerImpl implements CatelogService{
    CatelogDao catelogDao = new CatelogDaoImpl();
    @Override
    public Catelog getCatelog(Connection conn, int id) {
        return catelogDao.getCatelogById(conn,id);
    }

    @Override
    public List<Catelog> getAllCatelog(Connection conn) {
        return catelogDao.getAllCatelog(conn);
    }

    @Override
    public Catelog getCatelog(Connection conn, String name) {
        return catelogDao.getCatelogByname(conn,name);
    }
}
