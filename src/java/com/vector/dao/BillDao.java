/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.Bill;
import java.io.Serializable;

/**
 *
 * @author Vector
 */
public interface BillDao extends BaseDao<Bill> ,PaginationBaseDao<Bill>{

    public Bill getLastUnPaidBill(Serializable PatientId);
    
}
