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
    public List<Staff> getStaffByDepartmentName(Serializable departmentName, Serializable currentPage) {
        String hql = "from Staff where department.departmentName=?";
        return getListPaginationByQuery(hql, currentPage, departmentName);
    }

    @Override
    public int getStaffByDepartmentNameItemNum(Serializable departmentName) {
        String hql = "select count(*) from Staff where department.departmentName=?";
        return getListSize(hql, departmentName);
    }

    @Override
    public List<Staff> getStaffByTitle(Serializable title, Serializable currentPage) {
        String hql = "from Staff where title.titleName=?";

        return getListPaginationByQuery(hql, currentPage, title);
    }

    @Override
    public Integer getStaffByTitleItemNum(Serializable titleName) {
        String hql = "select count(*) from Staff where title.titleName=?";
        return getListSize(hql, titleName);
    }

    @Override
    public List<Staff> getStaffByName(Serializable name) {

        String hql = "from Staff where staffName=?";
        return getListPaginationByQuery(hql, name);
    }

    @Override
    public List<Staff> getStaffByRole(Serializable roleName, Serializable currentPage) {
        String hql = "from Staff where role.roleName=?";
        return getListPaginationByQuery(hql, currentPage, roleName);
    }

    @Override
    public Integer getStaffByRoleItemNum(Serializable roleName) {
        String hql = "select count(*) from Staff where role.roleName=?";
        return getListSize(hql, roleName);
    }
}
