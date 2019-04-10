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
        String hql = "select count(*) from PrecautionAdvice where patient.patientId=?";
        return getListSize(hql, params[0]);
    }

    @Override
    public List<PrecautionAdvice> getList(Integer currentPage, Object... params) {
        String hql = "from PrecautionAdvice where patient.patientId=?";
        return getListPaginationByQuery(hql, currentPage, params[0]);
    }

}
