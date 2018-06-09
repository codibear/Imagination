package com.codiibear.imagination.biz.impl;

import com.codiibear.imagination.biz.CustomerBiz;
import com.codiibear.imagination.dao.CustomerDao;
import com.codiibear.imagination.domian.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by codiibear on 2018/3/19.
 */
@Service
public class CustomerBizImpl implements CustomerBiz{
    @Autowired
    private CustomerDao customerDao;
    @Override
    public List<Customer> findAll() {
        return customerDao.findAll();
    }

    @Override
    public Customer findOne(Customer customer) {
        return customerDao.findOne(customer);
    }

    @Override
    public void saveUser(Customer customer) {
        customerDao.saveUser(customer);
    }

    @Override
    public Customer findByName(Customer customer) {
        return customerDao.findByName(customer);
    }
}
