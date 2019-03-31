/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.Patient;
import com.vector.pojo.Reservation;
import com.vector.service.PatientService;
import com.vector.service.ReservationService;
import com.vector.service.StaffService;
import com.vector.service.WorkScheduleService;
import java.text.ParseException;
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

    @Autowired
    ReservationService reservationService;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//第二个参数是控制是否支持传入的值是空，这个值很关键，如果指定为false，那么如果前台没有传值的话就会报错
    }

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
    public boolean reservation(@PathVariable Integer staffId, @PathVariable String schedule, Date reservationDate, HttpSession session) throws ParseException {
        Patient p = (Patient) session.getAttribute("patient");
        return reservationService.reservation(p, staffId, schedule, reservationDate);
    }

    @RequestMapping(value = "/goToReservationList")
    public String gotoReservationList(HttpSession session) {
        return "patientReservation";
    }

    @RequestMapping(value = "/reservationlist/{patientId}/{currentPage}")
    @ResponseBody
    public List<Reservation> getReservationListByPatientId(@PathVariable Integer patientId, @PathVariable Integer currentPage) {
        return reservationService.getUnExpiryReservationByPatientId(patientId, currentPage);
    }

    @RequestMapping(value = "/reservationlisSize/{patientId}")
    @ResponseBody
    public Integer getReservationListSizeByPatientId(@PathVariable Integer patientId) {
        return reservationService.getUnExpiryReservationByPatientIdListNum(patientId);
    }

}
