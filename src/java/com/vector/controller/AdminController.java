/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.BackpackFile;
import com.vector.pojo.BackpackSetting;
import com.vector.pojo.Image;
import com.vector.service.ImageService;
import java.util.List;
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
    ///////////////////////////////////图像管理/////////////////////////////////////////////////////

    @RequestMapping(value = "/imageList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Image> getImageList(@PathVariable int currentPage) {
        return imageService.getList(currentPage);
    }

    @RequestMapping(value = "/imageListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public int getImageListItemNum() {
        return imageService.getListItemNumber();
    }

    @RequestMapping(value = "/updateImage", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateImage(Image image) {
        return imageService.update(image);
    }

    @RequestMapping(value = "/deleteImage/{departmentId}", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteImage(@PathVariable int imageId) {
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

    @RequestMapping(value = "/admin/{page}", method = RequestMethod.GET)
    public String changePage(@PathVariable String page) {
        System.out.println(page);
        return page;
    }

//    @RequestMapping(value = "/backpackSettingList/{currentPage}", method = RequestMethod.POST)
//    @ResponseBody
//    public List<BackpackSetting> getDatabaseSetting(@PathVariable int currentPage) {
//
//        return databaseSettingService.getAllList(currentPage);
//
//    }
//
//    @RequestMapping(value = "/backpackSettingListItemNum", method = RequestMethod.POST)
//    @ResponseBody
//    public int getDatabaseSettingIntemNum() {
//
//        return databaseSettingService.getListItemNumber();
//
//    }
//
//    @RequestMapping(value = "/setSettting/{id}", method = RequestMethod.POST)
//    @ResponseBody
//    public void setSettting(@PathVariable int id) {
//        BackpackSetting backpackSetting = databaseSettingService.getBackpackSettingById(id);
//        databaseSettingService.setSettingPath(backpackSetting);
//    }
//
//    @RequestMapping(value = "/databaseBackpackFileList/{currentPage}", method = RequestMethod.POST)
//    @ResponseBody
//    public List<BackpackFile> getDatabaseBackpackFileList(@PathVariable int currentPage) {
//        return backpackFileService.getAllList(currentPage);
//    }
//
//    @RequestMapping(value = "/backpackFileListItemNum", method = RequestMethod.POST)
//    @ResponseBody
//    public int getBackpackFileListIntemNum() {
//
//        return backpackFileService.getListItemNumber();
//    }
//
//    @RequestMapping(value = "/restore/{id}", method = RequestMethod.POST)
//    @ResponseBody
//    public boolean restore(@PathVariable int id) {
//        BackpackFile backpackFile = backpackFileService.getBackpackFileById(id);
//        return databaseSettingService.restore(backpackFile.getBackpackFilePath());
//    }
//
//    @RequestMapping(value = "/deleteRestore/{id}", method = RequestMethod.POST)
//    @ResponseBody
//    public int restoreDelete(@PathVariable int id) {
//
//        if (backpackFileService.deleteOne(id)) {
//            return id;
//        } else {
//            return -1;
//        }
//    }
//
//    @RequestMapping(value = "/addBackpackSetting", method = RequestMethod.POST)
//    @ResponseBody
//    public boolean addSetting(BackpackSetting setting) {
//        return databaseSettingService.addOne(setting);
//    }
//
//    @RequestMapping(value = "/deleteSetting/{settingId}", method = RequestMethod.POST)
//    @ResponseBody
//    public boolean deleteSetting(@PathVariable int settingId) {
//        return databaseSettingService.deleteOne(settingId);
//    }
//
//    @RequestMapping(value = "/updateSetting", method = RequestMethod.POST)
//    @ResponseBody
//    public boolean updateSetting(BackpackSetting setting) {
//        return databaseSettingService.updateOne(setting);
//    }
}
