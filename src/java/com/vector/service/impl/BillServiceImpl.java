package com.vector.service.impl;

import com.vector.dao.BillDao;
import com.vector.pojo.Bill;
import com.vector.pojo.CheckRecord;
import com.vector.pojo.MedicalRecord;
import com.vector.pojo.Medicine;
import com.vector.pojo.Patient;
import com.vector.pojo.Prescription;
import com.vector.service.BillService;
import com.vector.service.CheckRecordService;
import com.vector.service.MedicalRecordService;
import com.vector.service.MedicineService;
import com.vector.service.PrescriptionService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
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
    public boolean getToPayItem(Serializable patientId, HttpSession session) {//在同一个Transaction里要成功都成功要失败都失败

        List<CheckRecord> cList = checkRecordService.getUnPayCheckRecordByPatientId(patientId);//获取未支付的检查
        List<MedicalRecord> mList = medicalRecordService.getUnPayMedicalRecord(patientId);//获取未支付的病例
        String chargeItem = "";//收费项目以逗号分割
        float totalAmount = 0;

        chargeItem = "checkRecordId,";//分割标志头
        for (CheckRecord c : cList) {
            totalAmount += c.getCheckItem().getCheckItemPrice();
            chargeItem = chargeItem + c.getCheckRecordId() + ",";
            alterCheckRecordPaymentStatus(c);//修改支付状态防止下次被重新计算
        }
        chargeItem += "medicine,";//分割标志头
        for (MedicalRecord m : mList) {
            List<Prescription> list = prescriptionService.getPrescriptionByMedicalRecordId(m.getMedicalRecordId());
            for (Prescription p : list) {
                String medicineCollections = p.getPrescriptionContent();
                String array[] = medicineCollections.split(",");
                for (int i = 0; i < array.length; i++) {
                    Medicine medicine = medicineService.getMedicineById(Integer.parseInt(array[i]));
                    totalAmount += medicine.getMedicinePrice();
                    chargeItem = chargeItem + medicine.getMedicineId() + ",";
                }
            }

            alterMedicalRecordPaymentStatus(m);//修改支付状态防止下次被重新计算
        }
        Patient p = new Patient();
        p.setPatientId(Integer.parseInt(patientId.toString()));

        Bill bill = new Bill(p, "否", new Date(), totalAmount, chargeItem);
        return insert(bill);
    }

    @Override
    public Bill getLastUnPaidBill(Serializable PatientId) {
        return billDao.getLastUnPaidBill(PatientId);
    }

    public boolean alterCheckRecordPaymentStatus(CheckRecord c) {
        c.setPaymentStatus("是");
        return checkRecordService.update(c);
    }

    public boolean alterMedicalRecordPaymentStatus(MedicalRecord m) {
        m.setPaymentStatus("是");
        return medicalRecordService.update(m);
    }

    @Override
    public Map getBillItemInfo(Serializable billId) {
        Bill bill = billDao.getOneById(billId);
        ModelMap map = new ModelMap();
        List<CheckRecord> clist = new ArrayList();
        List<Medicine> mlist = new ArrayList();
        //checkRecordId
        //,2,3,4,5,6,7,8,9,10,11,
        //medicalRecord
        //,1,2,3,4,5,6,7,8,11,22,23,
        String itemArray[] = bill.getChargeItem().trim().split("medicine");
        itemArray[0].replace("checkRecordId", "");
        String checkRecordItem[] = itemArray[0].split(",");
        String medicalRecordItem[] = itemArray[1].split(",");

        for (int i = 1; i < checkRecordItem.length; i++) {
            System.out.println("+" + checkRecordItem[i]);
            clist.add(checkRecordService.getCheckRecordById(Integer.parseInt(checkRecordItem[i])));
        }
        for (int i = 1; i < medicalRecordItem.length; i++) {
            System.out.println("-" + medicalRecordItem[i]);
            mlist.add(medicineService.getMedicineById(Integer.parseInt(medicalRecordItem[i])));
        }
        map.addAttribute("checkRecordLsit", clist);
        map.addAttribute("medicineList", mlist);
        return map;
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

    @Override
    public Bill getBillById(Serializable billId) {
        return billDao.getOneById(billId);
    }
}
