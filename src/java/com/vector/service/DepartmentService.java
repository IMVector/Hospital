/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Department;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface DepartmentService extends CUDService<Department>, PaginationBaseService<Department> {
    
    public List<Department> getDepartmentList();

    public Department getDaprtmentById(Serializable id);

    public List<Department> getDaprtmentByName(Serializable name);

}
