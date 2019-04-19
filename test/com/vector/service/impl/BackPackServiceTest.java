/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.service.impl;

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
public class BackPackServiceTest {
    
    public BackPackServiceTest() {
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
     * Test of backpack method, of class BackPackService.
     */
//    @Test
//    public void testBackpack() {
//        System.out.println("backpack");
//        BackpackServiceImpl instance = new BackpackServiceImpl();
//        instance.backpack();
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of restore method, of class BackpackServiceImpl.
//     */
//    @Test
//    public void testRestore() {
//        System.out.println("restore");
//        BackpackServiceImpl instance = new BackpackServiceImpl();
//        boolean expResult = false;
//        boolean result = instance.restore();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of test_1 method, of class BackpackServiceImpl.
     */
    @Test
    public void testTest_1() {
        System.out.println("test_1");
        BackpackServiceImpl instance = new BackpackServiceImpl();
        boolean expResult = true;
        boolean result = instance.test_1();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
    }
    
}
