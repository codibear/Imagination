package com.codiibear.imagination.controller;

import com.codiibear.imagination.biz.CompanyBiz;
import com.codiibear.imagination.domian.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by codiibear on 2018/3/19.
 */
@Controller
@RequestMapping(value = "/company")
public class CompanyController {
    @Autowired
    private CompanyBiz companyBiz;

    @RequestMapping(value = "/all")
    public ModelAndView list(){
        List<Company> companyList = companyBiz.findAll();
        System.out.println(companyList);
        ModelAndView mav = new ModelAndView();
        mav.addObject("companylist",companyList);
        mav.setViewName("/companylist");
        return mav;
    }


}
