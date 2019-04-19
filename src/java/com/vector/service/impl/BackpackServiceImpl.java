/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.BackpackSettingDao;
import com.vector.pojo.BackpackFile;
import com.vector.service.BackpackFileService;
import com.vector.service.BackpackSettingService;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

/**
 *
 * @author Vector
 */
@Transactional
@Service
public class BackpackServiceImpl implements BackpackSettingService {

    @Autowired
    BackpackSettingDao backpackSettingDao;
    @Autowired
    BackpackFileService backpackFileService;

    /**
     *每30分钟备份一次instalhms数据库信息（利用corn表达式控制定时时长）
     */
    @Scheduled(cron = "0 */30 * * * ?")
    @Override
    public void backpack() {
        //String command = "cmd.exe /c C:\\mysql\\bin\\mysqldump  -uroot -p123456  instalhms >D:\\back_1.sql";
        Resource resource = new ClassPathResource("properties/jdbc.properties");
        Properties props = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
        try {
            props = PropertiesLoaderUtils.loadProperties(resource);

            String base = "cmd.exe /c ";
            //String environment = "C:\\mysql\\bin\\";
            String environment = props.getProperty("database.environment");
            String usernameContain = "mysqldump  -u" + props.getProperty("jdbc.username");
            String passwordContain = " -p" + props.getProperty("jdbc.password") + "  instalhms >";

            //或者从数据库
            String savePath = props.getProperty("database.save_path");

            String suffix = sdf.format(new Date()) + "backpack.sql";

            //插入数据库的路径
            String path = savePath + suffix;
            BackpackFile backpackFile = new BackpackFile(path, new Date());
            backpackFileService.insert(backpackFile);

            String command = base + environment + usernameContain + passwordContain + savePath + suffix;
            System.out.println(command);
            Runtime javaRuntime = Runtime.getRuntime();
            Process pr = javaRuntime.exec(command);

        } catch (IOException ex) {
            System.out.println(ex);
        }
    }

    /**
     * 还原数据库备份
     *
     * @param backpackFileId
     * @return
     */
    @Override
    public boolean restore(Serializable backpackFileId) {
        //            String command="cmd.exe /c C:\\mysql\\bin\\mysql -uroot -p123456  instalHMS< D:\\2019_04_18_04_28_49backpack.sql";
        Resource resource = new ClassPathResource("properties/jdbc.properties");
        Properties props = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
        try {
            props = PropertiesLoaderUtils.loadProperties(resource);

            String base = "cmd.exe /c ";//java调用命令行必须
            //String environment = "C:\\mysql\\bin\\";
            String environment = props.getProperty("database.environment");//mysql安装位置
            String usernameContain = "mysql  -u" + props.getProperty("jdbc.username");
            String passwordContain = " -p" + props.getProperty("jdbc.password") + "  instalhms<";
            //String sqlPath = "D:\\2019_04_18_04_28_49backpack.sql";
            String sqlPath = backpackFileService.getBackpackFileById(backpackFileId).getBackpackFilePath();

            String command = base + environment + usernameContain + passwordContain + sqlPath;//完整的cmd命令行

            System.out.println(command);
            Runtime javaRuntime = Runtime.getRuntime();
            Process pr = javaRuntime.exec(command);
            return true;
        } catch (IOException ex) {
            System.out.println(ex);
            return false;
        }
    }

    /**
     * 测试方法没用到
     *
     * @return
     */
    public boolean test() {
        Resource resource = new ClassPathResource("properties/jdbc.properties");
        Properties props = null;
        try {
            props = PropertiesLoaderUtils.loadProperties(resource);
            props.setProperty("abc", "123456");
            System.out.println(resource.getFilename());
            System.out.println(resource.getURI());
            System.out.println(resource.getURL());
            String filePath = resource.getURI().toString().substring(6);
            System.out.println(filePath);
            props.store(new FileOutputStream(filePath), "");

            return true;
        } catch (IOException ex) {
            System.out.println(ex);
            return false;
        }
    }

    /**
     * 获取配置文件的备份设置
     *
     * @return
     */
    @Override
    public Map getSetting() {
        Resource resource = new ClassPathResource("properties/jdbc.properties");
        Properties props = null;
        try {
            ModelMap map = new ModelMap();
            props = PropertiesLoaderUtils.loadProperties(resource);
            map.addAttribute("environment", props.getProperty("database.environment"));
            map.addAttribute("save_path", props.getProperty("database.save_path"));
            return map;
        } catch (IOException ex) {
            System.out.println(ex);
            return null;
        }

    }

}
