package com.codiibear.imagination.controller;

import com.alibaba.fastjson.JSON;
import com.codiibear.imagination.biz.ImaginationBiz;
import com.codiibear.imagination.domian.Imagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by codiibear on 2018/5/1.
 */
@Controller
@RequestMapping("/imag")
public class ImaginationController {
    @Autowired
    private ImaginationBiz imaginationBiz;


    @RequestMapping(value = "/article")
    public ModelAndView article(@RequestParam("imacontent")String imacontent){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("article");
        mav.addObject("articlecontent",imacontent);
        return mav;

    }


    @RequestMapping("/saveima")
    public void saveImg(Imagination imagination){
        imaginationBiz.saveIma(imagination);
    }


    @RequestMapping("/visit")
    public String visit(){
        return "/imagination";
    }


    @RequestMapping(value = "/all")
    public @ResponseBody List<Imagination> getAll(HttpServletRequest request){
        List<Imagination> imaglistt = imaginationBiz.findAll();
        System.out.println(JSON.toJSONString(imaglistt));
        /*HttpSession session = request.getSession();
        session.setAttribute("imaglist",JSON.toJSONString(list));
        //request.setAttribute("imaglist",JSON.toJSONString(list));
        System.out.println(session.getAttribute("imaglist"));*/
        return imaglistt;
    }
}
