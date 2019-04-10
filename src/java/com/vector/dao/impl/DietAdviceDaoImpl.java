/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.DietAdviceDao;
import com.vector.pojo.DietAdvice;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class DietAdviceDaoImpl extends BaseDaoImpl<DietAdvice> implements DietAdviceDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from DietAdvice where patient.patientId=?";
        return getListSize(hql, params[0]);
    }

    @Override
    public List<DietAdvice> getList(Integer currentPage, Object... params) {
        String hql = "from DietAdvice where patient.patientId=?";
        return getListPaginationByQuery(hql, currentPage, params[0]);
    }

}
