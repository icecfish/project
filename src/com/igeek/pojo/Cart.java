package com.igeek.pojo;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @auther zcb
 * @create 2021-08-01 15:53
 */
public class Cart {
//    private Integer totalCount;
//    private BigDecimal totalPrice;
    private Map<Integer,CartItem> items = new LinkedHashMap<>();

    public Cart() {
    }

    public Cart(Map<Integer, CartItem> items) {
//        this.totalCount = totalCount;
//        this.totalPrice = totalPrice;
        this.items = items;
    }
    /**
     * 获取
     * @return totalCount
     */
    public Integer getTotalCount() {
        Integer totalCount=0;
        for(Map.Entry<Integer,CartItem>entry : items.entrySet()){
            totalCount+=entry.getValue().getCount();
        }
        return totalCount;
    }


    /**
     * 获取
     * @return totalPrice
     */
    public double getTotalPrice() {
        double totalPrice=0;
        for(Map.Entry<Integer,CartItem>entry : items.entrySet()){
            totalPrice=totalPrice+entry.getValue().getTotalPrice();
        }
        return totalPrice;
    }



    /**
     * 获取
     * @return items
     */
    public Map<Integer, CartItem> getItems() {
        return items;
    }

    /**
     * 设置
     * @param items
     */
    public void setItems(Map<Integer, CartItem> items) {
        this.items = items;
    }

    public String toString() {
        return "Cart{totalCount = " + getTotalCount() + ", totalPrice = " + getTotalPrice() + ", items = " + items + "}";
    }

    public void addItem(CartItem cartItem){
        CartItem item = items.get(cartItem.getId());
        if(item==null){
            items.put(cartItem.getId(),cartItem);
        }else {
            item.setCount(item.getCount() + 1);
            item.setTotalPrice(item.getPrice()*item.getCount());
        }
    }
    public void deleteItem(Integer id){
        items.remove(id);
    }

    public void clear(){
        items.clear();
    }

    public void updateCount(Integer id,Integer count){
        CartItem item = items.get(id);
        if(item!=null){
            item.setCount(count);
            item.setTotalPrice(item.getPrice()*item.getCount());
        }
    }



}
