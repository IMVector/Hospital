/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.WorkSchedule;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface WorkScheduleDao extends BaseDao<WorkSchedule> {

    public List<WorkSchedule> getScheduleByStaffId(Serializable staffId);

    public List<WorkSchedule> getScheduleByDepartmentId(Serializable departmentId);

    public void deleteScheduleByStaffId(Serializable staffId);

}
