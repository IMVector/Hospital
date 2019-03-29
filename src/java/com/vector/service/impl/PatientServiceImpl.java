/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.PatientDao;
import com.vector.pojo.Image;
import com.vector.pojo.Patient;
import com.vector.service.ImageService;
import com.vector.service.PatientService;
import com.vector.utils.Email;
import com.vector.utils.EmailValideCodeGain;
import com.vector.utils.IdCardUtils;
import com.vector.utils.MD5Utils;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class PatientServiceImpl implements PatientService {

    @Autowired
    PatientDao patientDao;
    
    @Autowired
    ImageService imageService;

    @Override
    public String register(Patient patient,String imagePath) {
        Patient patientData = patientDao.getPatientByIdCard(patient.getIdCard());
        if (null != patientData) {
            return "该用户已存在，请核对身份证号码后重试！";
        } else {
            patient.setPatientName(patient.getPatientName().trim());
            patient.setPatientAddress(patient.getPatientAddress().trim());
            patient.setPatientMstatus(patient.getPatientMstatus().trim());
            patient.setBloodType(patient.getBloodType().trim());

            Map map = IdCardUtils.getBirAgeSex(patient.getIdCard().trim());
            patient.setPatientBirthday(map.get("birthday").toString());
            patient.setPatientAge(Integer.parseInt(map.get("age").toString()));
            patient.setPatientGender(map.get("gender").toString());
            patient.setPatientPassword(MD5Utils.md5(patient.getPatientPassword()));

            if (!imagePath.equals("")) {
                Image image = imageService.getImageByPath(imagePath);
                patient.setImage(image);
            }

            try {
                patientDao.insert(patient);
            } catch (Exception e) {
                System.out.println(e);
            }
            return "注册成功";
        }

    }

    @Override
    public String validateEmail(String email) {
        String code = EmailValideCodeGain.getEmailRandCode();
        System.out.println(email);
        email = email.trim();
        boolean flag = Email.sendEmail(email, code);
        System.out.println(flag);
        if (flag) {
            return MD5Utils.md5(code);
        } else {
            return "ERROR";
        }
    }

    @Override
    public String login(Patient patient, String validateCode, HttpSession session) {

        if (!validateCode.equals(session.getAttribute("randomcode_key"))) {
            return "验证码错误";
        }
        Patient patientData = patientDao.getPatientByEmail(patient.getPatientEmail());
        if (null != patientData) {
            if (MD5Utils.md5(patient.getPatientPassword()).equals(patientData.getPatientPassword())) {
                session.setAttribute("patient", patientData);
                return "true";
            } else {
                return "密码错误，请检查后重试！";
            }

        } else {
            return "该用户不存在！";
        }
    }

}