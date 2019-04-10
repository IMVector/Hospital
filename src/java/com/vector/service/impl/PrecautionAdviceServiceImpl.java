/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.PrecautionAdviceDao;
import com.vector.pojo.PrecautionAdvice;
import com.vector.service.PrecautionAdviceServcie;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Vector
 */
public class PrecautionAdviceServiceImpl implements PrecautionAdviceServcie {

    @Autowired
    PrecautionAdviceDao precautionAdviceDao;

    @Override
    public boolean insert(PrecautionAdvice t, Object... params) {
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

}
