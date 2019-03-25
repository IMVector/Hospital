/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.Department;
import com.vector.pojo.Role;
import com.vector.pojo.Staff;
import com.vector.pojo.Title;
import com.vector.service.DepartmentService;
import com.vector.service.RoleService;
import com.vector.service.StaffService;
import com.vector.service.TitleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Vector
 */
@Controller
@RequestMapping("/staff")
public class StaffController {

    @Autowired
    DepartmentService departmentService;

    @Autowired
    StaffService staffService;

    @Autowired
    TitleService titleService;

    @Autowired
    RoleService roleService;

//////////////////////////////////////////////////////部门管理//////////////////////////////////////////////////
    @RequestMapping(value = "/departmentList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Department> getDepartmentList(@PathVariable int currentPage) {
        return departmentService.getList(currentPage);
    }

    @RequestMapping(value = "/departmentListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public int showDepartmentListItemNumber() {
        return departmentService.getListItemNumber();
    }

    @RequestMapping(value = "/addDepartment", method = RequestMethod.POST)
    @ResponseBody
    public boolean addDepartment(Department department, String imagePath) {
        return departmentService.insert(department, imagePath);
    }

    @RequestMapping(value = "/updateDepartment", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateDepartment(Department department) {
        return departmentService.update(department);
    }

    @RequestMapping(value = "/deleteDepartment/{id}", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteDepartment(@PathVariable Integer id) {
        return departmentService.delete(id);
    }

    @RequestMapping(value = "/getDepartmentByName/{name}", method = RequestMethod.POST)
    @ResponseBody
    public List<Department> getDepartmentByName(@PathVariable String name) {
        return departmentService.getDaprtmentByName(name);
    }

    @RequestMapping(value = "/getDepartmentList", method = RequestMethod.POST)
    @ResponseBody
    public List<Department> getDepartmentList() {
        return departmentService.getDepartmentList();
    }

    //////////////////////////////////////////////////////职称管理//////////////////////////////////////////////////
    @RequestMapping(value = "/getTitleList", method = RequestMethod.POST)
    @ResponseBody
    public List<Title> getTitleList() {
        return titleService.getTitleList();
    }

    @RequestMapping(value = "/titleList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Title> getTitleList(@PathVariable int currentPage) {
        return titleService.getList(currentPage);
    }

    @RequestMapping(value = "/titleListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public int showTitleListItemNumber() {
        return titleService.getListItemNumber();
    }

    @RequestMapping(value = "/addTitle", method = RequestMethod.POST)
    @ResponseBody
    public boolean addTitle(Title title, String imagePath) {
        return titleService.insert(title, imagePath);
    }

    @RequestMapping(value = "/updateTitle", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateTitle(Title title) {
        return titleService.update(title);
    }

    @RequestMapping(value = "/deleteTitle/{id}", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteTitle(@PathVariable Integer id) {
        return titleService.delete(id);
    }

    @RequestMapping(value = "/getTitleByName/{name}", method = RequestMethod.POST)
    @ResponseBody
    public List<Title> getTitleByName(@PathVariable String name) {
        return titleService.getTitleByName(name);
    }

    //////////////////////////////////////////////////////角色管理//////////////////////////////////////////////////
    @RequestMapping(value = "/getRoleList", method = RequestMethod.POST)
    @ResponseBody
    public List<Role> getRoleList() {
        return roleService.getRoleList();
    }

    @RequestMapping(value = "/roleList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Role> getRoleList(@PathVariable int currentPage) {
        return roleService.getList(currentPage);
    }

    @RequestMapping(value = "/roleListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public int showRoleListItemNumber() {
        return roleService.getListItemNumber();
    }

    @RequestMapping(value = "/addRole", method = RequestMethod.POST)
    @ResponseBody
    public boolean addRole(Role role, String imagePath) {
        return roleService.insert(role, imagePath);
    }

    @RequestMapping(value = "/updateRole", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateRole(Role role) {
        return roleService.update(role);
    }

    @RequestMapping(value = "/deleteRole/{id}", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteRole(@PathVariable Integer id) {
        return roleService.delete(id);
    }

    @RequestMapping(value = "/getRoleByName/{name}", method = RequestMethod.POST)
    @ResponseBody
    public List<Role> getRoleByName(@PathVariable String name) {
        return roleService.getRoleByName(name);
    }

    //////////////////////////////////////////////////////员工管理//////////////////////////////////////////////////
    @RequestMapping(value = "/staffList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Staff> getStaffList(@PathVariable int currentPage) {
        return staffService.getList(currentPage);
    }

    @RequestMapping(value = "/staffListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public int showStaffListItemNumber() {
        return staffService.getListItemNumber();
    }

    @RequestMapping(value = "/addStaff", method = RequestMethod.POST)
    @ResponseBody
    public boolean addStaff(Staff staff, String imagePath) {
        return staffService.insert(staff, imagePath);
    }

    @RequestMapping(value = "/updateStaff", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateStaff(Staff staff) {
        return staffService.update(staff);
    }

    @RequestMapping(value = "/deleteStaff/{id}", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteStaff(@PathVariable Integer id) {
        return staffService.delete(id);
    }

    @RequestMapping(value = "/getStaffByName/{name}", method = RequestMethod.POST)
    @ResponseBody
    public List<Staff> getStaffByName(@PathVariable String name) {
        return staffService.getStaffByName(name);
    }
    
}
