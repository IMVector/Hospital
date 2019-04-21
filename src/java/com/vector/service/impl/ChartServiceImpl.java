/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.BillDao;
import com.vector.dao.MedicalRecordDao;
import com.vector.pojo.Bill;
import com.vector.pojo.MedicalRecord;
import com.vector.service.ChartService;
import java.io.Serializable;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class ChartServiceImpl implements ChartService {

    @Autowired
    MedicalRecordDao medicalRecordDao;

    @Autowired
    BillDao billDao;

    @Override
    public int[] getMedicalVisitsNum(Serializable patientId, Serializable year) {
        int month[] = new int[12];
        for (int i = 0; i < 12; i++) {
            month[i] = 0;
        }
        List<MedicalRecord> list = medicalRecordDao.getMedicalOfPatientByYear(patientId, year);
        for (MedicalRecord m : list) {
            month[m.getDate().getMonth()]++;
        }
        return month;
    }

    @Override
    public Set getMedicalYear(Serializable patientId) {
        List<MedicalRecord> list = medicalRecordDao.getAllMedicalRecordListofSomeone(patientId);
        Set yearSet = new HashSet();
        Calendar calendar = Calendar.getInstance();
        for (MedicalRecord m : list) {
            calendar.setTime(m.getDate());
            yearSet.add(calendar.get(Calendar.YEAR));
            System.out.println(calendar.get(Calendar.YEAR));
        }
        return yearSet;
    }

    @Override
    public Map getIllnessInfo(Serializable patientId, Serializable year) {
        List<MedicalRecord> list = medicalRecordDao.getMedicalOfPatientByYear(patientId, year);

        Map illnessMap = new HashMap();
        for (MedicalRecord m : list) {
            if (null != m.getDiagnosticDescription()) {
                if (illnessMap.containsKey(m.getDiagnosticDescription())) {
                    int value = (int) illnessMap.get(m.getDiagnosticDescription());
                    value++;
                    illnessMap.replace(m.getDiagnosticDescription(), value);
                } else {
                    illnessMap.put(m.getDiagnosticDescription(), 1);
                }
            }

        }
        return illnessMap;
    }

    @Override
    public double[] getMedicalVisitsFee(Serializable patientId, Serializable year) {

        double fee[] = new double[12];
        for (int i = 0; i < 12; i++) {
            fee[i] = 0;
        }
        List<Bill> list = billDao.getBillOfPatientByYear(patientId, year);
        for (Bill b : list) {
            fee[b.getBillDate().getMonth()] += b.getTotalAmount();
        }
        return fee;
    }
}
