/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.TitleDao;
import com.vector.pojo.Title;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class TitleDaoImpl extends BaseDaoImpl<Title> implements TitleDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from Title";
        return getListSize(hql);
    }

    @Override
    public List<Title> getList(Integer currentPage, Object... params) {
        String hql = "from Title";
        return getListPaginationByQuery(hql, currentPage);
    }

    @Override
    public List<Title> getTitleList() {
        String hql = "from Title";
        return getListByQuery(hql);
    }

    @Override
    public List<Title> getTitleByName(Serializable name) {
        String hql = "from Title where titleName like ?";
        name = "%" + name + "%";
        return getListByQuery(hql, name);
    }

}
