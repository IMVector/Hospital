/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Vector
 */
public interface ChartService {

    public int[] getMedicalVisitsNum(Serializable patientId, Serializable year);

    public double[] getMedicalVisitsFee(Serializable patientId, Serializable year);

    public Set getMedicalYear(Serializable patientId);

    public Map getIllnessInfo(Serializable patientId, Serializable year);

}
