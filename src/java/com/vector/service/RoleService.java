/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Role;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface RoleService extends CUDService<Role>, PaginationBaseService<Role> {

    public List<Role> getRoleList();

    public List<Role> getRoleByName(Serializable name);
}
