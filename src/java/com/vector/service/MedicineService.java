/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Medicine;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface MedicineService extends CUDService<Medicine>, PaginationBaseService<Medicine> {

    public List<Medicine> getMedicineByName(Serializable name);

    public List<Medicine> getMedicineList();

}
