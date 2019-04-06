/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.CheckRecordDao;
import com.vector.pojo.CheckRecord;
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
        String hql = "select count(*) from CheckRecord";
        return getListSize(hql);
    }

    @Override
    public List<CheckRecord> getList(Integer currentPage, Object... params) {
        String hql = "from CheckRecord";
        return getListPaginationByQuery(hql, currentPage);
    }

}
