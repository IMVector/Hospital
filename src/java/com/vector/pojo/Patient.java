package com.vector.pojo;
// Generated 2019-3-22 22:17:21 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Patient generated by hbm2java
 */
public class Patient  implements java.io.Serializable {


     private Integer patientId;
     private Image image;
     private String patientName;
     private String patientBirthday;
     private String patientGender;
     private int patientAge;
     private String bloodType;
     private String patientPhone;
     private String patientAddress;
     private String patientMstatus;
     private String patientEmail;
     private String patientPassword;
     private String idCard;
     private Set bills = new HashSet(0);
     private Set precautionAdvices = new HashSet(0);
     private Set dietAdvices = new HashSet(0);
     private Set reservations = new HashSet(0);
     private Set checkRecords = new HashSet(0);
     private Set medicationHistories = new HashSet(0);
     private Set medicalRecords = new HashSet(0);
     private Set tasks = new HashSet(0);

    public Patient() {
    }

	
    public Patient(String patientName, String patientBirthday, String patientGender, int patientAge, String patientPhone, String patientAddress, String patientMstatus, String patientEmail, String patientPassword, String idCard) {
        this.patientName = patientName;
        this.patientBirthday = patientBirthday;
        this.patientGender = patientGender;
        this.patientAge = patientAge;
        this.patientPhone = patientPhone;
        this.patientAddress = patientAddress;
        this.patientMstatus = patientMstatus;
        this.patientEmail = patientEmail;
        this.patientPassword = patientPassword;
        this.idCard = idCard;
    }
    public Patient(Image image, String patientName, String patientBirthday, String patientGender, int patientAge, String bloodType, String patientPhone, String patientAddress, String patientMstatus, String patientEmail, String patientPassword, String idCard, Set bills, Set precautionAdvices, Set dietAdvices, Set reservations, Set checkRecords, Set medicationHistories, Set medicalRecords, Set tasks) {
       this.image = image;
       this.patientName = patientName;
       this.patientBirthday = patientBirthday;
       this.patientGender = patientGender;
       this.patientAge = patientAge;
       this.bloodType = bloodType;
       this.patientPhone = patientPhone;
       this.patientAddress = patientAddress;
       this.patientMstatus = patientMstatus;
       this.patientEmail = patientEmail;
       this.patientPassword = patientPassword;
       this.idCard = idCard;
       this.bills = bills;
       this.precautionAdvices = precautionAdvices;
       this.dietAdvices = dietAdvices;
       this.reservations = reservations;
       this.checkRecords = checkRecords;
       this.medicationHistories = medicationHistories;
       this.medicalRecords = medicalRecords;
       this.tasks = tasks;
    }
   
    public Integer getPatientId() {
        return this.patientId;
    }
    
    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }
    public Image getImage() {
        return this.image;
    }
    
    public void setImage(Image image) {
        this.image = image;
    }
    public String getPatientName() {
        return this.patientName;
    }
    
    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }
    public String getPatientBirthday() {
        return this.patientBirthday;
    }
    
    public void setPatientBirthday(String patientBirthday) {
        this.patientBirthday = patientBirthday;
    }
    public String getPatientGender() {
        return this.patientGender;
    }
    
    public void setPatientGender(String patientGender) {
        this.patientGender = patientGender;
    }
    public int getPatientAge() {
        return this.patientAge;
    }
    
    public void setPatientAge(int patientAge) {
        this.patientAge = patientAge;
    }
    public String getBloodType() {
        return this.bloodType;
    }
    
    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }
    public String getPatientPhone() {
        return this.patientPhone;
    }
    
    public void setPatientPhone(String patientPhone) {
        this.patientPhone = patientPhone;
    }
    public String getPatientAddress() {
        return this.patientAddress;
    }
    
    public void setPatientAddress(String patientAddress) {
        this.patientAddress = patientAddress;
    }
    public String getPatientMstatus() {
        return this.patientMstatus;
    }
    
    public void setPatientMstatus(String patientMstatus) {
        this.patientMstatus = patientMstatus;
    }
    public String getPatientEmail() {
        return this.patientEmail;
    }
    
    public void setPatientEmail(String patientEmail) {
        this.patientEmail = patientEmail;
    }
    public String getPatientPassword() {
        return this.patientPassword;
    }
    
    public void setPatientPassword(String patientPassword) {
        this.patientPassword = patientPassword;
    }
    public String getIdCard() {
        return this.idCard;
    }
    
    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }
    public Set getBills() {
        return this.bills;
    }
    
    public void setBills(Set bills) {
        this.bills = bills;
    }
    public Set getPrecautionAdvices() {
        return this.precautionAdvices;
    }
    
    public void setPrecautionAdvices(Set precautionAdvices) {
        this.precautionAdvices = precautionAdvices;
    }
    public Set getDietAdvices() {
        return this.dietAdvices;
    }
    
    public void setDietAdvices(Set dietAdvices) {
        this.dietAdvices = dietAdvices;
    }
    public Set getReservations() {
        return this.reservations;
    }
    
    public void setReservations(Set reservations) {
        this.reservations = reservations;
    }
    public Set getCheckRecords() {
        return this.checkRecords;
    }
    
    public void setCheckRecords(Set checkRecords) {
        this.checkRecords = checkRecords;
    }
    public Set getMedicationHistories() {
        return this.medicationHistories;
    }
    
    public void setMedicationHistories(Set medicationHistories) {
        this.medicationHistories = medicationHistories;
    }
    public Set getMedicalRecords() {
        return this.medicalRecords;
    }
    
    public void setMedicalRecords(Set medicalRecords) {
        this.medicalRecords = medicalRecords;
    }
    public Set getTasks() {
        return this.tasks;
    }
    
    public void setTasks(Set tasks) {
        this.tasks = tasks;
    }




}


