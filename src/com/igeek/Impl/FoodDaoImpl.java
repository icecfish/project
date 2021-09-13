package com.igeek.Impl;

import com.igeek.dao.FoodDao;
import com.igeek.pojo.Food;

import java.sql.Connection;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-03 17:44
 */
public class FoodDaoImpl extends BaseDao implements FoodDao {
    @Override
    public int addFood(Connection conn, Food food) {
        String sql = "insert into t_food(`foodname`,`foodinfo`,`price`,`imgpath`,`catelog_id`) values(?,?,?,?,?)";
        return update(conn,sql,food.getFoodname(),food.getFoodinfo(),food.getPrice(),food.getImgPath(),food.getCatelogId());
    }

    @Override
    public int deleteFoodById(Connection conn, Integer id) {
        String sql="delete from t_food where id = ?";
        return update(conn,sql,id);
    }

    @Override
    public int updateFood(Connection conn, Food food) {
        if(food.getImgPath()==null){
            String sql="update t_food set `foodname`=?,`foodinfo`=?,`price`=?,`catelog_id`=? where id =?";
            return update(conn,sql,food.getFoodname(),food.getFoodinfo(),food.getPrice(),food.getCatelogId(),food.getId());
        }else{

            String sql="update t_food set `foodname`=?,`foodinfo`=?,`price`=?,`imgpath`=?,`catelog_id`=? where id =?";
            return update(conn,sql,food.getFoodname(),food.getFoodinfo(),food.getPrice(), food.getImgPath(),food.getCatelogId(),food.getId());
        }
    }

    @Override
    public Food queryFoodByid(Connection conn, Integer id) {
        String sql = "select `id` , `foodname` , `foodinfo` , price , `imgpath` imgPath,`catelog_id` catelogId from t_food where id = ?";
        return querydForOne(Food.class,conn,sql,id);
    }

    @Override
    public List<Food> queryFoods(Connection conn) {
        String sql="select `id` , `foodname` , `foodinfo` , `price` , `imgpath` imgPath,catelog_id catelogId from t_food";
        return queryForList(Food.class,conn,sql);
    }

    @Override
    public Integer queryForPageTotalCount(Connection conn) {
        String sql ="select count(*) from t_food";
        Number count = getValue(conn, sql);
        System.out.println(count);
        return count.intValue();
    }

    @Override
    public List<Food> queryForPageItems(Connection conn, int begin, int pageSize) {
        String sql="select `id` , `foodname` , `foodinfo` , `price` , `imgpath` imgPath,catelog_id catelogId from t_food limit ?,?";

        return queryForList(Food.class,conn,sql,begin,pageSize);
    }

    @Override
    public Integer queryForSearchCount(Connection conn,String keys) {
        String sql = "select count(*) from t_food where foodname like concat('%',?,'%')";
        Number count = getValue(conn,sql,keys);
        System.out.println(count);
        return count.intValue();
    }


    @Override
    public List<Food> queryForSearch(Connection conn, String keys,int begin, int pageSize) {
        String sql="select `id` , `foodname` , `foodinfo` , `price` , `imgpath` imgPath,catelog_id catelogId from t_food where foodname like concat('%',?,'%') limit ?,?";

        return queryForList(Food.class,conn,sql,keys,begin,pageSize);
    }
}
