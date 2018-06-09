package com.codiibear.imagination.dao;

import com.codiibear.imagination.domian.Company;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by codiibear on 2018/3/19.
 */
@Repository
public interface CompanyDao {
    List<Company> findAll();
    void save();
}
