/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.BackpackSettingDao;
import com.vector.pojo.BackpackSetting;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class BackpackSettingDaoImpl extends BaseDaoImpl<BackpackSetting> implements BackpackSettingDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*)from BackpackFile";
        return getListSize(hql);
    }

    @Override
    public List<BackpackSetting> getList(Integer currentPage, Object... params) {
        String hql = "from BackpackSetting";
        return getListPaginationByQuery(hql, currentPage);
    }

}
