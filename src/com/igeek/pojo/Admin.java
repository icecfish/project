package com.igeek.pojo;

public class Admin {
    private int id;
    private String adname;
    private String password;


    public Admin() {
    }

    public Admin(String adname, String password) {
        this.adname = adname;
        this.password = password;
    }

    /**
     * 获取
     * @return id
     */
    public int getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * 获取
     * @return adname
     */
    public String getAdname() {
        return adname;
    }

    /**
     * 设置
     * @param adname
     */
    public void setAdname(String adname) {
        this.adname = adname;
    }

    /**
     * 获取
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    public String toString() {
        return "Admin{id = " + id + ", adname = " + adname + ", password = " + password + "}";
    }
}
