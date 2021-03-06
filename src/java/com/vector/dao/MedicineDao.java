/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.Medicine;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface MedicineDao extends BaseDao<Medicine>, PaginationBaseDao<Medicine> {

    public List<Medicine> getMedicineByName(Serializable name);

    public Integer getMedicineByNameItemNumber(String name);

    public List<Medicine> getMedicineList();

    public List<Medicine> getMedicineByDescription(String description, Integer currentPage);

    public Integer getMedicineByDescriptionItemNum(String description);

}
