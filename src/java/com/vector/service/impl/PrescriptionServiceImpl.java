/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.PrescriptionDao;
import com.vector.pojo.Prescription;
import com.vector.service.PrescriptionService;
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
public class PrescriptionServiceImpl implements PrescriptionService {

    @Autowired
    PrescriptionDao prescriptionDao;

    @Override
    public boolean insert(Prescription t, Object... params) {
        try {
            prescriptionDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Prescription t, Object... params) {
        try {
            prescriptionDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            prescriptionDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return prescriptionDao.getListItemNumber();
    }

    @Override
    public List<Prescription> getList(Integer currentPage, Object... params) {
        return prescriptionDao.getList(currentPage);
    }

}
