/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import java.io.Serializable;

/**
 *
 * @author Vector
 */
public interface CUDService<T> {

    public boolean insert(T t, Object... params);

    public boolean update(T t, Object... params);

    public boolean delete(Serializable id);

}
