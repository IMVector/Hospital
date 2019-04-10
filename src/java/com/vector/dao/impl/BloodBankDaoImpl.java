/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.BloodBankDao;
import com.vector.pojo.Bloodbank;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class BloodBankDaoImpl extends BaseDaoImpl<Bloodbank> implements BloodBankDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from Bloodbank";
        return getListSize(hql);
    }

    @Override
    public List<Bloodbank> getList(Integer currentPage, Object... params) {
        String hql = "from Bloodbank";
        return getListPaginationByQuery(hql, currentPage);
    }

}
