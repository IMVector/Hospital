/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.ScheduleTable;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface AttendanceService {

    public List<ScheduleTable> getScheduleTableByDepartmentId(Serializable departmentId);
    
    public List<ScheduleTable> getScheduleTable();

}
