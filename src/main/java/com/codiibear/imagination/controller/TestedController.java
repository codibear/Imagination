package com.codiibear.imagination.controller;

import com.codiibear.imagination.biz.TestBiz;
import com.codiibear.imagination.domian.Tested;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by codiibear on 2018/3/13.
 */
@Controller
public class TestedController {
    @Autowired
    private TestBiz testBiz;

    @RequestMapping("user/list")
    public ModelAndView list(){
        List<Tested> testeds = testBiz.findAll();
        System.out.println(testeds);
        ModelAndView mav = new ModelAndView();
        mav.addObject("testeds",testeds);
        mav.setViewName("/list");
        return mav;
    }

    @RequestMapping("use/save")
    public String save(@PathVariable Tested tested){
        System.out.println(tested);
        System.out.println(tested.getSomename());
        return "list";
    }
}
