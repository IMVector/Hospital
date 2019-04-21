/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Bloodbank;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface BloodBankService extends CUDService<Bloodbank>, PaginationBaseService<Bloodbank> {

    public List<Bloodbank> getListByBloodType(Integer currentPage, String bloodType);
    public Integer getListByBloodTypeItemNumber(String bloodType);
}
