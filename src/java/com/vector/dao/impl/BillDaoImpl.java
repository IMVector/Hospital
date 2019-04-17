/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.BillDao;
import com.vector.pojo.Bill;
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

}
