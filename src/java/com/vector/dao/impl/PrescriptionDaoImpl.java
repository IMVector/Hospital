/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.PrescriptionDao;
import com.vector.pojo.Prescription;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class PrescriptionDaoImpl extends BaseDaoImpl<Prescription>implements PrescriptionDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql="select count(*) from Prescription";
        return getListSize(hql);
    }

    @Override
    public List<Prescription> getList(Integer currentPage, Object... params) {
        String hql="from Prescription";
        return getListPaginationByQuery(hql, currentPage);
    }

    @Override
    public List<Prescription> getPrescriptionByMedicalRecordId(Serializable medicalRecordId) {
        String hql="from Prescription where medicalRecordId=?";
        return getListByQuery(hql, medicalRecordId);
    }
    
}
