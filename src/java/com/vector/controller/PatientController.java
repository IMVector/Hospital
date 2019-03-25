/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.controller;

import com.vector.pojo.Patient;
import com.vector.service.PatientService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
