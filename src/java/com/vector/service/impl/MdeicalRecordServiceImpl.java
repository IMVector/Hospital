/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.MedicalRecordDao;
import com.vector.dao.PatientDao;
import com.vector.pojo.MedicalRecord;
import com.vector.pojo.Patient;
import com.vector.pojo.Prescription;
import com.vector.pojo.Staff;
import com.vector.service.MedicalRecordService;
import com.vector.service.PrescriptionService;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
public class MdeicalRecordServiceImpl implements MedicalRecordService {

    @Autowired
    MedicalRecordDao medicalRecordDao;

    @Autowired
    PatientDao patientDao;

    @Autowired
    PrescriptionService prescriptionService;

    @Override
    public List<MedicalRecord> getAllList(Serializable currentPage) {
        return medicalRecordDao.getAllMedicalRecordList(currentPage);
    }

    @Override
    public int getListItemNumber() {
        return medicalRecordDao.getListItemNumber();
    }

    @Override
    public List<MedicalRecord> getAllListOfSomeone(Serializable patientId, Serializable currentPage) {
        return medicalRecordDao.getAllMedicalRecordListOfSomeOne(patientId, currentPage);
    }

    @Override
    public int getListItemNumberOfSomeone(Serializable patientId) {
        return medicalRecordDao.getListItemNumberOfSomeOne(patientId);
    }

    @Override
    public boolean insert(MedicalRecord t, Object... params) {
        String idCard = params[0].toString();
        Patient patient = patientDao.getPatientByIdCard(idCard);
        HttpSession session = (HttpSession) params[1];
        Prescription prescription = (Prescription) params[2];
        Staff staff = (Staff) session.getAttribute("staff");

        prescription.setMedicalRecord(t);

        t.setPaymentStatus("否");
        t.setPatient(patient);
        t.setStaff(staff);
        t.setDate(new Date());

        try {
            medicalRecordDao.insert(t);
            MedicalRecord medicalRecord = getLastMedicalRecord(patient.getPatientId());
            prescription.setMedicalRecord(medicalRecord);
            prescription.setPrescriptionDate(new Date());

            prescriptionService.insert(prescription);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(MedicalRecord t, Object... params) {
        try {
            medicalRecordDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            medicalRecordDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public MedicalRecord getMedicalRecordById(Serializable MdeicalRecordId) {
        return medicalRecordDao.getOneById(MdeicalRecordId);
    }

    @Override
    public List<MedicalRecord> getMedicalRecordByIdCard(Serializable IdCard, Serializable currentPage) {
        Patient patient = patientDao.getPatientByIdCard(IdCard.toString());
        return medicalRecordDao.getAllMedicalRecordListOfSomeOne(patient.getPatientId(), currentPage);
    }

    @Override
    public Integer getMedicalRecordByIdCardItemNumber(Serializable IdCard) {
        Patient patient = patientDao.getPatientByIdCard(IdCard.toString());
        return medicalRecordDao.getListItemNumberOfSomeOne(patient.getPatientId());
    }

    @Override
    public MedicalRecord getLastMedicalRecord(Serializable patientId) {
        return medicalRecordDao.getLastMedicalRecord(patientId);
    }

    @Override
    public List<MedicalRecord> getUnPayMedicalRecord(Serializable patientId) {
        return medicalRecordDao.getUnPayMedicalRecord(patientId);
    }

    @Override
    public List<MedicalRecord> getMedicalRecordByStaffId(Integer currentPage, Serializable staffId) {
         return medicalRecordDao.getMedicalRecordByStaffId(currentPage,staffId);
    }

    @Override
    public Integer getMedicalRecordByStaffIdItemNum(Serializable staffId) {
        return medicalRecordDao.getMedicalRecordByStaffIdItemNum(staffId);
    }

}
