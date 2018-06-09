package com.codiibear.imagination.biz.impl;

import com.codiibear.imagination.biz.ImaginationBiz;
import com.codiibear.imagination.dao.ImaginationDao;
import com.codiibear.imagination.domian.Imagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by codiibear on 2018/4/30.
 */
@Service
public class ImaginationBizImp implements ImaginationBiz {
    @Autowired
    private ImaginationDao imaginationDao;

    @Override
    public void saveIma(Imagination imagination) {
        imaginationDao.saveIma(imagination);
    }

    @Override
    public List<Imagination> findAll() {
        return imaginationDao.findAll();
    }

    @Override
    public Imagination findOne() {
        return null;
    }
}
