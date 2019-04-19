/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.BackpackFile;
import com.vector.pojo.Image;
import com.vector.service.BackpackFileService;
import com.vector.service.BackpackSettingService;
import com.vector.service.ImageService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Vector
 */
@Controller
public class AdminController {

    @Autowired
    private ImageService imageService;

    @Autowired
    BackpackFileService backpackFileService;
    
    @Autowired
    BackpackSettingService backpackSettingService;
///////////////////////////////////图像管理/////////////////////////////////////////////////////
    @RequestMapping(value = "/imageList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Image> getImageList(@PathVariable Integer currentPage) {
        return imageService.getList(currentPage);
    }

    @RequestMapping(value = "/imageListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer getImageListItemNum() {
        return imageService.getListItemNumber();
    }

    @RequestMapping(value = "/updateImage", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateImage(Image image) {
        return imageService.update(image);
    }

    @RequestMapping(value = "/deleteImage/{departmentId}", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteImage(@PathVariable Integer imageId) {
        return imageService.delete(imageId);
    }

    @RequestMapping(value = "/getFirstPageImage", method = RequestMethod.POST)
    @ResponseBody
    public List<Image> getFirstPageImage() {
        return imageService.getFirstPageImage();
    }

    @RequestMapping(value = "/getLogo", method = RequestMethod.POST)
    @ResponseBody
    public Image getLogo() {
        return imageService.getImageById(4);
    }
//////////////////////////////////////////管理员跳页//////////////////////////////////
    @RequestMapping(value = "/admin/{page}", method = RequestMethod.GET)
    public String changePage(@PathVariable String page) {
        System.out.println(page);
        return page;
    }
////////////////////////////////////////数据库备份相关///////////////////////////////
    @RequestMapping(value = "/databaseBackpackFileList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<BackpackFile> getDatabaseBackpackFileList(@PathVariable Integer currentPage) {
        return backpackFileService.getList(currentPage);
    }

    @RequestMapping(value = "/backpackFileListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer getBackpackFileListIntemNum() {
        return backpackFileService.getListItemNumber();
    }

    @RequestMapping(value = "/restore/{id}", method = RequestMethod.POST)
    @ResponseBody
    public boolean restore(@PathVariable Integer id) {
        return backpackSettingService.restore(id);
    }

    @RequestMapping(value = "/deleteRestore/{id}", method = RequestMethod.POST)
    @ResponseBody
    public boolean restoreDelete(@PathVariable Integer id) {
        return backpackFileService.delete(id);
    }

    @RequestMapping(value = "/getBackpackSetting", method = RequestMethod.POST)
    @ResponseBody
    public Map getBackpackSetting() {
        return backpackSettingService.getSetting();
    }

}
