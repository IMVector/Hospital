package com.vector.pojo;
// Generated 2019-3-22 22:17:21 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Leave generated by hbm2java
 */
public class Leave  implements java.io.Serializable {


     private Integer leaveId;
     private Staff staff;
     private Date leaveStartTime;
     private Date leaveEndTime;
     private String applicationStatus;
     private String reason;

    public Leave() {
    }

    public Leave(Staff staff, Date leaveStartTime, Date leaveEndTime, String applicationStatus, String reason) {
       this.staff = staff;
       this.leaveStartTime = leaveStartTime;
       this.leaveEndTime = leaveEndTime;
       this.applicationStatus = applicationStatus;
       this.reason = reason;
    }
   
    public Integer getLeaveId() {
        return this.leaveId;
    }
    
    public void setLeaveId(Integer leaveId) {
        this.leaveId = leaveId;
    }
    public Staff getStaff() {
        return this.staff;
    }
    
    public void setStaff(Staff staff) {
        this.staff = staff;
    }
    public Date getLeaveStartTime() {
        return this.leaveStartTime;
    }
    
    public void setLeaveStartTime(Date leaveStartTime) {
        this.leaveStartTime = leaveStartTime;
    }
    public Date getLeaveEndTime() {
        return this.leaveEndTime;
    }
    
    public void setLeaveEndTime(Date leaveEndTime) {
        this.leaveEndTime = leaveEndTime;
    }
    public String getApplicationStatus() {
        return this.applicationStatus;
    }
    
    public void setApplicationStatus(String applicationStatus) {
        this.applicationStatus = applicationStatus;
    }
    public String getReason() {
        return this.reason;
    }
    
    public void setReason(String reason) {
        this.reason = reason;
    }




}

