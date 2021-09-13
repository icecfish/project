package com.igeek.pojo;

import java.math.BigDecimal;

/**
 * @auther zcb
 * @create 2021-08-01 15:50
 */
public class CartItem {
    private Integer id;
    private String foodname;
    private String foodinfo;
    private Integer count;
    private double price;
    private double totalPrice;


    public CartItem() {
    }

    public CartItem(Integer id, String foodname, String foodinfo, Integer count, double price, double totalPrice) {
        this.id = id;
        this.foodname = foodname;
        this.foodinfo = foodinfo;
        this.count = count;
        this.price = price;
        this.totalPrice = totalPrice;
    }

    /**
     * 获取
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取
     * @return foodname
     */
    public String getFoodname() {
        return foodname;
    }

    /**
     * 设置
     * @param foodname
     */
    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

    /**
     * 获取
     * @return foodinfo
     */
    public String getFoodinfo() {
        return foodinfo;
    }

    /**
     * 设置
     * @param foodinfo
     */
    public void setFoodinfo(String foodinfo) {
        this.foodinfo = foodinfo;
    }

    /**
     * 获取
     * @return count
     */
    public Integer getCount() {
        return count;
    }

    /**
     * 设置
     * @param count
     */
    public void setCount(Integer count) {
        this.count = count;
    }

    /**
     * 获取
     * @return price
     */
    public double getPrice() {
        return price;
    }

    /**
     * 设置
     * @param price
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * 获取
     * @return totalPrice
     */
    public double getTotalPrice() {
        return totalPrice;
    }

    /**
     * 设置
     * @param totalPrice
     */
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String toString() {
        return "CartItem{id = " + id + ", foodname = " + foodname + ", foodinfo = " + foodinfo + ", count = " + count + ", price = " + price + ", totalPrice = " + totalPrice + "}";
    }
}
