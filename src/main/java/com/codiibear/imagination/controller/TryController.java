package com.codiibear.imagination.controller;

import com.codiibear.imagination.util.ImageUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by codiibear on 2018/5/1.
 */
@Controller
@RequestMapping("/try")
public class TryController {
    @RequestMapping(method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
        String DirectoryName = "upload/";
        try {
            ImageUploadUtil.ckeditor(request, response, DirectoryName);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/ui")
    public String vi(){
        return "/cke";
    }
}
