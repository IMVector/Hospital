/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Bill;
import java.io.Serializable;
import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vector
 */
public interface BillService extends CUDService<Bill>, PaginationBaseService<Bill> {

    public Map getBillItemInfo(Serializable billId);

    public Bill getLastUnPaidBill(Serializable PatientId);

    public boolean getToPayItem(Serializable patientId, HttpSession session);
}
