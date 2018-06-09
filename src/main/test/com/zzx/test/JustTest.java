package com.zzx.test;

import com.alibaba.fastjson.JSON;
import org.junit.Test;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by codiibear on 2018/4/30.
 */
public class JustTest {
    @Test
    public void a(){
        Map<String,Object> map = new HashMap<>();
        Map<String,String> map1 = new HashMap<>();
        int arr[] = {10,2};
        map1.put("mesage","sdfsf");
        map.put("upload","1");
        map.put("error",map1);
        map.put("arry",arr);
        String str = JSON.toJSONString(map);
        System.out.println(str);
    }
    @Test
    public void fold(){
        String filename = "D:/a";
        String filename2 = "/upload";
        File file = new File(filename+filename2);
        boolean a = file.exists();
        System.out.println(file);
        file = new File(filename+filename2);
        file.mkdirs();
        System.out.println(file.exists());
        System.out.println(a);

    }

}
