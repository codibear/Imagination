package com.codiibear.imagination.biz;

import com.codiibear.imagination.domian.Company;

import java.util.List;

/**
 * Created by codiibear on 2018/3/19.
 */
public interface CompanyBiz {
    List<Company> findAll();
    void save();
}
