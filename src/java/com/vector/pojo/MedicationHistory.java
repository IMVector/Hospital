package com.vector.pojo;
// Generated 2019-3-22 22:17:21 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * MedicationHistory generated by hbm2java
 */
public class MedicationHistory  implements java.io.Serializable {


     private int medicationHistoryId;
     private Medicine medicine;
     private Patient patient;
     private String adverseReactions;
     private String duration;
     private Date lastTime;

    public MedicationHistory() {
    }

    public MedicationHistory(int medicationHistoryId, Medicine medicine, Patient patient, String adverseReactions, String duration, Date lastTime) {
       this.medicationHistoryId = medicationHistoryId;
       this.medicine = medicine;
       this.patient = patient;
       this.adverseReactions = adverseReactions;
       this.duration = duration;
       this.lastTime = lastTime;
    }
   
    public int getMedicationHistoryId() {
        return this.medicationHistoryId;
    }
    
    public void setMedicationHistoryId(int medicationHistoryId) {
        this.medicationHistoryId = medicationHistoryId;
    }
    public Medicine getMedicine() {
        return this.medicine;
    }
    
    public void setMedicine(Medicine medicine) {
        this.medicine = medicine;
    }
    public Patient getPatient() {
        return this.patient;
    }
    
    public void setPatient(Patient patient) {
        this.patient = patient;
    }
    public String getAdverseReactions() {
        return this.adverseReactions;
    }
    
    public void setAdverseReactions(String adverseReactions) {
        this.adverseReactions = adverseReactions;
    }
    public String getDuration() {
        return this.duration;
    }
    
    public void setDuration(String duration) {
        this.duration = duration;
    }
    public Date getLastTime() {
        return this.lastTime;
    }
    
    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }




}

