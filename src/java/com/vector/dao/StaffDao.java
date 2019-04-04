/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.Staff;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface StaffDao extends BaseDao<Staff>, PaginationBaseDao<Staff> {

    public List<Staff> getStaffByName(Serializable name);

    public List<Staff> getStaffByDepartmentName(Serializable departmentName, Serializable currentPage);

    public int getStaffByDepartmentNameItemNum(Serializable departmentName);

    public List<Staff> getStaffByTitle(Serializable title, Serializable currentPage);

    public Integer getStaffByTitleItemNum(Serializable titleName);

    public List<Staff> getStaffByRole(Serializable roleName, Serializable currentPage);

    public Integer getStaffByRoleItemNum(Serializable roleName);

    public Staff getStaffByRoleWork(Serializable roleWork);

    public List<Staff> getStaffByDepartmentId(Serializable departmentId);
}
