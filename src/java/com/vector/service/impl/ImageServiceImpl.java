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

    @Override
    public boolean insert(Image t, Object... params) {
        try {
            imageDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Image t, Object... params) {
        try {
            imageDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            imageDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
          return imageDao.getListItemNumber();
    }

    @Override
    public List<Image> getList(Integer currentPage, Object... params) {
          return imageDao.getList(currentPage);
    }

    @Override
    public Image getImageById(Serializable imageId) {
        return imageDao.getOneById(imageId);
    }

}
