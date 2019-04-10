/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.MedicationHistoryDao;
import com.vector.pojo.MedicationHistory;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class MedicationHistoryDaoImpl extends BaseDaoImpl<MedicationHistory> implements MedicationHistoryDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from MedicationHistory where patient.patientId=?";
        return getListSize(hql, params[0]);
    }

    @Override
    public List<MedicationHistory> getList(Integer currentPage, Object... params) {
        String hql = "from MedicationHistory where patient.patientId=?";
        return getListPaginationByQuery(hql, currentPage, params[0]);
    }

}
