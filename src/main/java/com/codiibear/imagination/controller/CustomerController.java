package com.codiibear.imagination.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.codiibear.imagination.biz.CustomerBiz;
import com.codiibear.imagination.biz.ImaginationBiz;
import com.codiibear.imagination.domian.Customer;
import com.codiibear.imagination.domian.Imagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by codiibear on 2018/3/19.
 */
@Controller
//@SessionAttributes(value = {"user"} ,types = {String.class})
@RequestMapping(value = "/customer")
public class CustomerController {
    @Autowired
    private CustomerBiz customerBiz;

    @Autowired
    private ImaginationBiz imaginationBiz;

    @RequestMapping(value = "/all")
    public ModelAndView all(){
        List<Customer> customerList = customerBiz.findAll();
        System.out.println(customerList);
        ModelAndView mav = new ModelAndView();
        mav.addObject("customerlist",customerList);
        mav.setViewName("/customerlist");
        return mav;
    }


    /*进入登录界面*/
    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }
    /*进入注册界面*/
    @RequestMapping(value = "/register")
    public String register(){
        return "register";
    }

    @ResponseBody
    @RequestMapping(value = "/checknaccount")
    public Customer checkaccount (Customer customer, HttpSession httpSession) throws Exception{
        Customer cus = null;
        String user = null;
        try {
            cus = customerBiz.findOne(customer);
            httpSession.setAttribute("user",cus);
        }catch (Exception e){
            return null;
        }
            return cus;
    }

    /*登录传入数据*/
    @RequestMapping(value = "/index")
    public ModelAndView userlogin(Customer customer){
        Customer cus = customerBiz.findOne(customer);
        ModelAndView mav = new ModelAndView();
        mav.addObject("customer",cus);
        List<Imagination> imag = imaginationBiz.findAll();
        mav.addObject("imaglist",imag);
        System.out.println(cus);
        mav.setViewName("/index");
        return mav;
    }

    /*注册防止重复*/
    @ResponseBody
    @RequestMapping(value = "/checkregister")
    public String checkregister(Customer customer){
        Map<String,String> map = new HashMap<> ();
        map.put("valid","false");
        Customer cus = customerBiz.findByName(customer);
        try {
            cus.getUsername();
        }catch (Exception e){
            map.put("valid","true");
        }
        return JSON.toJSONString(map);
    }

    /*注册传值*/
    @RequestMapping(value = "/userregister")
    public ModelAndView userregister(Customer customer,HttpSession session){
        customerBiz.saveUser(customer);
        Customer cus = customerBiz.findOne(customer);
        System.out.println(cus);
        session.setAttribute("user",cus);
        ModelAndView mav = new ModelAndView();
        mav.addObject("customer",customer);
        System.out.println(customer);
        mav.setViewName("/index");
        return mav;
    }
}
