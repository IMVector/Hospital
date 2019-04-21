/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.DepartmentDao;
import com.vector.pojo.Department;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class DepartmentDaoImpl extends BaseDaoImpl<Department> implements DepartmentDao {

    @Override
    public Department getDepartmentById(Serializable Id) {
        return getOneById(Id);
    }

    @Override
    public List<Department> getDepartmentByName(Serializable name) {
        String hql = "from Department where departmentName like ?";
        name = "%" + name + "%";
        List<Department> list = getListByQuery(hql, name);
        return list;
    }

    @Override
    public Integer getDaprtmentByNameItemNumber(String name) {
        String hql = "select count(*) from Department where departmentName like ?";
        name = "%" + name + "%";
        return getListSize(hql,name);
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from Department";
        return getListSize(hql);
    }

    @Override
    public List<Department> getList(Integer currentPage, Object... params) {
        String hql = "from Department";
        return getListPaginationByQuery(hql, currentPage);
    }

    @Override
    public List<Department> getDepartmentList() {
        String hql = "from Department";
        return getListByQuery(hql);
    }

}
