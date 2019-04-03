/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.PatientDao;
import com.vector.dao.StaffDao;
import com.vector.dao.TaskDao;
import com.vector.pojo.Patient;
import com.vector.pojo.Staff;
import com.vector.pojo.Task;
import com.vector.service.TaskService;
import java.io.Serializable;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class TaskServiceImpl implements TaskService {

    @Autowired
    TaskDao taskDao;

    @Autowired
    StaffDao staffDao;
    @Autowired
    PatientDao patientDao;

    @Override
    public List<Task> getTaskByStaffId(Serializable staffId, Integer currentPage) {
        return taskDao.getTaskByStaffId(staffId, currentPage);
    }

    @Override
    public Integer getTaskItemNumberByStaffId(Serializable staffId) {
        return taskDao.getTaskItemNumberByPatientId(staffId);
    }

    @Override
    public List<Task> getTaskByPatientId(Serializable patientId, Integer currentPage) {
        return taskDao.getTaskByPatientId(patientId, currentPage);
    }

    @Override
    public Integer getTaskItemNumberByPatientId(Serializable patientId) {
        return taskDao.getTaskItemNumberByPatientId(patientId);
    }

    public Staff getTaskTarget(Serializable checkItemId) {
        return staffDao.getStaffByRoleWork(checkItemId);
    }

    public Patient getPatientByIdCard(String IdCard) {
        return patientDao.getPatientByIdCard(IdCard);
    }

    /**
     *
     * @param t
     * @param params params[0] taskTarget,params[1] IdCard params[2]
     * taskSponsor(HttpSession),
     * @return
     */
    @Override
    public boolean insert(Task t, Object... params) {
        Serializable checkItemId = (Serializable) params[0];
        String Idcard = params[1].toString();
        HttpSession session = (HttpSession) params[2];
        Staff taskSponsor = (Staff) session.getAttribute("staff");
        Staff taskTarget = getTaskTarget(checkItemId);
        Patient patient = getPatientByIdCard(Idcard);

        t.setTaskProgress(0);
        t.setPatient(patient);
        t.setStaffByTaskSponsor(taskSponsor);
        t.setStaffByTaskTarget(taskTarget);
        t.setTaskStatus("否");

        try {
            taskDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean update(Task t, Object... params) {
        try {
            taskDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            taskDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

}
