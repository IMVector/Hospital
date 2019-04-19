/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Bill;
import com.vector.pojo.CheckRecord;
import com.vector.pojo.MedicalRecord;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface BillService extends CUDService<Bill>, PaginationBaseService<Bill> {

    public boolean getToPayItem(Serializable PatientId);
}
