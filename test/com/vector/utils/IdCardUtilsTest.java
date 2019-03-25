/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.utils;

import java.util.Map;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Vector
 */
public class IdCardUtilsTest {
    
    public IdCardUtilsTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getBirAgeSex method, of class IdCardUtils.
     */
    @Test
    public void testGetBirAgeSex() {
        System.out.println("getBirAgeSex");
        String certificateNo = "370829199410041766";
        Map<String, String> expResult = null;
        Map<String, String> result = IdCardUtils.getBirAgeSex(certificateNo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
