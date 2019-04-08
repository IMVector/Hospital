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
import java.util.Date;
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

    /**
     * 根据任务执行人的Id分页查询任务
     *
     * @param staffId
     * @param currentPage
     * @return
     */
    @Override
    public List<Task> getTaskByTargetId(Serializable staffId, Integer currentPage) {
        return taskDao.getTaskByTargetId(staffId, currentPage);
    }

    @Override
    public Integer getTaskItemNumberByTargetId(Serializable staffId) {
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
        String taskContent = (String) params[2];
        HttpSession session = (HttpSession) params[3];
        Staff taskSponsor = (Staff) session.getAttribute("staff");
        Staff taskTarget = getTaskTarget(checkItemId);
//        Staff taskSponsor = new Staff();
//        taskSponsor.setStaffId(6);
//        Staff taskTarget = getTaskTarget(checkItemId);
        System.out.println(taskSponsor.getStaffId());
        System.out.println(t.getTaskContent());

        Patient patient = getPatientByIdCard(Idcard);
        t.setTaskProgress(0);
        t.setPatient(patient);
        t.setStaffByTaskSponsor(taskSponsor);
        t.setStaffByTaskTarget(taskTarget);
        t.setTaskStatus("否");
        t.setDate(new Date());

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
        t.setDate(new Date());
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

    @Override
    public List<Task> getTaskUnFinishedByTargetId(Serializable staffId, Integer currentPage) {
        return taskDao.getUnFinishedTaskByTargetId(staffId, currentPage);
    }

    @Override
    public Integer getTaskUnFinishedItemNumberByTargetId(Serializable staffId) {
        return taskDao.getUnFinishedTaskItemNumberByTargetId(staffId);
    }

    @Override
    public Task getTaskById(Serializable taskId) {
        return taskDao.getOneById(taskId);
    }

    @Override
    public boolean changeTaskStatus(Serializable taskId) {
        Task task = getTaskById(taskId);
        task.setTaskProgress(1);
        task.setTaskStatus("是");
        return update(task); 
    }

    @Override
    public Task getLastTaskByPatientIdCard(Serializable IdCard) {
        return taskDao.getLastTaskByPatientId(patientDao.getPatientByIdCard(IdCard.toString()).getPatientId());
    }

}
