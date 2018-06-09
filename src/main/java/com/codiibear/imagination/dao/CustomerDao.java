package com.codiibear.imagination.dao;

import com.codiibear.imagination.domian.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by codiibear on 2018/3/19.
 */
@Repository
public interface CustomerDao {
    List<Customer> findAll();
    /*登录*/
    Customer findOne(Customer customer);
    /*注册*/
    void saveUser(Customer customer);
    /*注册查重*/
    Customer findByName(Customer customer);

}
