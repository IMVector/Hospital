/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.CheckItem;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface CheckItemDao extends BaseDao<CheckItem>,PaginationBaseDao<CheckItem>{

    public List<CheckItem> getCheckItemList();

    public List<CheckItem> getCheckItemByName(Serializable name);
    
    public Integer getCheckItemByNameItemNumber(String name);
}
