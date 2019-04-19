/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.PrescriptionDao;
import com.vector.pojo.Medicine;
import com.vector.pojo.Prescription;
import com.vector.service.MedicineService;
import com.vector.service.PrescriptionService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class PrescriptionServiceImpl implements PrescriptionService {

    @Autowired
    PrescriptionDao prescriptionDao;

    @Autowired
    MedicineService medicineService;

    @Override
    public boolean insert(Prescription t, Object... params) {
        try {
            prescriptionDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Prescription t, Object... params) {
        try {
            prescriptionDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            prescriptionDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return prescriptionDao.getListItemNumber();
    }

    @Override
    public List<Prescription> getList(Integer currentPage, Object... params) {
        return prescriptionDao.getList(currentPage);
    }

    @Override
    public List<Prescription> getPrescriptionByMedicalRecordId(Serializable MedicalRecordId) {
        return prescriptionDao.getPrescriptionByMedicalRecordId(MedicalRecordId);
    }

    @Override
    public Map getMedicalRecordPrescription(Serializable MedicalRecordId) {
        ModelMap map = new ModelMap();
        List<Prescription> prescriptionList = prescriptionDao.getPrescriptionByMedicalRecordId(MedicalRecordId);
        if (!prescriptionList.isEmpty()) {
            List<Medicine> mlist = new ArrayList();
            Prescription prescription = prescriptionList.get(0);
            String medicineIdArray[] = prescription.getPrescriptionContent().split(",");
            for (int i = 0; i < medicineIdArray.length; i++) {
                mlist.add(medicineService.getMedicineById(Integer.parseInt(medicineIdArray[i])));
            }
            map.addAttribute("prescription", prescription);
            map.addAttribute("medicineList", mlist);
            return map;
        } else {
            return null;
        }

    }

}
