/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.BillDao;
import com.vector.pojo.Bill;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class BillDaoImpl extends BaseDaoImpl<Bill> implements BillDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from Bill where patient.patientId=?";
        return getListSize(hql, params[0]);

    }

    @Override
    public List<Bill> getList(Integer currentPage, Object... params) {
        String hql = "from Bill where patient.patientId=?";
        return getListByQuery(hql, params[0]);
    }

    @Override
    public Bill getLastUnPaidBill(Serializable patientId) {
        String hql = "from Bill where patient.patientId=? and paymentStatus='否'order by billDate desc";
        List<Bill> billList = getListByQuery(hql, patientId);
        if (!billList.isEmpty()) {
            return billList.get(0);
        } else {
            return null;
        }

    }

    @Override
    public List<Bill> getBillOfPatientByYear(Serializable patientId, Serializable year) {

        String yearStart = year + "-01-01 00:00:00";
        String yearEnd = year + "-12-31 23:59:59";
        Date startDate = null;
        Date endDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd hh:mm:ss");
        try {
            startDate = sdf.parse(yearStart);
            endDate = sdf.parse(yearEnd);
            String hql = "from Bill where patient.patientId=? and billDate between ? and ?";
            return getListByQuery(hql, patientId, startDate, endDate);
            
        } catch (ParseException ex) {
            return null;
        }
    }
}
