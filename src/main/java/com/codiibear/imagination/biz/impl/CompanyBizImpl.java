package com.codiibear.imagination.biz.impl;

import com.codiibear.imagination.biz.CompanyBiz;
import com.codiibear.imagination.dao.CompanyDao;
import com.codiibear.imagination.domian.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by codiibear on 2018/3/19.
 */
@Service
public class CompanyBizImpl implements CompanyBiz{
    @Autowired
    private CompanyDao companyDao;


    @Override
    public List<Company> findAll() {
        return companyDao.findAll();
    }

    @Override
    public void save() {

    }
}
