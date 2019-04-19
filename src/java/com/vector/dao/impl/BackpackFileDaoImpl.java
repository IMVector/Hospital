/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.BackpackFileDao;
import com.vector.pojo.BackpackFile;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class BackpackFileDaoImpl extends BaseDaoImpl<BackpackFile> implements BackpackFileDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*)from BackpackFile";
        return getListSize(hql);
    }

    @Override
    public List<BackpackFile> getList(Integer currentPage, Object... params) {

        String hql = "from BackpackFile";
        return getListPaginationByQuery(hql, currentPage);
    }

}
