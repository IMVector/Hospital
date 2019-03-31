/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.ReservationDao;
import com.vector.pojo.Patient;
import com.vector.pojo.Reservation;
import com.vector.pojo.Staff;
import com.vector.service.ReservationService;
import java.io.Serializable;
import java.util.Date;
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
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    ReservationDao reservationDao;

    @Override
    public boolean reservation(Patient patient, Serializable staffId, Serializable schedule, Date reservationDate) {
        Staff staff = new Staff();
        staff.setStaffId(Integer.parseInt(staffId.toString()));
        Reservation reservation = new Reservation(patient, staff, schedule.toString(), reservationDate, "否");
        System.out.println(patient.getPatientName());
        System.out.println(staffId);
        System.out.println(schedule.toString());
        reservation.setReservationId(0);
        try {
            reservationDao.insert(reservation);
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }

    @Override
    public List<Reservation> getUnExpiryReservationByPatientId(Serializable patientId, Serializable currentPage) {
        return reservationDao.getUnExpiryReservationByPatientId(patientId, currentPage);
    }

    @Override
    public Integer getUnExpiryReservationByPatientIdListNum(Serializable patientId) {
        return reservationDao.getUnExpiryReservationByPatientIdListNum(patientId);
    }

    @Override
    public List<Reservation> getUnExpiryReservationByStafftId(Serializable staffId, Serializable currentPage) {
        return reservationDao.getUnExpiryReservationByStafftId(staffId, currentPage);
    }

    @Override
    public Integer getUnExpiryReservationByStafftIdListNum(Serializable staffId) {
        return reservationDao.getUnExpiryReservationByStafftIdListNum(staffId);
    }

    @Override
    public boolean cancleReservation(Serializable reservationId) {
        try {
            reservationDao.delete(reservationId);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
