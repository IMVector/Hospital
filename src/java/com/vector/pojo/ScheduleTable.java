/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.pojo;

import java.util.List;

/**
 *
 * @author Vector
 */
public class ScheduleTable {
    private Staff staff;
    private List <String> scheduleList;

    public ScheduleTable(Staff staff, List<String> scheduleList) {
        this.staff = staff;
        this.scheduleList = scheduleList;
    }

    public ScheduleTable() {
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public List<String> getScheduleList() {
        return scheduleList;
    }

    public void setScheduleList(List<String> scheduleList) {
        this.scheduleList = scheduleList;
    }


    
    

    
}
