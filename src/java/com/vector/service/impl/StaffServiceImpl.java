/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.StaffDao;
import com.vector.pojo.Image;
import com.vector.pojo.Staff;
import com.vector.service.StaffService;
import com.vector.utils.MD5Utils;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class StaffServiceImpl implements StaffService {

    @Autowired
    StaffDao staffDao;

    @Override
    public boolean insert(Staff t, Object... params) {
        //        params[0] imagePath     
        Image image = new Image();
        image.setImageId(4);
        t.setImage(image);
        t.setStaffPassword(MD5Utils.md5("123456"));
        try {
            staffDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Staff t, Object... params) {
        try {
            staffDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            staffDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return staffDao.getListItemNumber();
    }

    @Override
    public List<Staff> getList(Integer currentPage, Object... params) {
        return staffDao.getList(currentPage);
    }

    @Override
    public List<Staff> getStaffByName(Serializable name) {
        return staffDao.getStaffByName(name);
    }

    @Override
    public List<Staff> getStaffByDepartmentName(Serializable departmentName, Serializable currentPage) {
        return staffDao.getStaffByDepartmentName(departmentName, currentPage);
    }

    @Override
    public int getStaffByDepartmentNameItemNum(Serializable departmentName) {
        return staffDao.getStaffByDepartmentNameItemNum(departmentName);
    }

    @Override
    public List<Staff> getStaffByTitle(Serializable title, Serializable currentPage) {
        return staffDao.getStaffByTitle(title, currentPage);
    }

    @Override
    public Integer getStaffByTitleItemNum(Serializable titleName) {
        return staffDao.getStaffByTitleItemNum(titleName);
    }

    @Override
    public List<Staff> getStaffByRole(Serializable roleName, Serializable currentPage) {
        return staffDao.getStaffByRole(roleName, currentPage);
    }

    @Override
    public Integer getStaffByRoleItemNum(Serializable roleName) {
        return staffDao.getStaffByRoleItemNum(roleName);
    }

    @Override
    public Staff getStaffById(Serializable id) {
        return staffDao.getOneById(id);
    }

    @Override
    public Staff getStaffByRoleWork(Serializable roleWork) {
        return staffDao.getStaffByRoleWork(roleWork);
    }

    @Override
    public List login(Staff staff, String validateCode, HttpSession session) {
        List<String> list = new ArrayList();
        if (!validateCode.equals(session.getAttribute("randomcode_key"))) {
            list.add("验证码错误");
            return list;
        }
        Staff staffData = staffDao.getStaffByEmail(staff.getEmail());
        if (null != staffData) {
            if (MD5Utils.md5(staff.getStaffPassword()).equals(staffData.getStaffPassword())) {
                session.setAttribute("staff", staffData);
                list.add("true");

                if (staffData.getRole().getRoleName().equals("检查医生")) {
                    list.add("staff/goToExamineStaff");
                } else if (staffData.getRole().getRoleName().equals("临床医生")) {
                    list.add("staff/goToStaffIndex");
                } else if (staffData.getRole().getRoleName().equals("行政医生")) {
                    list.add("staff/goToManageStaff");
                }
                return list;
            } else {
                list.add("密码错误，请检查后重试！");
                return list;
            }

        } else {
            list.add("该用户不存在！");
            return list;
        }

    }

}
