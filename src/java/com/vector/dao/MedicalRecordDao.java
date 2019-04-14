/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.MedicalRecord;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface MedicalRecordDao extends BaseDao<MedicalRecord> {

    public List<MedicalRecord> getAllMedicalRecordList(Serializable curentPage);

    public int getListItemNumber();

    public List<MedicalRecord> getAllMedicalRecordListOfSomeOne(Serializable patientId, Serializable curentPage);

    public int getListItemNumberOfSomeOne(Serializable patientId);

    public List<MedicalRecord> getAllMedicalRecordListofSomeone(Serializable patientId);

    public List<MedicalRecord> getMedicalOfPatientByYear(Serializable patientId, Serializable year);

    public MedicalRecord getLastMedicalRecord(Serializable patientId);

    public List<MedicalRecord> getUnPayMedicalRecord(Serializable patientId);

}
