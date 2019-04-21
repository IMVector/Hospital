/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.DepartmentDao;
import com.vector.pojo.Department;
import com.vector.pojo.Image;
import com.vector.service.DepartmentService;
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
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentDao departmentDao;

    @Autowired
    ImageService imageService;

    @Override
    public Department getDaprtmentById(Serializable id) {
        return departmentDao.getDepartmentById(id);
    }

    @Override
    public List<Department> getDaprtmentByName(Serializable name) {
        return departmentDao.getDepartmentByName(name);
    }

    @Override
    public Integer getDaprtmentByNameItemNumber(String name) {
        return departmentDao.getDaprtmentByNameItemNumber(name);
    }

    @Override
    public boolean insert(Department t, Object... params) {
        if (params.length > 0) {
            Image image = imageService.getImageByPath(params[0].toString());
            t.setImage(image);
        } else {
            Image image = new Image();
            image.setImageId(1);
            t.setImage(image);
        }
        try {
            departmentDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Department t, Object... params) {
        if (params.length > 0) {
            Image image = imageService.getImageByPath(params[0].toString());
            t.setImage(image);
        } else {
            Image image = new Image();
            image.setImageId(1);
            t.setImage(image);
        }
        try {
            departmentDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            departmentDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return departmentDao.getListItemNumber();
    }

    @Override
    public List<Department> getList(Integer currentPage, Object... params) {
        return departmentDao.getList(currentPage);
    }

    @Override
    public List<Department> getDepartmentList() {
        return departmentDao.getDepartmentList();
    }

}
