package com.igeek.pojo;



/**
 * @auther zcb
 * @create 2021-08-03 17:38
 */
public class Food {
    private Integer id;
    private String foodname;
    private String foodinfo;
    private double price;
    private String imgPath="bootstrap/img/foodimg/3.jpg";
    private Integer catelogId;

    public Food() {
    }

    public Food(Integer id, String foodname, String foodinfo, double price, String imgPath, Integer catelogId) {
        this.id = id;
        this.foodname = foodname;
        this.foodinfo = foodinfo;
        this.price = price;
        this.imgPath = imgPath;
        this.catelogId = catelogId;
    }

    public Food(String foodname, String foodinfo, double price, String imgPath, Integer catelogId) {
        this.foodname = foodname;
        this.foodinfo = foodinfo;
        this.price = price;
        this.imgPath = imgPath;
        this.catelogId = catelogId;
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
     * @return imgPath
     */
    public String getImgPath() {
        return imgPath;
    }

    /**
     * 设置
     * @param imgPath
     */
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    /**
     * 获取
     * @return catelogId
     */
    public Integer getCatelogId() {
        return catelogId;
    }

    /**
     * 设置
     * @param catelogId
     */
    public void setCatelogId(Integer catelogId) {
        this.catelogId = catelogId;
    }

    public String toString() {
        return "Food{id = " + id + ", foodname = " + foodname + ", foodinfo = " + foodinfo + ", price = " + price + ", imgPath = " + imgPath + ", catelogId = " + catelogId + "}";
    }
}
