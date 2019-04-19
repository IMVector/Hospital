/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.PrecautionAdvice;
import com.vector.pojo.Prescription;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface PrescriptionDao extends BaseDao<Prescription>, PaginationBaseDao<Prescription> {

    public List<Prescription> getPrescriptionByMedicalRecordId(Serializable MedicalRecordId);

}
