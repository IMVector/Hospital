/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.BackpackFileDao;
import com.vector.pojo.BackpackFile;
import com.vector.service.BackpackFileService;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Transactional
@Service
public class BackpackFileServiceImpl implements BackpackFileService {

    @Autowired
    private BackpackFileDao backpackFileDao;

    @Override
    public Integer getListItemNumber(Object... params) {
        return backpackFileDao.getListItemNumber(params);
    }

    @Override
    public List<BackpackFile> getList(Integer currentPage, Object... params) {
        return backpackFileDao.getList(currentPage, params);
    }

    @Override
    public BackpackFile getBackpackFileById(Serializable id) {
        return backpackFileDao.getOneById(id);
    }

    @Override
    public boolean insert(BackpackFile t, Object... params) {
        try {
            t.setBackpackTime(new Date());
            backpackFileDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(BackpackFile t, Object... params) {
        try {
            t.setBackpackTime(new Date());
            backpackFileDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            backpackFileDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

}
