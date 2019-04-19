/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.PrecautionAdviceDao;
import com.vector.pojo.PrecautionAdvice;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class PrecautionAdviceDaoImpl extends BaseDaoImpl<PrecautionAdvice> implements PrecautionAdviceDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from PrecautionAdvice where patient.patientId=? and role='staff'";
        return getListSize(hql, params[0]);
    }

    @Override
    public List<PrecautionAdvice> getList(Integer currentPage, Object... params) {
        String hql = "from PrecautionAdvice where patient.patientId=? and role='staff'";
        return getListPaginationByQuery(hql, currentPage, params[0]);
    }

    @Override
    public Integer getListItemNumberOfStaff(Object... params) {
        String hql = "select count(*) from PrecautionAdvice where staff.staffId=? and role='patient'";
        return getListSize(hql, params[0]);
    }

    @Override
    public List<PrecautionAdvice> getListOfStaff(Integer currentPage, Object... params) {
        String hql = "from PrecautionAdvice where staff.staffId=? and role='patient'";
        return getListPaginationByQuery(hql, currentPage, params[0]);
    }

}
