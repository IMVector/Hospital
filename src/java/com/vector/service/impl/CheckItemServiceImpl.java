/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.CheckItemDao;
import com.vector.pojo.CheckItem;
import com.vector.service.CheckItemService;
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
public class CheckItemServiceImpl implements CheckItemService {

    @Autowired
    CheckItemDao checkItemDao;

    @Override
    public boolean insert(CheckItem t, Object... params) {
        try {
            checkItemDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(CheckItem t, Object... params) {
        try {
            checkItemDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            checkItemDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return checkItemDao.getListItemNumber();
    }

    @Override
    public List<CheckItem> getList(Integer currentPage, Object... params) {
        return checkItemDao.getList(currentPage);
    }

    @Override
    public List<CheckItem> getCheckItemList() {
        return checkItemDao.getCheckItemList();
    }

    @Override
    public List<CheckItem> getCheckItemByName(Serializable name) {
        return checkItemDao.getCheckItemByName(name);
    }

}
