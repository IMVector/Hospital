/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Transactional
@Service
public class BackPackService {

    @Scheduled(cron = "0 */30 * * * ?")
    public void backpack() {
        //String command = "cmd.exe /c C:\\mysql\\bin\\mysqldump  -uroot -p123456  instalhms >D:\\back_1.sql";
        Resource resource = new ClassPathResource("properties/jdbc.properties");
        Properties props = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
        try {
            props = PropertiesLoaderUtils.loadProperties(resource);

            String base = "cmd.exe /c ";
            String environment = "C:\\mysql\\bin\\";
            String usernameContain = "mysqldump  -u" + props.getProperty("jdbc.username");
            String passwordContain = " -p" + props.getProperty("jdbc.password") + "  instalhms >";
            //或者从数据库
            String savePath = props.getProperty("database.save_path");
            
            String suffix = sdf.format(new Date()) + "backpack.sql";

            //插入数据库的路径
            String path=savePath+suffix;
            
            
            String command = base + environment + usernameContain + passwordContain + savePath + suffix;
            System.out.println(command);
            Runtime javaRuntime = Runtime.getRuntime();
            Process pr = javaRuntime.exec(command);

        } catch (IOException ex) {
            System.out.println(ex);
        }
    }

    public boolean restore() {
        //            String command="cmd.exe /c C:\\mysql\\bin\\mysql -uroot -p123456  instalHMS< D:\\2019_04_18_04_28_49backpack.sql";
        Resource resource = new ClassPathResource("properties/jdbc.properties");
        Properties props = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
        try {
            props = PropertiesLoaderUtils.loadProperties(resource);

            String base = "cmd.exe /c ";
            String environment = "C:\\mysql\\bin\\";
            String usernameContain = "mysql  -u" + props.getProperty("jdbc.username");
            String passwordContain = " -p" + props.getProperty("jdbc.password") + "  instalhms<";
            //从数据库中查找
            String sqlPath = "D:\\2019_04_18_04_28_49backpack.sql";

            String command = base + environment + usernameContain + passwordContain + sqlPath;
            
            System.out.println(command);
            Runtime javaRuntime = Runtime.getRuntime();
            Process pr = javaRuntime.exec(command);
            return true;
        } catch (IOException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public boolean test_1() {
        Resource resource = new ClassPathResource("properties/jdbc.properties");
        Properties props = null;
        try {
            props = PropertiesLoaderUtils.loadProperties(resource);
            props.setProperty("abc", "123456");
            System.out.println(resource.getFilename());
            System.out.println(resource.getURI());
            System.out.println(resource.getURL());
            String filePath =resource.getURI().toString().substring(6);
            System.out.println(filePath);
            props.store( new FileOutputStream(filePath), "");

            return true;
        } catch (IOException ex) {
            System.out.println(ex);
            return false;
        }
    }
}
