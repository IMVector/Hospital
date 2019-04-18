/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.Image;
import com.vector.service.ImageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Vector
 */
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
}
