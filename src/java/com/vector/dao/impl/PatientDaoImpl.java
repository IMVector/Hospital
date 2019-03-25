/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.PatientDao;
import com.vector.pojo.Patient;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class PatientDaoImpl extends BaseDaoImpl<Patient> implements PatientDao {

    @Override
    public Patient getPatientByIdCard(String idCard) {
        String hql = "from Patient where idCard = ?";
        List<Patient> list = getListByQuery(hql, idCard);
        if (list.isEmpty()) {
            return null;
        } else {
            return list.get(0);
        }
    }

    @Override
    public Patient getPatientByEmail(String email) {
        String hql = "from Patient where patientEmail = ?";
        List<Patient> list = getListByQuery(hql, email);
        if (list.isEmpty()) {
            return null;
        } else {
            return list.get(0);
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Patient> getList(Integer currentPage, Object... params) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
