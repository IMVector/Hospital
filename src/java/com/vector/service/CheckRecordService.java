/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.CheckRecord;
import java.io.Serializable;

/**
 *
 * @author Vector
 */
public interface CheckRecordService extends CUDService<CheckRecord>, PaginationBaseService<CheckRecord> {

    public CheckRecord getCheckRecordById(Serializable checkRecordId);

}
