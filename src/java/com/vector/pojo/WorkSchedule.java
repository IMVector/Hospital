package com.vector.pojo;
// Generated 2019-3-22 22:17:21 by Hibernate Tools 4.3.1



/**
 * WorkSchedule generated by hbm2java
 */
public class WorkSchedule  implements java.io.Serializable {


     private Integer workScheduleId;
     private Staff staff;
     private String workSchedule;

    public WorkSchedule() {
    }

    public WorkSchedule(Staff staff, String workSchedule) {
       this.staff = staff;
       this.workSchedule = workSchedule;
    }
   
    public Integer getWorkScheduleId() {
        return this.workScheduleId;
    }
    
    public void setWorkScheduleId(Integer workScheduleId) {
        this.workScheduleId = workScheduleId;
    }
    public Staff getStaff() {
        return this.staff;
    }
    
    public void setStaff(Staff staff) {
        this.staff = staff;
    }
    public String getWorkSchedule() {
        return this.workSchedule;
    }
    
    public void setWorkSchedule(String workSchedule) {
        this.workSchedule = workSchedule;
    }




}


