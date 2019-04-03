/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Task;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface TaskService extends CUDService<Task> {

    public List<Task> getTaskByStaffId(Serializable staffId, Integer currentPage);

    public Integer getTaskItemNumberByStaffId(Serializable staffId);

    public List<Task> getTaskByPatientId(Serializable patientId, Integer currentPage);

    public Integer getTaskItemNumberByPatientId(Serializable patientId);
}
