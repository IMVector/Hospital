/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.CheckRecordDao;
import com.vector.pojo.CheckRecord;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class CheckRecordDaoImpl extends BaseDaoImpl<CheckRecord> implements CheckRecordDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from CheckRecord where patient.patientId=?";
        return getListSize(hql, params[0]);
    }

    @Override
    public List<CheckRecord> getList(Integer currentPage, Object... params) {
        String hql = "from CheckRecord where patient.patientId=?";
        return getListPaginationByQuery(hql, currentPage, params[0]);
    }

    @Override
    public List<CheckRecord> getCheckRecordOfToday(Serializable patientId) {
        Date today = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
        String temp=sdf.format(today);
        String startTime=temp+" 00:00:00";
        String endTime=temp+" 23:59:59";
        Date startDate = null;
        Date endDate = null;
        sdf = new SimpleDateFormat("yy-MM-dd hh:mm:ss");
        try {
            startDate = sdf.parse(startTime);
            endDate = sdf.parse(endTime);
        } catch (Exception e) {
            System.out.println(e);
        }

        String hql = "from CheckRecord where patient.patientId=? and checkDate between ? and ?";
        return getListByQuery(hql, patientId,startDate,endDate);
    }

}
