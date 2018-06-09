package com.codiibear.imagination.biz;

import com.codiibear.imagination.domian.Imagination;

import java.util.List;

/**
 * Created by codiibear on 2018/4/30.
 */
public interface ImaginationBiz {
    void saveIma(Imagination imagination);
    List<Imagination> findAll();
    Imagination findOne();

}
