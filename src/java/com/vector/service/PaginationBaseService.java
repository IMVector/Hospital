/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import java.util.List;

/**
 *
 * @author Vector
 */
public interface PaginationBaseService<T> {

    public Integer getListItemNumber(Object... params);

    public List<T> getList(Integer currentPage, Object... params);

}
