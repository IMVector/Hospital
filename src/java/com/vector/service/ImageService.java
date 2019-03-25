/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.Image;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vector
 */
public interface ImageService {

    List<Image> getFirstPageImage();

    public Image getImageByPath(Serializable path);

    public void insertImage(Image image);

}
