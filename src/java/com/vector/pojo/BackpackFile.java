package com.vector.pojo;
// Generated 2019-3-22 22:17:21 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * BackpackFile generated by hbm2java
 */
public class BackpackFile  implements java.io.Serializable {


     private Integer backpackFileId;
     private String backpackFilePath;
     private Date backpackTime;

    public BackpackFile() {
    }

    public BackpackFile(String backpackFilePath, Date backpackTime) {
       this.backpackFilePath = backpackFilePath;
       this.backpackTime = backpackTime;
    }
   
    public Integer getBackpackFileId() {
        return this.backpackFileId;
    }
    
    public void setBackpackFileId(Integer backpackFileId) {
        this.backpackFileId = backpackFileId;
    }
    public String getBackpackFilePath() {
        return this.backpackFilePath;
    }
    
    public void setBackpackFilePath(String backpackFilePath) {
        this.backpackFilePath = backpackFilePath;
    }
    public Date getBackpackTime() {
        return this.backpackTime;
    }
    
    public void setBackpackTime(Date backpackTime) {
        this.backpackTime = backpackTime;
    }




}


