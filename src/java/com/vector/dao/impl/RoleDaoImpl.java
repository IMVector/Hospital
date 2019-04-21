/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.RoleDao;
import com.vector.pojo.Role;
import com.vector.pojo.Staff;
import java.io.Serializable;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from Role";
        return getListSize(hql);
    }

    @Override
    public List<Role> getList(Integer currentPage, Object... params) {
        String hql = "from Role";
        return getListPaginationByQuery(hql, currentPage);
    }

    @Override
    public List<Role> getRoleList() {
        String hql = "from Role";
        return getListByQuery(hql);
    }

    @Override
    public List<Role> getRoleByName(Serializable name) {
        String hql = "from Role where roleName like ?";
        name = "%" + name + "%";
        return getListByQuery(hql, name);
    }

    @Override
    public Integer getRoleByNameItemNumber(String name) {
        String hql = "select count(*) from Role where roleName like ?";
        name = "%" + name + "%";
        return getListSize(hql, name);
    }

}
