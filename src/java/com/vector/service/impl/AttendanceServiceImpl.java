/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.StaffDao;
import com.vector.dao.WorkScheduleDao;
import com.vector.pojo.ScheduleTable;
import com.vector.pojo.Staff;
import com.vector.pojo.WorkSchedule;
import com.vector.service.AttendanceService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */
@Service
@Transactional
public class AttendanceServiceImpl implements AttendanceService {

    @Autowired
    WorkScheduleDao workScheduleDao;

    @Autowired
    StaffDao staffDao;

    @Override
    public List<ScheduleTable> getScheduleTableByDepartmentId(Serializable departmentId) {
        List<Staff> staffList = staffDao.getStaffByDepartmentId(departmentId);//获取该部门的所有员工
        
        List<ScheduleTable> departmentScheduleTable=new ArrayList(); 
        for (Staff staff : staffList) {//获取每个员工的出勤表
            List<WorkSchedule> list = workScheduleDao.getScheduleByStaffId(staff.getStaffId());
            Collections.sort(list);
            List<String> tableList = new ArrayList();
            for (int i = 0; i < 14; i++) {
                tableList.add("false");
            }
            for (WorkSchedule wsc : list) {
                System.out.println(wsc.getWorkSchedule());
                String array[] = wsc.getWorkSchedule().split("_");
                int index = (Integer.parseInt(array[0]) - 1) * 2 + (Integer.parseInt(array[1]) - 1);//恢复原坐标
                tableList.set(index, "true");
            }
            ScheduleTable staffScheduleTable = new ScheduleTable(staff,tableList);
            
            departmentScheduleTable.add(staffScheduleTable);//将员工的出勤表加入部门的出勤表中
        }
        return departmentScheduleTable;
    }

    @Override
    public List<ScheduleTable> getScheduleTable() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
