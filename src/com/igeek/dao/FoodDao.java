package com.igeek.dao;


import com.igeek.pojo.Food;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-03 17:43
 */
public interface FoodDao {

    int addFood(Connection conn, Food food);

    int deleteFoodById(Connection conn,Integer id);

    int updateFood(Connection conn, Food food);

    Food queryFoodByid(Connection conn,Integer id);

    List<Food> queryFoods(Connection conn);

    Integer queryForPageTotalCount(Connection conn);

    List<Food> queryForPageItems(Connection conn, int begin, int pageSize);

    Integer queryForSearchCount(Connection conn,String keys);
    List<Food> queryForSearch(Connection conn,String keys,int begin, int pageSize);
}
