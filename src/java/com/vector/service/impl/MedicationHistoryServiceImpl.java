/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.MedicationHistoryDao;
import com.vector.pojo.MedicationHistory;
import com.vector.service.MedicationHistoryService;
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
public class MedicationHistoryServiceImpl implements MedicationHistoryService {

    @Autowired
    MedicationHistoryDao medicationHistoryDao;

    @Override
    public boolean insert(MedicationHistory t, Object... params) {
        try {
            medicationHistoryDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(MedicationHistory t, Object... params) {
        try {
            medicationHistoryDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            medicationHistoryDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return medicationHistoryDao.getListItemNumber(params[0]);  
    }

    @Override
    public List<MedicationHistory> getList(Integer currentPage, Object... params) {
        return medicationHistoryDao.getList(currentPage, params[0]);
    }

}
