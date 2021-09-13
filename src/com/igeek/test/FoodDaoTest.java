package com.igeek.test;

import com.igeek.Impl.FoodDaoImpl;
import com.igeek.dao.FoodDao;
import com.igeek.pojo.Food;
import com.igeek.utils.JDBCUtils;
import org.junit.Test;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import static org.junit.Assert.*;

/**
 * @auther zcb
 * @create 2021-08-03 20:06
 */
public class FoodDaoTest {
    FoodDao foodDao= new FoodDaoImpl();
    @Test
    public void addFood() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            Food food= new Food("葱油拌面","香的一塌糊涂",5,"/bootstrap/img/foodimg/1.jpg",1);
            foodDao.addFood(conn,food);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Test
    public void deleteFoodById() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            foodDao.deleteFoodById(conn,6);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Test
    public void updateFood() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            Food food= new Food(5,"葱油拌面","香的一塌糊涂,但是容易腻",5,"/bootstrap/img/foodimg/1.jpg",1);
            foodDao.updateFood(conn,food);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Test
    public void queryFoodByid() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            Food food = foodDao.queryFoodByid(conn, 1);
            System.out.println(food);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Test
    public void queryFoods() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            List<Food> foods = foodDao.queryFoods(conn);
            System.out.println(foods);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Test
    public void queryForPageTotalCount() {
    }

    @Test
    public void queryForPageItems() {
    }
}