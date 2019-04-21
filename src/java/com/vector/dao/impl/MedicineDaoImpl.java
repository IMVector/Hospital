/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.MedicineDao;
import com.vector.pojo.Medicine;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class MedicineDaoImpl extends BaseDaoImpl<Medicine> implements MedicineDao {

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from Medicine";
        return getListSize(hql);
    }

    @Override
    public List<Medicine> getList(Integer currentPage, Object... params) {
        String hql = "from Medicine";
        return getListPaginationByQuery(hql, currentPage);
    }

    @Override
    public List<Medicine> getMedicineByName(Serializable name) {
        String hql = "from Medicine where medicineName like ?";
        name = "%" + name + "%";
        return getListByQuery(hql, name);
    }

    @Override
    public Integer getMedicineByNameItemNumber(String name) {
        String hql = "select count(*) from Medicine where medicineName like ?";
        name = "%" + name + "%";
        return getListSize(hql, name);
    }

    @Override
    public List<Medicine> getMedicineList() {
        String hql = "from Medicine";
        return getListByQuery(hql);
    }

    @Override
    public List<Medicine> getMedicineByDescription(String description, Integer currentPage) {
        String hql = "from Medicine where medicineDescription like ?";
        description = "%" + description + "%";
        return getListPaginationByQuery(hql, currentPage, description);
    }

    @Override
    public Integer getMedicineByDescriptionItemNum(String description) {
        String hql = "select count(*) from Medicine where medicineDescription like ?";
        description = "%" + description + "%";
        return getListSize(hql, description);
    }

}
