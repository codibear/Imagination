package com.codiibear.imagination.controller;

import com.codiibear.imagination.biz.ImaginationBiz;
import com.codiibear.imagination.domian.Imagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

/**
 * Created by codiibear on 2018/5/3.
 */
@Controller
public class UploadController {

    @Autowired
    ImaginationBiz imaginationBiz;


    @ExceptionHandler(MaxUploadSizeExceededException.class)
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadFileHandler(@RequestParam("file") MultipartFile file, HttpServletRequest request, Imagination imagination) {
        ModelAndView mav = new ModelAndView();
        String newName = null;
        if (!file.isEmpty()) {
            try {
                // 文件存放服务端的位置
                String rootPath = request.getSession().getServletContext().getRealPath("/upload");
                //System.out.println("realptah " + rootPath);
                //String rootPath = "d:/tmp";
                File dir = new File(rootPath);
                if (!dir.exists())
                    dir.mkdirs();
                // 写文件到服务器
                Date date = new Date(System.currentTimeMillis());
                SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
                String base = format.format(date);
                //System.out.println("date"+base);
                String orgName = file.getOriginalFilename();
                String extname = orgName.substring(orgName.lastIndexOf("."));
                newName = base+extname;
                //System.out.println(newName);
                imagination.setImaphoto("/upload/"+newName);
                imaginationBiz.saveIma(imagination);

                System.out.println("获取项目名="+request.getContextPath());
                System.out.println("获取参数="+request.getQueryString());
                System.out.println("获取全路径="+request.getRequestURL());
                File serverFile = new File(dir.getAbsolutePath() + File.separator + newName);
                file.transferTo(serverFile);
                mav.setViewName("/success");
                return mav;
            } catch (MaxUploadSizeExceededException e) {
                e.printStackTrace();
                mav.addObject("msg","文件太大了，要小于1m");
                mav.setViewName("fail");
                return mav;
                //return "You failed to upload " +  newName + " => " + e.getMessage();
            }catch (Exception e){
                e.printStackTrace();
                mav.addObject("msg","出错啦！");
                mav.setViewName("fail");return mav;
            }
        } else {
            mav.setViewName("fail");
            return mav;
        }
    }
}
