/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Patient;
import java.io.Serializable;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vector
 */
public interface PatientService {
    
    public Patient getPatientById(Serializable patientId);

    public String register(Patient patient, String imagePath);

    public String validateEmail(String email);

    public String login(Patient patient, String validateCode, HttpSession session);
    
    public Patient validatePatientByIdCard(String IdCard);

    public boolean update(Patient patient);
}
