package com.codiibear.imagination.biz;

import com.codiibear.imagination.domian.Customer;

import java.util.List;

/**
 * Created by codiibear on 2018/3/19.
 */
public interface CustomerBiz {
    List<Customer> findAll();
    /*登录*/
    Customer findOne(Customer customer);
    /*注册*/
    void saveUser(Customer customer);
    /*注册查重*/
    Customer findByName(Customer customer);
}
