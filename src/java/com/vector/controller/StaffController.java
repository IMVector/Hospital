/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.CheckItem;
import com.vector.pojo.Department;
import com.vector.pojo.Medicine;
import com.vector.pojo.Role;
import com.vector.pojo.ScheduleTable;
import com.vector.pojo.Staff;
import com.vector.pojo.Title;
import com.vector.service.CheckItemService;
import com.vector.service.DepartmentService;
import com.vector.service.MedicineService;
import com.vector.service.RoleService;
import com.vector.service.StaffService;
import com.vector.service.TitleService;
import com.vector.service.WorkScheduleService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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

    @Autowired
    WorkScheduleService scheduleService;

    @Autowired
    CheckItemService checkItemService;

    @Autowired
    MedicineService medicineService;
    
    
    
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//第二个参数是控制是否支持传入的值是空，这个值很关键，如果指定为false，那么如果前台没有传值的话就会报错
    }
//////////////////////////////////////////////////////部门管理//////////////////////////////////////////////////

    @RequestMapping(value = "/departmentList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Department> getDepartmentList(@PathVariable Integer currentPage) {
        return departmentService.getList(currentPage);
    }

    @RequestMapping(value = "/departmentListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer showDepartmentListItemNumber() {
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
    public List<Title> getTitleList(@PathVariable Integer currentPage) {
        return titleService.getList(currentPage);
    }

    @RequestMapping(value = "/titleListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer showTitleListItemNumber() {
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
    public List<Role> getRoleList(@PathVariable Integer currentPage) {
        return roleService.getList(currentPage);
    }

    @RequestMapping(value = "/roleListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer showRoleListItemNumber() {
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
    public List<Staff> getStaffList(@PathVariable Integer currentPage) {
        return staffService.getList(currentPage);
    }

    @RequestMapping(value = "/staffListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer showStaffListItemNumber() {
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

    @RequestMapping(value = "/getStaffByTitle/{titleId}/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Staff> getStaffByTitle(@PathVariable Integer titleId, @PathVariable Integer currentPage) {
        return staffService.getStaffByTitle(titleId, currentPage);
    }

    @RequestMapping(value = "/getStaffBytitleItemNum/{titleId}", method = RequestMethod.POST)
    @ResponseBody
    public Integer showStaffListByTitleItemNumber(@PathVariable Integer titleId) {
        return staffService.getStaffByTitleItemNum(titleId);
    }

    @RequestMapping(value = "/getStaffByRole/{roleId}/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Staff> getStaffByRole(@PathVariable Integer roleId, @PathVariable Integer currentPage) {
        return staffService.getStaffByRole(roleId, currentPage);
    }

    @RequestMapping(value = "/getStaffByRoleItemNum/{roleId}", method = RequestMethod.POST)
    @ResponseBody
    public Integer showStaffListByRoleItemNumber(@PathVariable Integer roleId) {
        return staffService.getStaffByRoleItemNum(roleId);
    }

    @RequestMapping(value = "/getStaffByDepartment/{departmentId}/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Staff> getStaffByDepartment(@PathVariable Integer departmentId, @PathVariable Integer currentPage) {
        return staffService.getStaffByDepartmentName(departmentId, currentPage);
    }

    @RequestMapping(value = "/getStaffBydepartmentItemNum/{departmentName}", method = RequestMethod.POST)
    @ResponseBody
    public Integer showStaffListByDepartmentItemNumber(@PathVariable Integer departmentId) {
        return staffService.getStaffByDepartmentNameItemNum(departmentId);
    }

    @RequestMapping(value = "/goToStaffDetails/{id}", method = RequestMethod.GET)
    public String goToStaffDetails(@PathVariable Integer id, ModelMap map) {
        map.addAttribute("staff", staffService.getStaffById(id));
        map.addAttribute("schedule", scheduleService.getScheduleByStaffId(id));
        return "staffDetail";
    }

    //////////////////////////////////////////////////////出勤管理//////////////////////////////////////////////////
    @RequestMapping(value = "/updateSchedule", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSchedule(ScheduleTable table) {
        return scheduleService.UpdateSchedule(table);
    }

    @RequestMapping(value = "/getStaffSchedule/{staffId}", method = RequestMethod.POST)
    @ResponseBody
    public ScheduleTable getStaffSchedule(@PathVariable Integer staffId) {
        return scheduleService.getScheduleByStaffId(staffId);
    }

    @RequestMapping(value = "/deleteSchedule/{staffId}", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteScheduleByStaffId(@PathVariable Integer staffId) {
        return scheduleService.deleteSchedule(staffId);
    }
    //////////////////////////////////////////////////////检查项目管理//////////////////////////////////////////////////

    @RequestMapping(value = "/getCheckItemList", method = RequestMethod.POST)
    @ResponseBody
    public List<CheckItem> getCheckItemList() {
        return checkItemService.getCheckItemList();
    }

    @RequestMapping(value = "/checkItemList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<CheckItem> getCheckItemList(@PathVariable Integer currentPage) {
        return checkItemService.getList(currentPage);
    }

    @RequestMapping(value = "/checkItemListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer showCheckItemListItemNumber() {
        return checkItemService.getListItemNumber();
    }

    @RequestMapping(value = "/addCheckItem", method = RequestMethod.POST)
    @ResponseBody
    public boolean addCheckItem(CheckItem checkItem) {
        return checkItemService.insert(checkItem);
    }

    @RequestMapping(value = "/updateCheckItem", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCheckItem(CheckItem checkItem) {
        return checkItemService.update(checkItem);
    }

    @RequestMapping(value = "/deleteCheckItem/{id}", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteCheckItem(@PathVariable Integer id) {
        return checkItemService.delete(id);
    }

    @RequestMapping(value = "/getCheckItemByName/{name}", method = RequestMethod.POST)
    @ResponseBody
    public List<CheckItem> getCheckItemByName(@PathVariable String name) {
        return checkItemService.getCheckItemByName(name);
    }

    //////////////////////////////////////////////////////药品管理//////////////////////////////////////////////////
    @RequestMapping(value = "/getMedicineList", method = RequestMethod.POST)
    @ResponseBody
    public List<Medicine> getMedicineList() {
        return medicineService.getMedicineList();
    }

    @RequestMapping(value = "/medicineList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Medicine> getMedicineList(@PathVariable Integer currentPage) {
        return medicineService.getList(currentPage);
    }

    @RequestMapping(value = "/medicineListItemNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer showMedicineListItemNumber() {
        return medicineService.getListItemNumber();
    }

    @RequestMapping(value = "/addMedicine", method = RequestMethod.POST)
    @ResponseBody
    public boolean addMedicine(Medicine medicine) {
        return medicineService.insert(medicine);
    }

    @RequestMapping(value = "/updateMedicine", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateMedicine(Medicine medicine) {
        return medicineService.update(medicine);
    }

    @RequestMapping(value = "/deleteMedicine/{id}", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteMedicine(@PathVariable Integer id) {
        return medicineService.delete(id);
    }

    @RequestMapping(value = "/getMedicineByName/{name}", method = RequestMethod.POST)
    @ResponseBody
    public List<Medicine> getMedicineByName(@PathVariable String name) {
        return medicineService.getMedicineByName(name);
    }
}
