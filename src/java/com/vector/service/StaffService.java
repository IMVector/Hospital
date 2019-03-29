/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Staff;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface StaffService extends CUDService<Staff>, PaginationBaseService<Staff> {

    public List<Staff> getStaffByName(Serializable name);

    public List<Staff> getStaffByDepartmentName(Serializable departmentName, Serializable currentPage);

    public int getStaffByDepartmentNameItemNum(Serializable departmentName);

    public List<Staff> getStaffByTitle(Serializable title, Serializable currentPage);

    public Integer getStaffByTitleItemNum(Serializable titleName);

    public List<Staff> getStaffByRole(Serializable roleName, Serializable currentPage);

    public Integer getStaffByRoleItemNum(Serializable roleName);

    public Staff getStaffById(Serializable id);
}
