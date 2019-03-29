/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.WorkScheduleDao;
import com.vector.pojo.ScheduleTable;
import com.vector.pojo.Staff;
import com.vector.pojo.WorkSchedule;
import com.vector.service.WorkScheduleService;
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
public class WorkScheduleServiceImpl implements WorkScheduleService {

    @Autowired
    WorkScheduleDao workScheduleDao;

    @Override
    public ScheduleTable getScheduleByStaffId(Serializable staffId) {
        List<WorkSchedule> list = workScheduleDao.getScheduleByStaffId(staffId);
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
        ScheduleTable scheduleTable = new ScheduleTable();
        scheduleTable.setScheduleList(tableList);
        return scheduleTable;
    }

    @Override
    public boolean deleteSchedule(Serializable staffId) {
        try {
            workScheduleDao.deleteScheduleByStaffId(staffId);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    //   0/2+1=1  0%2+1=1;
    //   1/2+1=2  1%2+1=2;
    @Override
    public boolean addSchedule(ScheduleTable table) {
        WorkSchedule schedule = null;

        boolean flag = true;
        List list = table.getScheduleList();
        System.out.println(list.size());
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
            if (null != list.get(i) && list.get(i).equals("on")) {
                schedule = new WorkSchedule();
                schedule.setStaff(table.getStaff());
                String str = (i / 2 + 1) + "_" + (i % 2 + 1);
                schedule.setWorkSchedule(str);
                try {
                    workScheduleDao.insert(schedule);
                } catch (Exception e) {
                    System.out.println(e);
                    flag = false;
                }
            }

        }

        return flag;
    }

    @Override
    public boolean UpdateSchedule(ScheduleTable table) {
        deleteSchedule(table.getStaff().getStaffId());
        return addSchedule(table);
    }

}
