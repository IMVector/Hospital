/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.Patient;

/**
 *
 * @author Vector
 */
public interface PatientDao extends BaseDao<Patient>,PaginationBaseDao<Patient> {

    public Patient getPatientByIdCard(String idCard);
    public Patient getPatientByEmail(String email);

}
