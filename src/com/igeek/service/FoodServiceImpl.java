package com.igeek.service;

import com.igeek.Impl.FoodDaoImpl;
import com.igeek.dao.FoodDao;
import com.igeek.pojo.Food;
import com.igeek.pojo.Page;
import com.igeek.utils.JDBCUtils;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-03 19:01
 */
public class FoodServiceImpl implements FoodService {
    private FoodDao foodDao = new FoodDaoImpl();

    @Override
    public void addFood(Connection conn, Food food) {
        foodDao.addFood(conn, food);
    }

    @Override
    public void deleteFoodById(Connection conn, Integer id) {
        foodDao.deleteFoodById(conn, id);
    }

    @Override
    public void updateFood(Connection conn, Food food) {
        foodDao.updateFood(conn, food);
    }

    @Override
    public Food queryFoodById(Connection conn, Integer id) {
        Food food = foodDao.queryFoodByid(conn, id);
        return food;
    }

    @Override
    public List<Food> queryFoods(Connection conn) {
        List<Food> foods = foodDao.queryFoods(conn);
        return foods;
    }

    @Override
    public Page<Food> page(Connection conn, int pageNo, int pageSize) {
        Page<Food> page = new Page<>();


        page.setPageSize(pageSize);

        Integer pageTotalCount = foodDao.queryForPageTotalCount(conn);
        page.setPageTotalCount(pageTotalCount);

        Integer pageTotal = pageTotalCount / pageSize;

        if (pageTotalCount % pageSize > 0) {
            pageTotal++;
        }
        page.setPageTotal(pageTotal);


        page.setPageNo(pageNo);

        int begin = (page.getPageNo() - 1) * pageSize;
        List<Food> items = foodDao.queryForPageItems(conn, begin, pageSize);
        page.setItems(items);


        return page;
    }

    @Override
    public Page<Food> pageForSearch(Connection conn,String keys, int pageNo, int pageSize) {

            Page<Food> page = new Page<>();


            page.setPageSize(pageSize);

            Integer pageTotalCount = foodDao.queryForSearchCount(conn, keys);
            page.setPageTotalCount(pageTotalCount);

            Integer pageTotal = pageTotalCount / pageSize;

            if (pageTotalCount % pageSize > 0) {
                pageTotal++;
            }
            page.setPageTotal(pageTotal);


            page.setPageNo(pageNo);

            int begin = (page.getPageNo() - 1) * pageSize;
            List<Food> items = foodDao.queryForSearch(conn, keys, begin, pageSize);
            page.setItems(items);


            return page;

    }
}
