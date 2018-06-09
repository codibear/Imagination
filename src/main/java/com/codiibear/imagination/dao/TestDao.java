package com.codiibear.imagination.dao;

import com.codiibear.imagination.domian.Tested;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by codiibear on 2018/3/13.
 */
@Repository
public interface TestDao {

    List<Tested> findAll();
    void save(Tested tested);
}
