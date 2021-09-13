package com.igeek.service;

import com.igeek.pojo.Food;
import com.igeek.pojo.Page;

import java.awt.print.Book;
import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-03 18:57
 */
public interface FoodService {
    void addFood(Connection conn, Food food);
    void deleteFoodById(Connection conn,Integer id);
    void updateFood(Connection conn,Food food);
    Food queryFoodById(Connection conn,Integer id);
    List<Food> queryFoods(Connection conn);
    Page<Food> page(Connection conn, int pageNo, int pageSize);

    Page<Food> pageForSearch(Connection conn,String keys, int pageNo, int pageSize);
}
