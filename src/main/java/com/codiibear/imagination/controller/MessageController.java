package com.codiibear.imagination.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by codiibear on 2018/5/3.
 */
@Controller
@RequestMapping(value = "/message")
public class MessageController {
    @RequestMapping("/success")
    public String success(){
        return "/success";
    }
}
