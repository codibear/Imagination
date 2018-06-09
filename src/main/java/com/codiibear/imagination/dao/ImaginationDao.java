package com.codiibear.imagination.dao;

import com.codiibear.imagination.domian.Imagination;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by codiibear on 2018/4/30.
 */
@Repository
public interface ImaginationDao {
    void saveIma(Imagination imagination);
    List<Imagination> findAll();
    Imagination findOne();


}
