package com.vector.pojo;
// Generated 2019-3-22 22:17:21 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Medicine generated by hbm2java
 */
public class Medicine  implements java.io.Serializable {


     private Integer medicationId;
     private String medicationName;
     private String medicationInstructions;
     private String medicationDescription;
     private Set medicationHistories = new HashSet(0);

    public Medicine() {
    }

	
    public Medicine(String medicationName, String medicationInstructions, String medicationDescription) {
        this.medicationName = medicationName;
        this.medicationInstructions = medicationInstructions;
        this.medicationDescription = medicationDescription;
    }
    public Medicine(String medicationName, String medicationInstructions, String medicationDescription, Set medicationHistories) {
       this.medicationName = medicationName;
       this.medicationInstructions = medicationInstructions;
       this.medicationDescription = medicationDescription;
       this.medicationHistories = medicationHistories;
    }
   
    public Integer getMedicationId() {
        return this.medicationId;
    }
    
    public void setMedicationId(Integer medicationId) {
        this.medicationId = medicationId;
    }
    public String getMedicationName() {
        return this.medicationName;
    }
    
    public void setMedicationName(String medicationName) {
        this.medicationName = medicationName;
    }
    public String getMedicationInstructions() {
        return this.medicationInstructions;
    }
    
    public void setMedicationInstructions(String medicationInstructions) {
        this.medicationInstructions = medicationInstructions;
    }
    public String getMedicationDescription() {
        return this.medicationDescription;
    }
    
    public void setMedicationDescription(String medicationDescription) {
        this.medicationDescription = medicationDescription;
    }
    public Set getMedicationHistories() {
        return this.medicationHistories;
    }
    
    public void setMedicationHistories(Set medicationHistories) {
        this.medicationHistories = medicationHistories;
    }




}

