/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao;

import com.vector.pojo.Role;
import com.vector.pojo.Title;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface TitleDao extends BaseDao<Title>, PaginationBaseDao<Title> {

    public List<Title> getTitleList();

    public List<Title> getTitleByName(Serializable name);

    public Integer getTitleByNameItemNum(String name);
}
