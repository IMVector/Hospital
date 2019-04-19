/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.PrecautionAdvice;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface PrecautionAdviceService extends CUDService<PrecautionAdvice>, PaginationBaseService<PrecautionAdvice> {

    public Integer getListItemNumberOfStaff(Object... params);

    public List<PrecautionAdvice> getListOfStaff(Integer currentPage, Object... params);

    public PrecautionAdvice getPrecautionAdviceById(Serializable precautionAdviceId);
}
