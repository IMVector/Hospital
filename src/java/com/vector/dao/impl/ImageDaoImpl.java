/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.dao.impl;

import com.vector.dao.ImageDao;
import com.vector.pojo.Image;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Vector
 */
@Repository
public class ImageDaoImpl extends BaseDaoImpl<Image> implements ImageDao {

    @Override
    public List<Image> getFirstPageImage() {
        String hql = "from Image where imageId <5";
        return getListByQuery(hql);
    }

    @Override
    public Image getImageByPath(Serializable path) {
        String hql = "from Image where imagePath=?";
        List<Image> imageList = getListByQuery(hql, path);
        if (!imageList.isEmpty()) {
            return imageList.get(0);
        } else {
            return null;
        }
    }

    @Override
    public Integer getListItemNumber(Object... params) {
        String hql = "select count(*) from Image";
        return getListSize(hql);
    }

    @Override
    public List<Image> getList(Integer currentPage, Object... params) {
        String hql = "from Image";
        return getListPaginationByQuery(hql, currentPage);
    }

}
