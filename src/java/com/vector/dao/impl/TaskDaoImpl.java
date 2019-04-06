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

    /**
     * 根据任务执行人的Id分页查询任务
     *
     * @param staffId
     * @param currentPage
     * @return
     */
    @Override
    public List<Task> getTaskByTargetId(Serializable staffId, Integer currentPage) {
        String hql = "from Task where taskTarget.staffId = ?";
        return getListPaginationByQuery(hql, currentPage, staffId);
    }

    @Override
    public Integer getTaskItemNumberByTargetId(Serializable staffId) {
        String hql = "select count(*) from Task where taskTarget.staffId= ? ";
        return getListSize(hql, staffId);
    }

    /**
     * 根据病人的Id查询其所携带的任务
     *
     * @param patientId
     * @param currentPage
     * @return
     */
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

    @Override
    public List<Task> getUnFinishedTaskByTargetId(Serializable staffId, Integer currentPage) {
        String hql = "from Task where staffByTaskTarget.staffId = ? and taskStatus='否'";
        return getListPaginationByQuery(hql, currentPage, staffId);
    }

    @Override
    public Integer getUnFinishedTaskItemNumberByTargetId(Serializable staffId) {
        String hql = "select count(*) from Task where staffByTaskTarget.staffId= ? and taskStatus='否'";
        return getListSize(hql, staffId);
    }

}
