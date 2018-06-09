package com.codiibear.imagination.util;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by codiibear on 2018/5/1.
 */
public class temp {

    private static final long serialVersionUID = 1L;
    private File upload;  //文件
    private String uploadCOntentType; //文件类型
    private String uploadFileName;  //文件名
    private String uploadImageUrl = "upload/uploadImg";
    private String uploadFileUrl = "upload/uploadFile";
    @RequestMapping(value = "/uploadImg")
    public String uploadimg(HttpServletResponse response, HttpServletRequest request){
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }

        Aboutfile af = new Aboutfile();

        String callback = request.getParameter("CKEditorFuncNum");
        String expandedName = af.getfileSuffix(uploadFileName);  //sdfdasf
        if(!af.isPic(expandedName)){
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                    + ",''," + "'文件格式不正确（必须为图片）');");
            out.println("</script>");
            return null;
        }
        if(upload.length() > (2*1024 * 1024)) {//对图片大小进行限制
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                    + ",''," + "'文件大小不得大于2M');");
            out.println("</script>");
            return null;
        }

        //图片上传路径
        String realPath = request.getSession().getServletContext().getRealPath(uploadImageUrl) ;
        File realPathFile = new File(realPath) ;

        //判断是否存在
        if(!realPathFile.exists()) {
            realPathFile.mkdirs() ;
        }
        String fileName = System.currentTimeMillis()+""; //时间命名法
        fileName+=("."+expandedName);
        String fileLocation = realPath+"/"+fileName;
        int result = 0;
        try {
            result = af.upFile(upload,fileLocation);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(result == 1){
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                    + ",'" + request.getContextPath() + uploadImageUrl+"/" + fileName + "','')");
            out.println("</script>");
            return null;
        } else{
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                    + ",''," + "'文件上传错误');");
            out.println("</script>");
            return null;
        }
    }











    @RequestMapping(value = "/visit")
    public String visteditor(){
        return "/ckeditor";
    }
    @RequestMapping(value = "/UploadRichEditorFile")
    public void UploadRichEditorFile(int ckEditorFuncNum,HttpServletRequest request , HttpServletResponse response){
        String fileUrl ="sd";
    }

    @RequestMapping("/upload")
    public String upload(@RequestParam(value="file",required = false) MultipartFile multipartFile , HttpServletRequest request , HttpServletResponse response) {

        response.setCharacterEncoding("UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String callback = request.getParameter("CKEditorFuncNum");

        //获得response,request
        Map<String,Object> m = new HashMap<String,Object>();

        ////
        //if()


        String originalFileName = null;
        String fileExtensionName = null;
       /* for(MultipartFile file) {   //--------
            if (file.getSize()>10*1024*1024){
                out.println("<script type =\"text/javascript\">");
                out.println("window.parent.CKEDITOR.tools.callFuncion("+callback+",'',");
            }
        }*/



        /*----------------*/

        //获取某个文件夹的真实路径
        String realPath = request.getSession().getServletContext().getRealPath("/upload") ;

        File realPathFile = new File(realPath) ;

        //判断是否存在
        if(!realPathFile.exists()) {
            realPathFile.mkdirs() ;
        }


        //获取文件的全名
        String fileName = multipartFile.getOriginalFilename() ;

        //截取文件的扩展名
        String ext = fileName.substring(fileName.lastIndexOf(".")) ;

        //通过UUID拼合新的文件名
        String newFileName = UUID.randomUUID().toString() + ext ;

        //将文件名和路径进行组合，形成新的路径
        File newFile = new File(realPath,newFileName) ;

        System.out.println(newFileName);
        /*System.out.println(">>" + multipartFile.getContentType() + "," + multipartFile.getName()
                                          + ","  + multipartFile.getOriginalFilename() + ","
                                            + multipartFile.getSize());*/


        //将文件上传到新的路径之下
        try {
            multipartFile.transferTo(newFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success" ;
    }
}
