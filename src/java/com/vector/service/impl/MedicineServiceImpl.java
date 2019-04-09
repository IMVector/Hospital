/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.MedicineDao;
import com.vector.pojo.Medicine;
import com.vector.service.MedicineService;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    MedicineDao medicineDao;

    @Override
    public List<Medicine> getMedicineByName(Serializable name) {
        return medicineDao.getMedicineByName(name);
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return medicineDao.getListItemNumber();
    }

    @Override
    public List<Medicine> getList(Integer currentPage, Object... params) {
        return medicineDao.getList(currentPage);
    }

    @Override
    public List<Medicine> getMedicineList() {
        return medicineDao.getMedicineList();
    }

    @Override
    public boolean insert(Medicine t, Object... params) {
        try {
            medicineDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Medicine t, Object... params) {
        try {
            medicineDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            medicineDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public List<Medicine> getMedicineByDescription(String description, Integer currentPage) {
        return medicineDao.getMedicineByDescription(description,currentPage);
    }

    @Override
    public Integer getMedicineByDescriptionItemNum(String description) {
        return medicineDao.getMedicineByDescriptionItemNum(description);
    }

}
