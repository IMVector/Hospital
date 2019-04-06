/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.Image;
import com.vector.service.ImageService;
import com.vector.utils.UploadUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Vector
 */
@Controller
@RequestMapping("/upload")
public class UploadController {

    @Autowired
    ImageService imageService;

    @RequestMapping(value = "/uploadImage/uploadPatientImage", method = RequestMethod.POST)
    @ResponseBody
    public String uploadPatientImage(HttpServletRequest request) {
        String showPath = "";
        try {
            showPath = UploadUtils.uploadImage(request);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Image image = new Image(showPath);
        try {
            imageService.insertImage(image);
        } catch (Exception e) {
            return "Error";
        }
        System.out.println(showPath);
        return showPath;
    }

    @RequestMapping(value = "/uploadFile/uploadCheckRecordResultFile", method = RequestMethod.POST)
    @ResponseBody
    public String uploadCheckRecordResultFile(HttpServletRequest request) {
        String showPath = "";
        try {
            showPath = UploadUtils.uploadImage(request);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Image image = new Image(showPath);
        try {
            imageService.insertImage(image);
        } catch (Exception e) {
            return "Error";
        }
        System.out.println(showPath);
        return showPath;
    }

}
