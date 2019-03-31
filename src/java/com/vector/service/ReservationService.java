/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Patient;
import com.vector.pojo.Reservation;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface ReservationService {

    public boolean reservation(Patient patient, Serializable staffId, Serializable schedule, Date reservationDate);

    public boolean cancleReservation(Serializable reservationId);

    public List<Reservation> getUnExpiryReservationByPatientId(Serializable patientId, Serializable currentPage);

    public Integer getUnExpiryReservationByPatientIdListNum(Serializable patientId);

    public List<Reservation> getUnExpiryReservationByStafftId(Serializable staffId, Serializable currentPage);

    public Integer getUnExpiryReservationByStafftIdListNum(Serializable staffId);
}
