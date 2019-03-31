/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Vector
 */
@Controller
public class NextPage {

    @RequestMapping({"/index", "/"})
    public String index() {
        return "mainIndex";
    }

    @RequestMapping("/patientIndex")
    public String goToPatientIndex() {
        return "patientIndex";
    }

    @RequestMapping("patient/goToRegister")
    public String goToPatientRegister() {
        return "patientRegister";
    }

    @RequestMapping("patient/goToLogin")
    public String goToPatientLogin() {
        return "patientLogin";
    }

    @RequestMapping(value = "patient/goToDepartmentInfo/{departmentName}", method = RequestMethod.GET)
    public String goToDepartmentInfo(@PathVariable String departmentName, Model model) {
        model.addAttribute("departmentName", departmentName);
        return "departmentInfo";
    }

    @RequestMapping(value = "patient/goToAttendanceToPatient")
    public String goToAttendanceToPatient() {
        return "attendanceToPatient";
    }

    @RequestMapping(value = "patient/goToHealthGraphy")
    public String goToHealthGraphy() {
        return "healthGraphy";
    }

    @RequestMapping(value = "patient/goToMedicalRecord")
    public String goToMedicalRecord() {
        return "medicalRecord";
    }

    @RequestMapping(value = "staff/goToStaffIndex")
    public String goToStaffIndex() {
        return "staffIndex";
    }

    @RequestMapping(value = "staff/goToDiagnosis")
    public String goToDiagnosis() {
        return "diagnosis";
    }

    @RequestMapping(value = "staff/goToExamineStaff")
    public String goToExamineStaff() {
        return "examineStaff";
    }

    @RequestMapping(value = "staff/goToManageStaff")
    public String goToManageStaff() {
        return "staffManage";
    }

    @RequestMapping(value = "staff/goToDepartmentManage")
    public String goToDepartmentManage() {
        return "departmentManage";
    }

    @RequestMapping(value = "staff/goToTitleManage")
    public String goToTitleManage() {
        return "titleManage";
    }

    @RequestMapping(value = "staff/goToRoleManage")
    public String goToRoleManage() {
        return "roleManage";
    }

    @RequestMapping(value = "staff/goToCheckItemManage")
    public String goToCheckItemManage() {
        return "checkItemManage";
    }

    @RequestMapping(value = "staff/goToMedicineManage")
    public String goToMedicineManage() {
        return "medicineManage";
    }

}
