/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.MedicalRecordDao;
import com.vector.pojo.MedicalRecord;
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
public class MedicalRecordDaoImpl extends BaseDaoImpl<MedicalRecord> implements MedicalRecordDao {

    @Override
    public List<MedicalRecord> getAllMedicalRecordList(Serializable currentPage) {
        String sql = "from MedicalRecord";
        return getListPaginationByQuery(sql, currentPage);
    }

    @Override
    public int getListItemNumber() {
        String sql = "select count(*) from MedicalRecord";
        return getListSize(sql);
    }

    @Override
    public List<MedicalRecord> getAllMedicalRecordListOfSomeOne(Serializable patientId, Serializable currentPage) {
        String sql = "from MedicalRecord where patient.patientId=?";
        return getListPaginationByQuery(sql, currentPage, patientId);
    }

    @Override
    public int getListItemNumberOfSomeOne(Serializable patientId) {
        String sql = "select count(*) from MedicalRecord where patient.patientId=?";
        return getListSize(sql, patientId);
    }

    @Override
    public List<MedicalRecord> getMedicalOfPatientByYear(Serializable patientId, Serializable year) {
        String yearStart = year + "-01-01 00:00:00";
        String yearEnd = year + "-12-31 23:59:59";
        Date startDate = null;
        Date endDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd hh:mm:ss");
        try {
            startDate = sdf.parse(yearStart);
            endDate = sdf.parse(yearEnd);
            String hql = "from MedicalRecord where patient.patientId=? and date between ? and ?";
            return getListByQuery(hql, patientId, startDate, endDate);
        } catch (ParseException ex) {
            return null;
        }
    }

    @Override
    public List<MedicalRecord> getAllMedicalRecordListofSomeone(Serializable patientId) {
        String hql = "from MedicalRecord where patient.patientId=?";
        return getListByQuery(hql, patientId);
    }

    @Override
    public MedicalRecord getLastMedicalRecord(Serializable patientId) {
        String hql = "from MedicalRecord where patient.patientId=? order by date desc";
        List<MedicalRecord> list = getListByQuery(hql, patientId);
        if (list.isEmpty()) {
            return null;
        } else {
            return list.get(0);
        }
    }

    @Override
    public List<MedicalRecord> getUnPayMedicalRecord(Serializable patientId) {
        String hql="from MedicalRecord where patient.patientId=? and paymentStatus='否'";
        return getListByQuery(hql, patientId);
    }

}
