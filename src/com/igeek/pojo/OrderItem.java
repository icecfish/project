package com.igeek.pojo;

/**
 * @auther zcb
 * @create 2021-08-05 11:46
 */
public class OrderItem {
    private Integer id;
    private String name;
    private Integer count;
    private double price;
    private double totalPrice;
    private String orderId;


    public OrderItem() {
    }

    public OrderItem(Integer id, String name, Integer count, double price, double totalPrice, String orderId) {
        this.id = id;
        this.name = name;
        this.count = count;
        this.price = price;
        this.totalPrice = totalPrice;
        this.orderId = orderId;
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
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
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

    /**
     * 获取
     * @return orderId
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * 设置
     * @param orderId
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String toString() {
        return "OrderItem{id = " + id + ", name = " + name + ", count = " + count + ", price = " + price + ", totalPrice = " + totalPrice + ", orderId = " + orderId + "}";
    }
}
