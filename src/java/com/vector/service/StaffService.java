/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Staff;
import java.io.Serializable;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vector
 */
public interface StaffService extends CUDService<Staff>, PaginationBaseService<Staff> {

    public List login(Staff staff, String validateCode, HttpSession session);

    public List<Staff> getStaffByName(Serializable name);

    public List<Staff> getStaffByDepartmentName(Serializable departmentName, Serializable currentPage);

    public int getStaffByDepartmentNameItemNum(Serializable departmentName);

    public List<Staff> getStaffByTitle(Serializable title, Serializable currentPage);

    public Integer getStaffByTitleItemNum(Serializable titleName);

    public List<Staff> getStaffByRole(Serializable roleName, Serializable currentPage);

    public Integer getStaffByRoleItemNum(Serializable roleName);

    public Staff getStaffById(Serializable id);

    public Staff getStaffByRoleWork(Serializable roleWork);
}
