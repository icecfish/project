package com.igeek.utils;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @auther zcb
 * @create 2021-07-30 8:58
 */
public class WebUtils {
    public static <T> T copyParamToBean(Map value,T t){

        try {
            BeanUtils.populate(t,value);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return t;
    }

    public static int parseInt(String strInt,int defaultValue){
        try {
            return Integer.parseInt(strInt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return defaultValue;
    }
}
