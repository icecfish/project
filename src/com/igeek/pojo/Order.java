package com.igeek.pojo;

import java.util.Date;

/**
 * @auther zcb
 * @create 2021-08-05 11:44
 */
public class Order {
    private String orderId;
    private Date createtime;
    private Double price;
    private String status="未付款";
    private Integer userId;


    public Order() {
    }

    public Order(String orderId, Date createtime, Double price, String status, Integer userId) {
        this.orderId = orderId;
        this.createtime = createtime;
        this.price = price;
        this.status = status;
        this.userId = userId;
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

    /**
     * 获取
     * @return createtime
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * 设置
     * @param createtime
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * 获取
     * @return price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 设置
     * @param price
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 获取
     * @return status
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置
     * @param status
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取
     * @return userId
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String toString() {
        return "Order{orderId = " + orderId + ", createtime = " + createtime + ", price = " + price + ", status = " + status + ", userId = " + userId + "}";
    }
}
