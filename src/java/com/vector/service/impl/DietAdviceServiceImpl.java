/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.DietAdviceDao;
import com.vector.pojo.DietAdvice;
import com.vector.service.DietAdviceService;
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
public class DietAdviceServiceImpl implements DietAdviceService {

    @Autowired
    DietAdviceDao dietAdviceDao;

    @Override
    public boolean insert(DietAdvice t, Object... params) {
        
        t.setDietAdviceTime(new Date());
        try {
            dietAdviceDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(DietAdvice t, Object... params) {
        try {
            dietAdviceDao.update(t);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            dietAdviceDao.delete(id);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return dietAdviceDao.getListItemNumber(params[0]);
    }

    @Override
    public List<DietAdvice> getList(Integer currentPage, Object... params) {
        return dietAdviceDao.getList(currentPage,params[0]);
    }

}
