/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.CheckItem;
import com.vector.pojo.CheckRecord;
import com.vector.pojo.Department;
import com.vector.pojo.DietAdvice;
import com.vector.pojo.MedicalRecord;
import com.vector.pojo.MedicationHistory;
import com.vector.pojo.Medicine;
import com.vector.pojo.PrecautionAdvice;
import com.vector.pojo.Prescription;
import com.vector.pojo.Reservation;
import com.vector.pojo.Role;
import com.vector.pojo.ScheduleTable;
import com.vector.pojo.Staff;
import com.vector.pojo.Task;
import com.vector.pojo.Title;
import com.vector.service.CheckItemService;
import com.vector.service.CheckRecordService;
import com.vector.service.DepartmentService;
import com.vector.service.DietAdviceService;
import com.vector.service.MedicalRecordService;
import com.vector.service.MedicationHistoryService;
import com.vector.service.MedicineService;
import com.vector.service.PatientService;
import com.vector.service.PrecautionAdviceService;
import com.vector.service.ReservationService;
import com.vector.service.RoleService;
import com.vector.service.StaffService;
import com.vector.service.TaskService;
import com.vector.service.TitleService;
import com.vector.service.WorkScheduleService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
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

    @Autowired
    MedicalRecordService medicalRecordService;

    @Autowired
    TaskService taskService;

    @Autowired
    CheckRecordService checkRecordService;

    @Autowired
    MedicationHistoryService medicationHistoryService;

    @Autowired
    DietAdviceService dietAdviceService;

    @Autowired
    PrecautionAdviceService precautionAdviceService;

    @Autowired
    ReservationService reservationService;

    @Autowired
    PatientService patientService;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//第二个参数是控制是否支持传入的值是空，这个值很关键，如果指定为false，那么如果前台没有传值的话就会报错
    }

    ////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/staffLogin", method = RequestMethod.POST)
    @ResponseBody
    public List staffLogin(Staff staff, String validateCode, HttpSession session) {
        return staffService.login(staff, validateCode, session);
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

        System.out.println(staff.getGender());
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

    @RequestMapping(value = "/getStaffByTitleItemNum/{titleId}", method = RequestMethod.POST)
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

    @RequestMapping(value = "/getStaffByDepartmentItemNum/{departmentId}", method = RequestMethod.POST)
    @ResponseBody
    public Integer showStaffListByDepartmentItemNumber(@PathVariable Integer departmentId) {
        return staffService.getStaffByDepartmentNameItemNum(departmentId);
    }

    @RequestMapping(value = "/goToStaffDetails/{id}", method = RequestMethod.GET)
    public String goToStaffDetails(@PathVariable Integer id, ModelMap map, HttpSession session) {
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

    @RequestMapping(value = "/medicineList/{description}/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Medicine> getMedicineList(@PathVariable String description, @PathVariable Integer currentPage) {
        return medicineService.getMedicineByDescription(description, currentPage);
    }

    @RequestMapping(value = "/medicineListItemNum/{description}", method = RequestMethod.POST)
    @ResponseBody
    public Integer showMedicineListItemNumber(@PathVariable String description) {
        return medicineService.getMedicineByDescriptionItemNum(description);
    }

    @RequestMapping(value = "/getMedicineOptions", method = RequestMethod.POST)
    @ResponseBody
    public List<Medicine> getMedicineOptions() {
        return medicineService.getMedicineList();
    }

    ///////////////////////////////////////////diagnosis///////////////////////////////////////////////////
    @RequestMapping(value = "/addMedicalRecord", method = RequestMethod.POST)
    @ResponseBody
    public boolean diagnosis(MedicalRecord medicalRecord, String IdCard, Prescription prescription, HttpSession session) {
        return medicalRecordService.insert(medicalRecord, IdCard, session, prescription);
    }

    @RequestMapping(value = "/medicalRecordList/{staffId}/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<MedicalRecord> medicalRecordList(@PathVariable Integer staffId, @PathVariable Integer currentPage) {
        return medicalRecordService.getMedicalRecordByStaffId(currentPage, staffId);
    }

    @RequestMapping(value = "/medicalRecordListItemNumber/{staffId}", method = RequestMethod.POST)
    @ResponseBody
    public Integer medicalRecordListItemNumber(@PathVariable Integer staffId) {
        return medicalRecordService.getMedicalRecordByStaffIdItemNum(staffId);
    }
    @RequestMapping(value="/getMedicalRecordById/{medicalRecordId}")
    @ResponseBody
    public MedicalRecord getMedicalRecordById(@PathVariable Integer medicalRecordId,ModelMap map){
        return medicalRecordService.getMedicalRecordById(medicalRecordId);
    }

    /////////////////////////////////////////////////task管理与执行/////////////////////////////////////////////////
    @RequestMapping(value = "/addTask", method = RequestMethod.POST)
    @ResponseBody
    public boolean addTask(Task task, Integer checkItemId, String IdCard, String taskContent, HttpSession session) {
        return taskService.insert(task, checkItemId, IdCard, taskContent, session);
    }

    @RequestMapping(value = "/unfinishedTaskList/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<Task> getUnFinishedTaskList(@PathVariable Integer currentPage, HttpSession session) {
        Staff staff = (Staff) session.getAttribute("staff");
        return taskService.getTaskUnFinishedByTargetId(staff.getStaffId(), currentPage);
    }

    @RequestMapping(value = "/unfinishedTaskListItemNumber", method = RequestMethod.POST)
    @ResponseBody
    public Integer getUnFinishedTaskListItemNumber(HttpSession session) {
        Staff staff = (Staff) session.getAttribute("staff");
        return taskService.getTaskUnFinishedItemNumberByTargetId(staff.getStaffId());
    }

    @RequestMapping(value = "/goToTaskDetails/{taskId}", method = RequestMethod.GET)
    public String goToTaskDetails(@PathVariable Integer taskId, ModelMap map, HttpSession session) {
        map.addAttribute("taskId", taskId);
        map.addAttribute("task", taskService.getTaskById(taskId));
        return "taskDetails";
    }

    @RequestMapping(value = "/finishTask", method = RequestMethod.POST)
    @ResponseBody
    public boolean finishTask(CheckRecord checkRecord, String resultFile, HttpSession session) {
        return checkRecordService.insert(checkRecord, resultFile, session);
    }

    @RequestMapping(value = "/changeTaskStatus", method = RequestMethod.POST)
    @ResponseBody
    public boolean changeTaskStatus(Integer taskId) {
        return taskService.changeTaskStatus(taskId);
    }

    @RequestMapping(value = "/getLastTaskByPatientIdCard", method = RequestMethod.POST)
    @ResponseBody
    public Task getLastTaskByPatientIdCard(String IdCard) {
        return taskService.getLastTaskByPatientIdCard(IdCard);
    }

    @RequestMapping(value = "/getCheckRecordOfToday", method = RequestMethod.POST)
    @ResponseBody
    public List<CheckRecord> getCheckRecordOfToday(Integer patientId) {
        return checkRecordService.getCheckRecordOfToday(patientId);
    }

    @RequestMapping(value = "/getMedicalRecordByIdCard/{IdCard}/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<MedicalRecord> getMedicalRecordByIdCard(@PathVariable String IdCard, @PathVariable Integer currentPage) {
        return medicalRecordService.getMedicalRecordByIdCard(IdCard, currentPage);
    }

    @RequestMapping(value = "/getMedicalRecordByIdCardItemNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer getMedicalRecordByIdCardItemNum(String IdCard) {
        return medicalRecordService.getMedicalRecordByIdCardItemNumber(IdCard);
    }
//////////////////////////////////////////////////////////MedicationHistory///////////////////////////////

    @RequestMapping(value = "/addMedicationHistory", method = RequestMethod.POST)
    @ResponseBody
    public boolean addMedicationHistory(MedicationHistory medicationHistory) {
        return medicationHistoryService.insert(medicationHistory);
    }

    @RequestMapping(value = "/medicalHistoryList/{patientId}/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List<MedicationHistory> medicalHistoryList(@PathVariable Integer patientId, @PathVariable Integer currentPage) {
        return medicationHistoryService.getList(currentPage, patientId);
    }

    @RequestMapping(value = "/medicalHistoryListItemNum/{patientId}", method = RequestMethod.POST)
    @ResponseBody
    public Integer medicalHistoryListItemNum(@PathVariable Integer patientId) {
        return medicationHistoryService.getListItemNumber(patientId);
    }
/////////////////////////////////////////////////////////dietAdvice////////////////////////////////////////

    @RequestMapping(value = "/dietAdviceEdit/{medicalRecordId}", method = RequestMethod.GET)
    public String goToDietAdviceEdit(@PathVariable Integer medicalRecordId, ModelMap map) {
        MedicalRecord medicalRecord = medicalRecordService.getMedicalRecordById(medicalRecordId);
        map.addAttribute("medicalRecord", medicalRecord);
        return "dietAdviceEdit";
    }

    @RequestMapping(value = "/addDietAdvice", method = RequestMethod.POST)
    @ResponseBody
    public boolean addDietAdvice(DietAdvice dietAdvice) {
        return dietAdviceService.insert(dietAdvice);
    }

    @RequestMapping(value = "/precautionAdviceEdit/{medicalRecordId}", method = RequestMethod.GET)
    public String precautionAdviceEdit(@PathVariable Integer medicalRecordId, ModelMap map) {
        MedicalRecord medicalRecord = medicalRecordService.getMedicalRecordById(medicalRecordId);
        map.addAttribute("medicalRecord", medicalRecord);
        return "precautionAdviceEdit";
    }

    @RequestMapping(value = "/addPrecautionAdvice", method = RequestMethod.POST)
    @ResponseBody
    public boolean addPrecautionAdvice(PrecautionAdvice precautionAdvice) {
        return precautionAdviceService.insert(precautionAdvice);
    }

    //////////////////////////////////////////reservationList/////////////////////////////////////////////
    @RequestMapping(value = "/reservationlist/{staffId}/{currentPage}")
    @ResponseBody
    public List<Reservation> getReservationListByStaffId(@PathVariable Integer staffId, @PathVariable Integer currentPage) {
        return reservationService.getUnExpiryReservationByStafftId(staffId, currentPage);
    }

    @RequestMapping(value = "/reservationlisSize/{staffId}")
    @ResponseBody
    public Integer getReservationListSizeByStaffId(@PathVariable Integer staffId) {
        return reservationService.getUnExpiryReservationByStafftIdListNum(staffId);
    }

    @RequestMapping(value = "/goToStaffReservationDetails/{patientId}")
    public String goToStaffMedicalDetails(@PathVariable Integer patientId, ModelMap map) {
        map.addAttribute("patient", patientService.getPatientById(patientId));
        return "staffReservationDetails";
    }

}
