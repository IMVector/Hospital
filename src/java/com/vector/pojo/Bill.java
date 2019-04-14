package com.vector.pojo;
// Generated 2019-4-14 19:48:45 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Bill generated by hbm2java
 */
public class Bill  implements java.io.Serializable {


     private Integer billId;
     private Patient patient;
     private String paymentStatus;
     private Date billDate;
     private float totalAmount;
     private String chargeItem;

    public Bill() {
    }

	
    public Bill(Patient patient, String paymentStatus, Date billDate, float totalAmount) {
        this.patient = patient;
        this.paymentStatus = paymentStatus;
        this.billDate = billDate;
        this.totalAmount = totalAmount;
    }
    public Bill(Patient patient, String paymentStatus, Date billDate, float totalAmount, String chargeItem) {
       this.patient = patient;
       this.paymentStatus = paymentStatus;
       this.billDate = billDate;
       this.totalAmount = totalAmount;
       this.chargeItem = chargeItem;
    }
   
    public Integer getBillId() {
        return this.billId;
    }
    
    public void setBillId(Integer billId) {
        this.billId = billId;
    }
    public Patient getPatient() {
        return this.patient;
    }
    
    public void setPatient(Patient patient) {
        this.patient = patient;
    }
    public String getPaymentStatus() {
        return this.paymentStatus;
    }
    
    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    public Date getBillDate() {
        return this.billDate;
    }
    
    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }
    public float getTotalAmount() {
        return this.totalAmount;
    }
    
    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }
    public String getChargeItem() {
        return this.chargeItem;
    }
    
    public void setChargeItem(String chargeItem) {
        this.chargeItem = chargeItem;
    }




}


