package com.codiibear.imagination.biz;

import com.codiibear.imagination.domian.Tested;

import java.util.List;

/**
 * Created by codiibear on 2018/3/13.
 */
public interface TestBiz {
    List<Tested> findAll();
    void save(Tested tested);}
