/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.CheckRecordDao;
import com.vector.pojo.CheckItem;
import com.vector.pojo.CheckRecord;
import com.vector.pojo.Image;
import com.vector.pojo.Patient;
import com.vector.pojo.Staff;
import com.vector.service.CheckRecordService;
import com.vector.service.ImageService;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class CheckRecordServiceImpl implements CheckRecordService {

    @Autowired
    CheckRecordDao checkRecordDao;

    @Override
    public CheckRecord getCheckRecordById(Serializable checkRecordId) {
        return checkRecordDao.getOneById(checkRecordId);
    }

    @Override
    public boolean insert(CheckRecord t, Object... params) {
        String resultFile = (String) params[0];
        HttpSession session = (HttpSession) params[1];

        Staff targetStaff = (Staff) session.getAttribute("examStaff");
        CheckItem item = new CheckItem();
        item.setCheckItemId(targetStaff.getStaffWork());//staffWork与checkItemId是逻辑关联

        t.setResultFile(resultFile);
        t.setStaff(targetStaff);
        t.setCheckItem(item);
        t.setPaymentStatus("否");
        t.setCheckDate(new Date());

        try {
            checkRecordDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(CheckRecord t, Object... params) {
        try {
            checkRecordDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            checkRecordDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * 根据病人Id获取检查结果的数量
     *
     * @param params
     * @return
     */
    @Override
    public Integer getListItemNumber(Object... params) {
        return checkRecordDao.getListItemNumber(params[0]);
    }

    /**
     * 根据病人的Id获取检查结果
     *
     * @param currentPage
     * @param params
     * @return
     */
    @Override
    public List<CheckRecord> getList(Integer currentPage, Object... params) {
        return checkRecordDao.getList(currentPage,params[0]); 
    }

    @Override
    public List<CheckRecord> getCheckRecordOfToday(Serializable patientId) {
        return checkRecordDao.getCheckRecordOfToday(patientId);
    }

    @Override
    public List<CheckRecord> getUnPayCheckRecordByPatientId(Serializable patientId) {
        return checkRecordDao.getUnPayCheckRecordByPatientId(patientId);
    }

}
