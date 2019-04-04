/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.WorkScheduleDao;
import com.vector.pojo.WorkSchedule;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class WorkScheduleDaoImpl extends BaseDaoImpl<WorkSchedule> implements WorkScheduleDao {

    @Override
    public List<WorkSchedule> getScheduleByStaffId(Serializable staffId) {
        String hql = "from WorkSchedule where staff.staffId=?";
        return getListByQuery(hql, staffId);
    }

    @Override
    public void deleteScheduleByStaffId(Serializable staffId) {
        String hql = "delete from WorkSchedule where staff.staffId=?";
        batchDML(hql, staffId);
    }

    @Override
    public List<WorkSchedule> getScheduleByDepartmentId(Serializable departmentId) {
        String hql = "from WorkSchedule where staff.department.departmentId=?";
        return getListByQuery(hql, departmentId);
    }

}
