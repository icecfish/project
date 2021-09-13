package com.igeek.pojo;

import java.util.List;


public class Page<T> {

    private String query1;//菜名

    public static final Integer PAGE_SIZE=8;
    private Integer pageNo;
    private Integer pageTotal;
    private Integer pageSize = PAGE_SIZE;
    private Integer pageTotalCount;
    private List<T> items;

    public Page() {
    }

    public Page(Integer pageNo, Integer pageTotal, Integer pageSize, Integer pageTotalCount, List<T> items) {

        this.pageNo = pageNo;
        this.pageTotal = pageTotal;
        this.pageSize = pageSize;
        this.pageTotalCount = pageTotalCount;
        this.items = items;
    }

    public String getQuery1() {
        return query1;
    }

    public void setQuery1(String query1) {
        this.query1 = query1;
    }

    public Integer getPageNo() {
        return pageNo;
    }


    public void setPageNo(Integer pageNo) {
        if(pageNo<1){
            pageNo=1;
        }else if(pageNo>pageTotal){
            pageNo=pageTotal;
        }

        this.pageNo = pageNo;
    }


    public Integer getPageTotal() {
        return pageTotal;
    }


    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }


    public Integer getPageSize() {
        return pageSize;
    }


    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }


    public Integer getPageTotalCount() {
        return pageTotalCount;
    }


    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }


    public List<T> getItems() {
        return items;
    }


    public void setItems(List<T> items) {
        this.items = items;
    }

    public String toString() {
        return "Page{PAGE_SIZE = " + PAGE_SIZE + ", pageNo = " + pageNo + ", pageTotal = " + pageTotal + ", pageSize = " + pageSize + ", pageTotalCount = " + pageTotalCount + ", items = " + items + "}";
    }
}
