/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.MedicalRecord;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface MedicalRecordService extends CUDService<MedicalRecord> {

    public List<MedicalRecord> getAllList(Serializable currentPage);//查询所有人的病历（分页）

    public int getListItemNumber();

    public List<MedicalRecord> getAllListOfSomeone(Serializable patientId, Serializable currentPage);//查询单个人的病历（分页）

    public int getListItemNumberOfSomeone(Serializable patientId);

    public MedicalRecord getMedicalRecordById(Serializable MdeicalRecordId);

    public List<MedicalRecord> getMedicalRecordByIdCard(Serializable IdCard, Serializable currentPage);

    public Integer getMedicalRecordByIdCardItemNumber(Serializable IdCard);

    public MedicalRecord getLastMedicalRecord(Serializable patientId);

    public List<MedicalRecord> getUnPayMedicalRecord(Serializable patientId);

    public List<MedicalRecord> getMedicalRecordByStaffId(Integer currentPage, Serializable staffId);

    public Integer getMedicalRecordByStaffIdItemNum(Serializable staffId);
}
