package com.vector.pojo;
// Generated 2019-3-22 22:17:21 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Prescription generated by hbm2java
 */
public class Prescription  implements java.io.Serializable {


     private Integer prescriptionId;
     private MedicalRecord medicalRecord;
     private String prescriptionContent;
     private Date prescriptionDate;
     private String prescriptionPrecautions;

    public Prescription() {
    }

	
    public Prescription(MedicalRecord medicalRecord, String prescriptionContent, Date prescriptionDate) {
        this.medicalRecord = medicalRecord;
        this.prescriptionContent = prescriptionContent;
        this.prescriptionDate = prescriptionDate;
    }
    public Prescription(MedicalRecord medicalRecord, String prescriptionContent, Date prescriptionDate, String prescriptionPrecautions) {
       this.medicalRecord = medicalRecord;
       this.prescriptionContent = prescriptionContent;
       this.prescriptionDate = prescriptionDate;
       this.prescriptionPrecautions = prescriptionPrecautions;
    }
   
    public Integer getPrescriptionId() {
        return this.prescriptionId;
    }
    
    public void setPrescriptionId(Integer prescriptionId) {
        this.prescriptionId = prescriptionId;
    }
    public MedicalRecord getMedicalRecord() {
        return this.medicalRecord;
    }
    
    public void setMedicalRecord(MedicalRecord medicalRecord) {
        this.medicalRecord = medicalRecord;
    }
    public String getPrescriptionContent() {
        return this.prescriptionContent;
    }
    
    public void setPrescriptionContent(String prescriptionContent) {
        this.prescriptionContent = prescriptionContent;
    }
    public Date getPrescriptionDate() {
        return this.prescriptionDate;
    }
    
    public void setPrescriptionDate(Date prescriptionDate) {
        this.prescriptionDate = prescriptionDate;
    }
    public String getPrescriptionPrecautions() {
        return this.prescriptionPrecautions;
    }
    
    public void setPrescriptionPrecautions(String prescriptionPrecautions) {
        this.prescriptionPrecautions = prescriptionPrecautions;
    }




}


