/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.TitleDao;
import com.vector.pojo.Title;
import com.vector.service.TitleService;
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
public class TitleServiceImpl implements TitleService {
    @Autowired
    TitleDao titleDao;

    @Override
    public List<Title> getTitleList() {
        return titleDao.getTitleList();
    }

    @Override
    public boolean insert(Title t, Object... params) {
        try {
            titleDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Title t, Object... params) {
        try {
            titleDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            titleDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return titleDao.getListItemNumber();
    }

    @Override
    public List<Title> getList(Integer currentPage, Object... params) {
        return titleDao.getList(currentPage);
    }

    @Override
    public List<Title> getTitleByName(Serializable name) {
        return titleDao.getTitleByName(name);
    }

    @Override
    public Integer  getTitleByNameItemNum(String name) {
        return titleDao.getTitleByNameItemNum(name);
    }
    
}
