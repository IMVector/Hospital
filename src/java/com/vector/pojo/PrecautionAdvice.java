package com.vector.pojo;
// Generated 2019-4-19 19:19:15 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * PrecautionAdvice generated by hbm2java
 */
public class PrecautionAdvice  implements java.io.Serializable {


     private Integer precautionAdviceId;
     private Patient patient;
     private Staff staff;
     private String precautionAdviceContent;
     private Date dietAdviceTime;
     private Integer lastId;
     private String role;

    public PrecautionAdvice() {
    }

	
    public PrecautionAdvice(Patient patient, Staff staff, String precautionAdviceContent, Date dietAdviceTime) {
        this.patient = patient;
        this.staff = staff;
        this.precautionAdviceContent = precautionAdviceContent;
        this.dietAdviceTime = dietAdviceTime;
    }
    public PrecautionAdvice(Patient patient, Staff staff, String precautionAdviceContent, Date dietAdviceTime, Integer lastId, String role) {
       this.patient = patient;
       this.staff = staff;
       this.precautionAdviceContent = precautionAdviceContent;
       this.dietAdviceTime = dietAdviceTime;
       this.lastId = lastId;
       this.role = role;
    }
   
    public Integer getPrecautionAdviceId() {
        return this.precautionAdviceId;
    }
    
    public void setPrecautionAdviceId(Integer precautionAdviceId) {
        this.precautionAdviceId = precautionAdviceId;
    }
    public Patient getPatient() {
        return this.patient;
    }
    
    public void setPatient(Patient patient) {
        this.patient = patient;
    }
    public Staff getStaff() {
        return this.staff;
    }
    
    public void setStaff(Staff staff) {
        this.staff = staff;
    }
    public String getPrecautionAdviceContent() {
        return this.precautionAdviceContent;
    }
    
    public void setPrecautionAdviceContent(String precautionAdviceContent) {
        this.precautionAdviceContent = precautionAdviceContent;
    }
    public Date getDietAdviceTime() {
        return this.dietAdviceTime;
    }
    
    public void setDietAdviceTime(Date dietAdviceTime) {
        this.dietAdviceTime = dietAdviceTime;
    }
    public Integer getLastId() {
        return this.lastId;
    }
    
    public void setLastId(Integer lastId) {
        this.lastId = lastId;
    }
    public String getRole() {
        return this.role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }




}


