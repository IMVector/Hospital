/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.Patient;
import com.vector.service.PatientService;
import com.vector.service.StaffService;
import com.vector.service.WorkScheduleService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Vector
 */
@Controller
@RequestMapping("/patient")
public class PatientController {

    @Autowired
    PatientService patientService;
    @Autowired
    StaffService staffService;
    @Autowired
    WorkScheduleService scheduleService;

    @RequestMapping("/register")
    @ResponseBody
    public String register(Patient patient, String imagePath) {
        return patientService.register(patient, imagePath);
    }

    @RequestMapping("/validateEmail")
    @ResponseBody
    public String validateEmail(String email) {
        return patientService.validateEmail(email);
    }

    @RequestMapping(value = "/login", produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String login(Patient patient, String validateCode, HttpSession session) {
        return patientService.login(patient, validateCode, session);
    }

    @RequestMapping(value = "/goToReservation/{staffId}")
    public String goToReservation(@PathVariable Integer staffId, ModelMap map) {
        map.addAttribute("staff", staffService.getStaffById(staffId));
        map.addAttribute("schedule", scheduleService.getScheduleByStaffId(staffId));
        return "reservation";
    }

    @RequestMapping(value = "/reservation/{staffId}/{schedule}")
    @ResponseBody
    public boolean reservation(@PathVariable Integer staffId, @PathVariable String schedule, HttpSession session) {
        Patient p = (Patient) session.getAttribute("patient");
        return patientService.reservation(p,staffId, schedule);
    }
}
