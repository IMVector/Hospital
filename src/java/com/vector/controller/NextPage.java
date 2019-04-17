/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Vector
 */
@Controller
public class NextPage {

    @RequestMapping({"/index", "/"})
    public String index(HttpServletRequest request, HttpSession session) {
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

    @RequestMapping(value = "patient/goToHealthGraphy")
    public String goToHealthGraphy(HttpSession session) {
        return "healthGraphy";
    }

    @RequestMapping(value = "patient/goToMedicalRecord")
    public String goToMedicalRecord(HttpSession session) {
        return "medicalRecord";
    }

    @RequestMapping(value = "staff/goToStaffIndex")
    public String goToStaffIndex() {
        return "staffIndex";
    }

    @RequestMapping(value = "staff/goToDiagnosis")
    public String goToDiagnosis(HttpSession session) {
        return "diagnosis";
    }

    @RequestMapping(value = "staff/goToExamineStaff")
    public String goToExamineStaff(HttpSession session) {
        return "examineStaff";
    }

    @RequestMapping(value = "staff/goToManageStaff")
    public String goToManageStaff(HttpSession session) {
        return "staffManage";
    }

    @RequestMapping(value = "staff/goToDepartmentManage")
    public String goToDepartmentManage(HttpSession session) {
        return "departmentManage";
    }

    @RequestMapping(value = "staff/goToTitleManage")
    public String goToTitleManage(HttpSession session) {
        return "titleManage";
    }

    @RequestMapping(value = "staff/goToRoleManage")
    public String goToRoleManage(HttpSession session) {
        return "roleManage";
    }

    @RequestMapping(value = "staff/goToCheckItemManage")
    public String goToCheckItemManage(HttpSession session) {
        return "checkItemManage";
    }

    @RequestMapping(value = "staff/goToMedicineManage")
    public String goToMedicineManage(HttpSession session) {
        return "medicineManage";
    }

    @RequestMapping(value = "staff/goToStaffLogin")
    public String goToStaffLogin() {
        return "staffLogin";
    }

    @RequestMapping(value = "patient/goToReservationList")
    public String gotoReservationList(HttpSession session) {
        return "patientReservation";
    }

    @RequestMapping(value = "patient/unload", method = RequestMethod.GET)
    public String patientUnload(HttpSession session) {
        session.removeAttribute("patient");
        return "patientIndex";
    }

    @RequestMapping(value = "staff/unload", method = RequestMethod.GET)
    public String staffUnload(HttpSession session) {
        session.removeAttribute("staff");
        return "staffIndex";
    }

    @RequestMapping(value = "staff/goToTaskList")
    public String goToTaskList(HttpSession session) {
        return "taskList";
    }

    @RequestMapping(value = "patient/goToCheckRecord")
    public String goToPatientCheckRecord() {
        return "patientCheckRecord";
    }

    @RequestMapping(value = "patient/goToPersonnelCenter")
    public String goToPersonnelCenter() {
        return "personnelCenter";
    }

    @RequestMapping(value = "patient/goToUpdatePatientIngo")
    public String goToUpdatePatientIngo() {
        return "patientInfoUpdate";
    }
    @RequestMapping(value = "staff/goToStaffDietAdvice")
    public String goToStaffDietAdvice() {
        return "staffDietAdvice";
    }
    @RequestMapping(value = "staff/goToStaffPrecautionAdvice")
    public String goToStaffPrecautionAdvice() {
        return "staffPrecautionAdvice";
    }
    @RequestMapping(value = "staff/goToStaffReservationList")
    public String goToStaffReservationList() {
        return "staffReservationList";
    }
    @RequestMapping(value = "staff/goToStaffPersonnelCenter")
    public String goToStaffPersonnelCenter() {
        return "staffPersonnelCenter";
    }
    @RequestMapping(value = "staff/goToStaffInfoUpdate")
    public String goToStaffInfoUpdate() {
        return "staffInfoUpdate";
    }
}
