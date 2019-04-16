package com.vector.service.impl;

import com.vector.dao.BillDao;
import com.vector.pojo.Bill;
import com.vector.pojo.CheckRecord;
import com.vector.pojo.MedicalRecord;
import com.vector.pojo.Patient;
import com.vector.pojo.Prescription;
import com.vector.service.BillService;
import com.vector.service.CheckRecordService;
import com.vector.service.MedicalRecordService;
import com.vector.service.MedicineService;
import com.vector.service.PrescriptionService;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Vector
 */
public class BillServiceImpl implements BillService {

    @Autowired
    CheckRecordService checkRecordService;

    @Autowired
    MedicalRecordService medicalRecordService;

    @Autowired
    PrescriptionService prescriptionService;

    @Autowired
    MedicineService medicineService;

    @Autowired
    BillDao billDao;

    @Override

    public boolean insert(Bill t, Object... params) {
        try {
            billDao.insert(t);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Bill t, Object... params) {
        try {
            billDao.update(t);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            billDao.delete(id);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return billDao.getListItemNumber(params[0]);
    }

    @Override
    public List<Bill> getList(Integer currentPage, Object... params) {
        return billDao.getList(currentPage, params[0]);
    }

    @Override
    public boolean getToPayItem(Serializable patientId) {
        List<CheckRecord> cList = checkRecordService.getUnPayCheckRecordByPatientId(patientId);
        List<MedicalRecord> mList = medicalRecordService.getUnPayMedicalRecord(patientId);
        String chargeItem = "";
        float totalAmount = 0;

        chargeItem = "checkRecordId,";
        for (CheckRecord c : cList) {
            totalAmount += c.getCheckItem().getCheckItemPrice();
            chargeItem = chargeItem + c.getCheckRecordId() + ",";
        }
        chargeItem += "medicalRecord,";
        for (MedicalRecord m : mList) {
            List<Prescription> list = prescriptionService.getPrescriptionByMedicalRecordId(m.getMedicalRecordId());
            for (Prescription p : list) {
                String medicineCollections = p.getPrescriptionContent();
                String array[] = medicineCollections.split(",");
                for (int i = 0; i < array.length; i++) {
                    totalAmount += medicineService.getMedicineById(Integer.parseInt(array[i])).getMedicinePrice();
                }
            }
            chargeItem = chargeItem + m.getMedicalRecordId() + ",";
        }
        Patient p = new Patient();
        p.setPatientId(Integer.parseInt(patientId.toString()));

        Bill bill = new Bill(p, "否", new Date(), totalAmount, chargeItem);
        return insert(bill);
    }

}
