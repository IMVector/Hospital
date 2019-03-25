/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.ImageDao;
import com.vector.pojo.Image;
import com.vector.service.ImageService;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class ImageServiceImpl implements ImageService {

    @Autowired
    ImageDao imageDao;

    @Override
    public List<Image> getFirstPageImage() {
        return imageDao.getFirstPageImage();
    }

    @Override
    public Image getImageByPath(Serializable path) {
        return imageDao.getImageByPath(path);
    }

    @Override
    public void insertImage(Image image) {
        imageDao.insert(image);
    }

}
