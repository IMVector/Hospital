/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import com.vector.pojo.BackpackFile;
import java.io.Serializable;

/**
 *
 * @author Vector
 */
public interface BackpackFileService extends CUDService<BackpackFile>, PaginationBaseService<BackpackFile>{
    
    BackpackFile getBackpackFileById(Serializable id);
    
}
