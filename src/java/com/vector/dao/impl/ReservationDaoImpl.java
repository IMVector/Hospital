/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.ReservationDao;
import com.vector.pojo.Reservation;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class ReservationDaoImpl extends BaseDaoImpl<Reservation> implements ReservationDao {

    @Override
    public List<Reservation> getUnExpiryReservationByPatientId(Serializable patientId, Serializable currentPage) {
        String hql = "from Reservation where patient.patientId=? and isFinished='否'";
        return getListPaginationByQuery(hql, currentPage, patientId);
    }

    @Override
    public Integer getUnExpiryReservationByPatientIdListNum(Serializable patientId) {
        String hql = "select count(*) from Reservation where patient.patientId=? and isFinished='否'";
        return getListSize(hql, patientId);
    }

    @Override
    public List<Reservation> getUnExpiryReservationByStafftId(Serializable staffId, Serializable currentPage) {
        String hql = "from Reservation where staff.staffId=? and isFinished='否'";
        return getListPaginationByQuery(hql, currentPage, staffId);
    }

    @Override
    public Integer getUnExpiryReservationByStafftIdListNum(Serializable staffId) {
        String hql = "select count(*) from Reservation where staff.staffId=? and isFinished='否'";
        return getListSize(hql, staffId);
    }

}
