/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.CheckRecord;
import com.vector.pojo.MedicalRecord;
import com.vector.pojo.Patient;
import com.vector.pojo.Reservation;
import com.vector.pojo.ScheduleTable;
import com.vector.service.AttendanceService;
import com.vector.service.ChartService;
import com.vector.service.CheckRecordService;
import com.vector.service.DepartmentService;
import com.vector.service.MedicalRecordService;
import com.vector.service.PatientService;
import com.vector.service.ReservationService;
import com.vector.service.StaffService;
import com.vector.service.WorkScheduleService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @Autowired
    MedicalRecordService medicalRecordService;

    @Autowired
    ChartService chartService;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    AttendanceService attendanceServicce;

    @Autowired
    CheckRecordService checkRecordService;

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
    public String goToReservation(@PathVariable Integer staffId, ModelMap map, HttpSession session) {
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
    @RequestMapping(value = "/deleteReservation/{reservationId}")
    @ResponseBody
    public boolean cancleReservation(@PathVariable Integer reservationId) {
        return reservationService.cancleReservation(reservationId);
    }

    @RequestMapping(value = "isIdCardexist/{idCard}")
    @ResponseBody
    public Patient isIdCardExist(@PathVariable String idCard) {
        return patientService.validatePatientByIdCard(idCard);
    }

    @RequestMapping(value = "/goToDepartmentInfo/{departmentId}", method = RequestMethod.GET)
    public String goToDepartmentInfo(@PathVariable Integer departmentId, Model model, HttpSession session) {
        model.addAttribute("department", departmentService.getDaprtmentById(departmentId));
        return "departmentInfo";
    }

    //////////////////////////////////////////病例报告//////////////////////////////////////////////
    @RequestMapping(value = "/medicalRecordDetails/{MdeicalRecordId}", method = RequestMethod.GET)
    public String showMdeicalRecordDetails(@PathVariable Integer MdeicalRecordId, Model model, HttpSession session) {
        MedicalRecord medicalRecord = medicalRecordService.getMedicalRecordById(MdeicalRecordId);
        model.addAttribute("medicalRecord", medicalRecord);
        return "medicalRecordDetails";
    }

    @RequestMapping(value = "/medicalRecordList/{patientId}/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List showMdeicalRecordList(@PathVariable Integer patientId, @PathVariable Integer currentPage) {
        List<MedicalRecord> list = medicalRecordService.getAllListOfSomeone(patientId, currentPage);
        return list;
    }

    @RequestMapping(value = "/medicalRecordListItemNumber/{patientId}", method = RequestMethod.POST)
    @ResponseBody
    public Integer showMdeicalRecordListItemNumber(@PathVariable Integer patientId) {
        return medicalRecordService.getListItemNumberOfSomeone(patientId);
    }

    //////////////////////////////////健康内容可视化//////////////////////////////////////////////////////
    @RequestMapping(value = "/graphy_times/{patientId}/{year}", method = RequestMethod.POST)
    @ResponseBody
    public int[] getMedicalOfPatientByYear(@PathVariable Integer patientId, @PathVariable Integer year, Model model) {
        return chartService.getMedicalVisitsNum(patientId, year);

    }

    @RequestMapping(value = "/graphy_fee/{patientId}/{year}", method = RequestMethod.POST)
    @ResponseBody
    public double[] getMedicalFeeOfPatientByYear(@PathVariable Integer patientId, @PathVariable Integer year, Model model) {
        return chartService.getMedicalVisitsFee(patientId, year);

    }

    @RequestMapping(value = "/medicalRecordYearSet/{patientId}", method = RequestMethod.POST)
    @ResponseBody
    public Set getMedicalRecordYearSetOfSomeone(@PathVariable Integer patientId) {
        return chartService.getMedicalYear(patientId);
    }

    @RequestMapping(value = "/illnessInfo/{patientId}/{year}", method = RequestMethod.POST)
    @ResponseBody
    public Map getIllnessInfo(@PathVariable Integer patientId, @PathVariable Integer year) {
        return chartService.getIllnessInfo(patientId, year);
    }

    @RequestMapping(value = "/toToAttendance/{departmentId}", method = RequestMethod.GET)
    public String goToAttendance(@PathVariable Integer departmentId, ModelMap map) {
        map.addAttribute("departmentId", departmentId);
        return "attendance";
    }

    @RequestMapping(value = "/departmentAttendance/{departmentId}", method = RequestMethod.POST)
    @ResponseBody
    public List<ScheduleTable> getAttendanceTableByDepartmentId(@PathVariable Integer departmentId) {
        return attendanceServicce.getScheduleTableByDepartmentId(departmentId);
    }

    @RequestMapping(value = "/goToAttendanceToPatient/{departmentId}")
    public String goToAttendanceToPatient(@PathVariable Integer departmentId, ModelMap map) {
        map.addAttribute("departmentId", departmentId);
        return "attendanceToPatient";
    }

    /////////////////////////////////////检查记录以及检查结果报告///////////////////////////////////////////////////
    @RequestMapping(value = "/checkRecordList/{patientId}/{currentPage}", method = RequestMethod.POST)
    @ResponseBody
    public List showCheckRecordList(@PathVariable Integer patientId, @PathVariable Integer currentPage) {
        List<CheckRecord> list = checkRecordService.getList(currentPage, patientId);
        return list;
    }

    @RequestMapping(value = "/checkRecordListItemNumber/{patientId}", method = RequestMethod.POST)
    @ResponseBody
    public Integer showCheckRecordListItemNumber(@PathVariable Integer patientId) {
        return checkRecordService.getListItemNumber(patientId);
    }

    @RequestMapping("/checkRecordDetails/{checkRecordId}")
    public String checkRecordDetails(@PathVariable Integer checkRecordId, ModelMap map) {
        map.addAttribute("checkRecord", checkRecordService.getCheckRecordById(checkRecordId));
        return "patientCheckRecordDetails";
    }

//    @RequestMapping(value = "/checkRecordDetails/{checkRecordId}", method = RequestMethod.GET)
//    public String showCheckRecordDetails(@PathVariable Integer checkRecordId, Model model) {
//        CheckRecord checkRecord = checkRecordService.getOneById(checkRecordId);
//        model.addAttribute("checkRecord", checkRecord);
//        return "checkRecordDetails";
//    }
    ///////////////////////////////////////处方报告/////////////////////////////////////////////////
//    @RequestMapping(value = "/prescriptionList/{patientId}/{currentPage}", method = RequestMethod.POST)
//    @ResponseBody
//    public List showPrescriptionList(@PathVariable String patientId, @PathVariable Integer currentPage) {
//        List<Prescription> list = prescriptionService.getAllListOfSomeone(patientId, currentPage);
//        return list;
//    }
//
//    @RequestMapping(value = "/prescriptionListItemNumber/{patientId}", method = RequestMethod.POST)
//    @ResponseBody
//    public Integer showPrescriptionListItemNumber(@PathVariable String patientId) {
//        return prescriptionService.getListItemNumber(patientId);
//    }
//
//    @RequestMapping(value = "/prescriptionDetails/{prescriptionId}", method = RequestMethod.GET)
//    public String showPrescriptionDetails(@PathVariable Integer prescriptionId, Model model) {
//        Prescription prescription = prescriptionService.getOneById(prescriptionId);
//        model.addAttribute("prescription", prescription);
//        return "prescriptionDetails";
//    }
}
