/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.ScheduleTable;
import com.vector.pojo.WorkSchedule;
import java.io.Serializable;

/**
 *
 * @author Vector
 */
public interface WorkScheduleService {

    public ScheduleTable getScheduleByStaffId(Serializable staffId);

    public boolean addSchedule(ScheduleTable table);
    
    public boolean UpdateSchedule(ScheduleTable table);

    public boolean deleteSchedule(Serializable staffId);
}
