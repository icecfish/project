package com.igeek.pojo;

/**
 * @auther zcb
 * @create 2021-08-04 19:06
 */
public class Catelog {
    private Integer id;
    private String catelogName;
    private String catelogInfo;

    public Catelog() {
    }

    public Catelog(Integer id, String catelogName, String catelogInfo) {
        this.id = id;
        this.catelogName = catelogName;
        this.catelogInfo = catelogInfo;
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
     * @return catelogName
     */
    public String getCatelogName() {
        return catelogName;
    }

    /**
     * 设置
     * @param catelogName
     */
    public void setCatelogName(String catelogName) {
        this.catelogName = catelogName;
    }

    /**
     * 获取
     * @return catelogInfo
     */
    public String getCatelogInfo() {
        return catelogInfo;
    }

    /**
     * 设置
     * @param catelogInfo
     */
    public void setCatelogInfo(String catelogInfo) {
        this.catelogInfo = catelogInfo;
    }

    public String toString() {
        return "catelog{id = " + id + ", catelogName = " + catelogName + ", catelogInfo = " + catelogInfo + "}";
    }
}
