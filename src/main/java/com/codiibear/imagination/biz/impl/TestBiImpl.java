package com.codiibear.imagination.biz.impl;

import com.codiibear.imagination.biz.TestBiz;
import com.codiibear.imagination.dao.TestDao;
import com.codiibear.imagination.domian.Tested;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by codiibear on 2018/3/13.
 */
@Service
public class TestBiImpl implements TestBiz{
    @Autowired
    private TestDao testDao;

    @Override
    public List<Tested> findAll() {
        return testDao.findAll();
    }

    @Override
    public void save(Tested tested) {
        testDao.save(tested);
    }
}
