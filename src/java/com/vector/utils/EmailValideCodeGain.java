/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vector.utils;

import java.util.Random;

/**
 *
 * @author Vector
 */
public class EmailValideCodeGain {

    public static String getEmailRandCode() {
        String emailValideCode = "";
        for (int i = 0; i < 4; i++) {
            emailValideCode = emailValideCode + getRandomString();
        }
        return emailValideCode;
//        HttpSession session = request.getSession();
//        session.removeAttribute("emailRandomCode");
//        session.setAttribute("emailRandomCode", emailValideCode);
    }

    /*
     * 获取随机的字符
     */
    public static String getRandomString() {
        String randString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";//随机产生的字符串
        Random random = new Random();
        int num = random.nextInt(randString.length());
        return String.valueOf(randString.charAt(num));
    }
}
