/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Patient;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vector
 */
public interface PatientService {

    public String register(Patient patient, String imagePath);

    public String validateEmail(String email);

    public String login(Patient patient, String validateCode, HttpSession session);
}