package com.codiibear.imagination.controller;

import com.codiibear.imagination.util.Aboutfile;
import com.codiibear.imagination.util.ImageUploadUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by codiibear on 2018/4/30.
 */
@Controller
@RequestMapping(value = "/ckeditor")
public class CkEditorController {

    private static final String FILE_UPLOAD_DIR = "/upload";
    private static final String FILE_UPLOAD_SUB_IMG_DIR = "/img";
    private static final String FOR_RESOURCES_LOAD_DIR = "/resources";
    private static final long MAX_FILE_SIZE = 1024 * 1024 * 2;
    //每个上传子目录保存的文件的最大数目
    private static final int MAX_NUM_PER_UPLOAD_SUB_DIR = 500;
    //系统默认建立和使用的以时间字符串作为文件名称的时间格式
    private static final String DEFAULT_SUB_FOLDER_FORMAT_AUTO = "yyyyMMdd";
    //这里扩充一下格式，防止手动建立的不统一
    private static final String DEFAULT_SUB_FOLDER_FORMAT_NO_AUTO = "yyyy-MM-dd";

    @RequestMapping(method = RequestMethod.GET)
    public void processUpload(ModelMap modelMap, HttpServletRequest request,
                              HttpServletResponse response) {
        processUploadPost(modelMap, request, response);
        return;
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST)
    public void processUploadPost(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }
        String realPath = request.getSession().getServletContext().getRealPath("/upload");
        System.out.println("realptah " + realPath);

        File folder = new File(realPath);
        System.out.println(folder);

        /*//判断是否存在
        if(!folder.exists()) {
            folder.mkdirs() ;
        }*/

        //File  folder = buildFolder(request);
        /*if (null == folder){

            return;
        }*/
        try {
            response.setContentType("text/html; charset=UTF-8");
            response.setHeader("CACHE-Control", "no-cache");
            PrintWriter out = response.getWriter();
            ///上传文件返回地址
            String fileUrl = "";
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
            servletFileUpload.setFileSizeMax(MAX_FILE_SIZE);

            List<FileItem> fileItems = servletFileUpload.parseRequest(request);

            if (null == fileItems || 0 == fileItems.size()) {
                return;
            }

            Iterator<FileItem> fileitemIndex = fileItems.iterator();
            if (fileitemIndex.hasNext()) {
                FileItem file = fileitemIndex.next();
                if (file.isFormField()) {
                    System.out.println("上传文件非法");
                }
                String fileClientName = getFileName(file.getName());
                String fileSuffix = StringUtils.substring(fileClientName,
                        fileClientName.lastIndexOf(".") + 1);
                if (!StringUtils.equalsIgnoreCase(fileSuffix, "jpg")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "jpeg")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "bmp")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "gif")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "png")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "txt")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "doc")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "docx")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "xls")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "xlsx")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "csv")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "ppt")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "pptx")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "pdf")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "wps")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "et")
                        && !StringUtils.equalsIgnoreCase(fileSuffix, "dps")) {
                    System.out.println("上传文件的格式错误=" + fileSuffix);
                    out.println("<script type=\"text/javascript\">alert('格式错误，仅支持jpg|jpeg|bmp|gif|png|txt|doc|docx|xls|xlsx|csv|ppt|pptx|pdf|wps|et|dps格式');</script>");
                    out.flush();
                    out.close();
                    return;
                }

                String fileServrName = generateFileName(folder, fileSuffix);
                // 为了客户端已经设置好了图片名称在服务器继续能够明确识别，这里不改名称
                File newfile = new File(folder, fileServrName);
                file.write(newfile);

                // 组装返回url，以便于ckeditor定位图片
                //fileUrl = FILE_UPLOAD_DIR + "/" + folder.getName() + "/" + newfile.getName();
                fileUrl = folder.getName() + "/" + newfile.getName();
                fileUrl = StringUtils.replace(fileUrl, "//", "/");
                fileUrl = request.getContextPath() + fileUrl;

                // 将上传的图片的url返回给ckeditor  parent
                String callback = request.getParameter("CKEditorFuncNum");
                out.println("<script type=\"text/javascript\">");
                out.println("window.opener.CKEDITOR.tools.callFunction("
                        + callback + ",'" + fileUrl + "',''" + ")");
                out.println("</script>");
            }

            out.flush();
            out.close();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return;

    }

    private String generateFileName(File folder, String suffix) {
        String filename;
        File file;
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
        String base = format.format(date);
        filename = base + "." + suffix;
        file = new File(filename);
        int i = 1;
        while (file.exists()) {
            filename = String.format("%s_%d.%s", base, i, suffix);
            i++;
        }
        return filename;
    }

    /**
     * 获取文件名称
     *
     * @param str
     * @return
     */
    private String getFileName(String str) {
        int index = str.lastIndexOf("//");
        if (-1 != index) {
            return str.substring(index);
        } else {
            return str;
        }
    }

    /**
     * 创建目录
     *
     * @return
     */
    private File buildFolder(HttpServletRequest request) {
        // 这里照顾一下CKEDITOR，由于ftl放置位置的原因，这里必须要在freemarker目录下才能被加载到图片，否则虽然可以正常上传和使用，但是
        // 在控件中无法正常操作
        String realPath = request.getSession().getServletContext()
                .getRealPath(FILE_UPLOAD_DIR);

        System.out.println("realPath" + realPath);

        // 一级目录，如果不存在，创建
        File firstFolder = new File(realPath);
        if (!firstFolder.exists()) {
            if (!firstFolder.mkdir()) {
                return firstFolder;
            }
        }

        // 二级目录，如果不存在，创建
        String folderdir = realPath + FILE_UPLOAD_DIR + FILE_UPLOAD_SUB_IMG_DIR;
        if (true) {
            System.out.println("folderdir" + folderdir);
        }

        if (StringUtils.isBlank(folderdir)) {
            System.out.println("路径错误:" + folderdir);
            return null;
        }

        File floder = new File(folderdir);
        if (!floder.exists()) {
            if (!floder.mkdir()) {
                System.out.println("创建文件夹出错！path=" + folderdir);
                return null;
            }

        }
        // 再往下的文件夹都是以时间字符串来命名的，所以获取最新时间的文件夹即可
        String[] files = floder.list();
        if (null != files && 0 < files.length) {
            // 含有子文件夹，则获取最新的一个
            Date oldDate = null;
            int index = -1;
            for (int i = 0; i < files.length; i++) {
                String fileName = files[i];

                try {
                    Date thisDate = DateUtils.parseDate(fileName, new String[]{
                            DEFAULT_SUB_FOLDER_FORMAT_AUTO, DEFAULT_SUB_FOLDER_FORMAT_NO_AUTO});
                    if (oldDate == null) {
                        oldDate = thisDate;
                        index = i;
                    } else {
                        if (thisDate.after(oldDate)) {
                            // 保存最新的时间和数组中的下标
                            oldDate = thisDate;
                            index = i;
                        }
                    }
                } catch (Exception e) {
                    // 这里异常吃掉，不用做什么，如果解析失败，会建立新的文件夹，防止人为的建立文件夹导致的异常。
                }
            }// for

            // 判断当前最新的文件夹下是否已经存在了最大数目的图片
            if (null != oldDate && -1 != index) {
                File pointfloder = new File(folderdir + File.separator
                        + files[index]);
                if (!pointfloder.exists()) {
                    if (!pointfloder.mkdir()) {
                        System.out.println("创建文件夹出错！path=" + folderdir);
                        return null;
                    }
                }

                // 如果文件夹下的文件超过了最大值，那么也需要新建一个文件夹
                String[] pointfloderFiles = pointfloder.list();
                if (null != pointfloderFiles
                        && MAX_NUM_PER_UPLOAD_SUB_DIR < pointfloderFiles.length) {
                    return buildNewFile(folderdir);
                }

                return pointfloder;
            }

            // 查找当前子文件夹失败，新建一个
            return buildNewFile(folderdir);
        } else {
            // 不含有子文件夹，新建一个，通常系统首次上传会有这个情况
            return buildNewFile(folderdir);
        }

    }

    /**
     * 创建一个新文件
     *
     * @param path
     * @return
     */
    private File buildNewFile(String path) {
        // 不含有子文件夹，新建一个，通常系统首次上传会有这个情况
        File newFile = buildFileBySysTime(path);
        if (null == newFile) {
            System.out.println("创建文件夹失败！newFile=" + newFile);
        }

        return newFile;
    }

    /**
     * 根据当前的时间建立文件夹，时间格式yyyyMMdd
     *
     * @param path
     * @return
     */
    private File buildFileBySysTime(String path) {
        DateFormat df = new SimpleDateFormat(DEFAULT_SUB_FOLDER_FORMAT_AUTO);
        String fileName = df.format(new Date());
        File file = new File(path + File.separator + fileName);
        if (!file.mkdir()) {
            return null;
        }
        return file;
    }

    @RequestMapping(value = "/visit")
    public String vis() {
        return "/ckeditor";
    }

    @RequestMapping(value = "/cke")
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

}
