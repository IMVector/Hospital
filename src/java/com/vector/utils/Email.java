package com.vector.utils;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sun.mail.util.MailSSLSocketFactory;

public class Email {

    public static boolean sendEmail(String to, String content) {
        boolean flag = false;
        String from = "2523511898@qq.com";
        String password = "qzbettdgvrkjecgb";

        //"qzbettdgvrkjecgb"
        // 指定发送邮件的主机为 smtp.qq.com
        String host = "smtp.qq.com";  //QQ 邮件服务器
        // 获取系统属性
        Properties properties = System.getProperties();
        // 设置邮件服务器
        properties.setProperty("mail.smtp.host", host);
        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory mailSSLSocketFactory = null;
        try {
            mailSSLSocketFactory = new MailSSLSocketFactory();
        } catch (Exception e) {
            System.out.println("获取MailSSLSocketFactory出错");
            System.out.println(e.getMessage());
        }
        mailSSLSocketFactory.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", mailSSLSocketFactory);
        // 获取默认session对象
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                //密码为qq邮箱授权码
                return new PasswordAuthentication(from, password); //发件人邮件用户名、密码
            }
        });
        try {
            // 创建默认的 MimeMessage 对象
            MimeMessage message = new MimeMessage(session);
            // Set From: 头部头字段
            message.setFrom(new InternetAddress(from));
            // Set To: 头部头字段
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // Set Subject: 头部头字段
            message.setSubject("验证码：");
            // 设置消息体
            message.setText(content);
            // 发送消息
            Transport.send(message);
            System.out.println("验证码已发送到用户邮箱");
            flag = true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
            flag=false;
        }
        return flag;
    }

    public static boolean sendEmail(String from, String to, String content, String password) {
        boolean flag = false;
        //        "wfupxkrwsgceeaje"
        // 指定发送邮件的主机为 smtp.qq.com
        String host = "smtp.qq.com";  //QQ 邮件服务器
        // 获取系统属性
        Properties properties = System.getProperties();
        // 设置邮件服务器
        properties.setProperty("mail.smtp.host", host);
        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory mailSSLSocketFactory = null;
        try {
            mailSSLSocketFactory = new MailSSLSocketFactory();
        } catch (Exception e) {
            System.out.println("获取MailSSLSocketFactory出错");
            System.out.println(e.getMessage());
        }
        mailSSLSocketFactory.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", mailSSLSocketFactory);
        // 获取默认session对象
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                //密码为qq邮箱授权码
                return new PasswordAuthentication(from, password); //发件人邮件用户名、密码
            }
        });
        try {
            // 创建默认的 MimeMessage 对象
            MimeMessage message = new MimeMessage(session);
            // Set From: 头部头字段
            message.setFrom(new InternetAddress(from));
            // Set To: 头部头字段
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // Set Subject: 头部头字段
            message.setSubject("验证码：");
            // 设置消息体
            message.setText(content);
            // 发送消息
            Transport.send(message);
            System.out.println("验证码已发送到用户邮箱");
            flag = true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        return flag;
    }
}
