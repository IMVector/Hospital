/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

import com.vector.dao.RoleDao;
import com.vector.pojo.Role;
import com.vector.service.RoleService;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Vector
 */

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleDao roleDao;

    @Override
    public List<Role> getRoleList() {
        return roleDao.getRoleList();
    }

    @Override
    public boolean insert(Role t, Object... params) {
        try {
            roleDao.insert(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }

    @Override
    public boolean update(Role t, Object... params) {
        try {
            roleDao.update(t);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            roleDao.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        return roleDao.getListItemNumber();
    }

    @Override
    public List<Role> getList(Integer currentPage, Object... params) {
        return roleDao.getList(currentPage);
    }

    @Override
    public List<Role> getRoleByName(Serializable name) {
        return roleDao.getRoleByName(name);
    }

}
