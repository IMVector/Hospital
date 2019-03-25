package com.vector.pojo;
// Generated 2019-3-22 22:17:21 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Reservation generated by hbm2java
 */
public class Reservation  implements java.io.Serializable {


     private Integer reservationId;
     private Patient patient;
     private Staff staff;
     private Date reservationTime;

    public Reservation() {
    }

    public Reservation(Patient patient, Staff staff, Date reservationTime) {
       this.patient = patient;
       this.staff = staff;
       this.reservationTime = reservationTime;
    }
   
    public Integer getReservationId() {
        return this.reservationId;
    }
    
    public void setReservationId(Integer reservationId) {
        this.reservationId = reservationId;
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
    public Date getReservationTime() {
        return this.reservationTime;
    }
    
    public void setReservationTime(Date reservationTime) {
        this.reservationTime = reservationTime;
    }




}


