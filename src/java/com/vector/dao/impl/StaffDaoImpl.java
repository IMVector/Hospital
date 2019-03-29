/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.StaffDao;
import com.vector.pojo.Staff;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class StaffDaoImpl extends BaseDaoImpl<Staff> implements StaffDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from Staff";
        return getListSize(hql);
    }

    @Override
    public List<Staff> getList(Integer currentPage, Object... params) {
        String hql = "from Staff";
        return getListPaginationByQuery(hql, currentPage);
    }


    @Override
    public List<Staff> getStaffByDepartmentName(Serializable departmentId, Serializable currentPage) {
        String hql = "from Staff where department.departmentId=?";
        return getListPaginationByQuery(hql, currentPage, departmentId);
    }

    @Override
    public int getStaffByDepartmentNameItemNum(Serializable departmentId) {
        String hql = "select count(*) from Staff where department.departmentId=?";
        return getListSize(hql, departmentId);
    }

    @Override
    public List<Staff> getStaffByTitle(Serializable titleId, Serializable currentPage) {
        String hql = "from Staff where title.titleId=?";

        return getListPaginationByQuery(hql, currentPage, titleId);
    }

    @Override
    public Integer getStaffByTitleItemNum(Serializable titleId) {
        String hql = "select count(*) from Staff where title.titleId=?";
        return getListSize(hql, titleId);
    }

    @Override
    public List<Staff> getStaffByName(Serializable name) {

        String hql = "from Staff where staffName like ?";
        name="%"+name+"%";
        return getListByQuery(hql, name);
    }

    @Override
    public List<Staff> getStaffByRole(Serializable roleId, Serializable currentPage) {
        String hql = "from Staff where role.roleId=?";
        return getListPaginationByQuery(hql, currentPage, roleId);
    }

    @Override
    public Integer getStaffByRoleItemNum(Serializable roleId) {
        String hql = "select count(*) from Staff where role.roleId=?";
        return getListSize(hql, roleId);
    }
}