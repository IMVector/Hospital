/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.Department;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface DepartmentDao extends BaseDao<Department>, PaginationBaseDao<Department> {

    public List<Department> getDepartmentList();

    public Department getDepartmentById(Serializable Id);

    public List<Department> getDepartmentByName(Serializable name);

}
