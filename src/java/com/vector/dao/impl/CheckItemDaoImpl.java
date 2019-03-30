/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.CheckItemDao;
import com.vector.pojo.CheckItem;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class CheckItemDaoImpl extends BaseDaoImpl<CheckItem> implements CheckItemDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from CheckItem";
        return getListSize(hql);
    }

    @Override
    public List<CheckItem> getList(Integer currentPage, Object... params) {
        String hql = "from CheckItem";
        return getListPaginationByQuery(hql, currentPage);
    }

    @Override
    public List<CheckItem> getCheckItemList() {
        String hql = "from CheckItem";
        return getListByQuery(hql);
    }

    @Override
    public List<CheckItem> getCheckItemByName(Serializable name) {
        String hql = "from CheckItem where checkItemName like ?";
        name = "%" + name + "%";
        return getListByQuery(hql, name);
    }

}
