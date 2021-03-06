/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.PrecautionAdviceDao;
import com.vector.pojo.PrecautionAdvice;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.vector.service.PrecautionAdviceService;
import java.util.Date;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class PrecautionAdviceServiceImpl implements PrecautionAdviceService {

    @Autowired
    PrecautionAdviceDao precautionAdviceDao;

    @Override
    public boolean insert(PrecautionAdvice t, Object... params) {
        t.setDietAdviceTime(new Date());
        try {
            precautionAdviceDao.insert(t);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(PrecautionAdvice t, Object... params) {
        try {
            precautionAdviceDao.update(t);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            precautionAdviceDao.delete(id);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return precautionAdviceDao.getListItemNumber(params[0]);
    }

    @Override
    public List<PrecautionAdvice> getList(Integer currentPage, Object... params) {
        return precautionAdviceDao.getList(currentPage, params[0]);
    }

    @Override
    public PrecautionAdvice getPrecautionAdviceById(Serializable precautionAdviceId) {
        return precautionAdviceDao.getOneById(precautionAdviceId);
    }

    @Override
    public Integer getListItemNumberOfStaff(Object... params) {
        return precautionAdviceDao.getListItemNumberOfStaff(params);
    }

    @Override
    public List<PrecautionAdvice> getListOfStaff(Integer currentPage, Object... params) {
        return precautionAdviceDao.getListOfStaff(currentPage, params);
    }

}
