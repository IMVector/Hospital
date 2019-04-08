/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.Task;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface TaskDao extends BaseDao<Task> {

    public List<Task> getTaskByTargetId(Serializable staffId, Integer currentPage);

    public Integer getTaskItemNumberByTargetId(Serializable staffId);

    public List<Task> getUnFinishedTaskByTargetId(Serializable staffId, Integer currentPage);

    public Integer getUnFinishedTaskItemNumberByTargetId(Serializable staffId);

    public List<Task> getTaskByPatientId(Serializable patientId, Integer currentPage);

    public Integer getTaskItemNumberByPatientId(Serializable patientId);

    public Task getLastTaskByPatientId(Serializable patientId);

}
