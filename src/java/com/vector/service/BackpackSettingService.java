/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service;

import java.io.Serializable;
import java.util.Map;

/**
 *
 * @author Vector
 */
public interface BackpackSettingService {

    public void backpack();

    public boolean restore(Serializable backpackFileId);
    
    public Map getSetting();
}
