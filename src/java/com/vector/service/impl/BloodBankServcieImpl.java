/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.BloodBankDao;
import com.vector.pojo.Bloodbank;
import com.vector.service.BloodBankService;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Vector
 */
public class BloodBankServcieImpl implements BloodBankService {

    @Autowired
    BloodBankDao bloodBankDao;

    @Override
    public boolean insert(Bloodbank t, Object... params) {
        try {
            bloodBankDao.insert(t);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Bloodbank t, Object... params) {
        try {
            bloodBankDao.update(t);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            bloodBankDao.delete(id);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return bloodBankDao.getListItemNumber();
    }

    @Override
    public List<Bloodbank> getList(Integer currentPage, Object... params) {
        return bloodBankDao.getList(currentPage);
    }

}
