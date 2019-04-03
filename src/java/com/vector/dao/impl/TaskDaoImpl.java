/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.TaskDao;
import com.vector.pojo.Task;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class TaskDaoImpl extends BaseDaoImpl<Task> implements TaskDao {

    @Override
    public List<Task> getTaskByStaffId(Serializable staffId, Integer currentPage) {
        String hql = "from Task where taskTarget.staffId = ?";
        return getListPaginationByQuery(hql, currentPage, staffId);
    }

    @Override
    public Integer getTaskItemNumberByStaffId(Serializable staffId) {
        String hql = "select count(*) from Task where taskTarget.staffId= ? ";
        return getListSize(hql, staffId);
    }

    @Override
    public List<Task> getTaskByPatientId(Serializable patientId, Integer currentPage) {
        String hql = "from Task where patient.patientId=?";
        return getListPaginationByQuery(hql, currentPage, patientId);
    }

    @Override
    public Integer getTaskItemNumberByPatientId(Serializable patientId) {
        String hql = "select count(*) from Task where patient.patientId= ? ";
        return getListSize(hql, patientId);
    }

}
