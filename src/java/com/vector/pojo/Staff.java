package com.vector.pojo;
// Generated 2019-3-22 22:17:21 by Hibernate Tools 4.3.1

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.HashSet;
import java.util.Set;

/**
 * Staff generated by hbm2java
 */
public class Staff implements java.io.Serializable {

    private Integer staffId;
    private Department department;
    private Image image;
    private Role role;
    private Title title;
    private String staffName;
    private String staffPassword;
    private String email;
    private String specialty;
    private String introduction;
    private String gender;
    @JsonIgnore
    private Set precautionAdvices = new HashSet(0);
    @JsonIgnore
    private Set medicalRecords = new HashSet(0);
    @JsonIgnore
    private Set dietAdvices = new HashSet(0);
    @JsonIgnore
    private Set checkRecords = new HashSet(0);
    @JsonIgnore
    private Set tasksForTaskSponsor = new HashSet(0);
    @JsonIgnore
    private Set tasksForTaskTarget = new HashSet(0);
    @JsonIgnore
    private Set leaves = new HashSet(0);
    @JsonIgnore
    private Set reservations = new HashSet(0);
    @JsonIgnore
    private Set workSchedules = new HashSet(0);

    public Staff() {
    }

    public Staff(Department department, Role role, Title title, String staffName, String staffPassword, String email, String specialty, String introduction, String gender) {
        this.department = department;
        this.role = role;
        this.title = title;
        this.staffName = staffName;
        this.staffPassword = staffPassword;
        this.email = email;
        this.specialty = specialty;
        this.introduction = introduction;
        this.gender = gender;
    }

    public Staff(Department department, Image image, Role role, Title title, String staffName, String staffPassword, String email, String specialty, String introduction, String gender, Set precautionAdvices, Set medicalRecords, Set dietAdvices, Set checkRecords, Set tasksForTaskSponsor, Set tasksForTaskTarget, Set leaves, Set reservations, Set workSchedules) {
        this.department = department;
        this.image = image;
        this.role = role;
        this.title = title;
        this.staffName = staffName;
        this.staffPassword = staffPassword;
        this.email = email;
        this.specialty = specialty;
        this.introduction = introduction;
        this.gender = gender;
        this.precautionAdvices = precautionAdvices;
        this.medicalRecords = medicalRecords;
        this.dietAdvices = dietAdvices;
        this.checkRecords = checkRecords;
        this.tasksForTaskSponsor = tasksForTaskSponsor;
        this.tasksForTaskTarget = tasksForTaskTarget;
        this.leaves = leaves;
        this.reservations = reservations;
        this.workSchedules = workSchedules;
    }

    public Integer getStaffId() {
        return this.staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    public Department getDepartment() {
        return this.department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Image getImage() {
        return this.image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Role getRole() {
        return this.role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Title getTitle() {
        return this.title;
    }

    public void setTitle(Title title) {
        this.title = title;
    }

    public String getStaffName() {
        return this.staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffPassword() {
        return this.staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSpecialty() {
        return this.specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getIntroduction() {
        return this.introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Set getPrecautionAdvices() {
        return this.precautionAdvices;
    }

    public void setPrecautionAdvices(Set precautionAdvices) {
        this.precautionAdvices = precautionAdvices;
    }

    public Set getMedicalRecords() {
        return this.medicalRecords;
    }

    public void setMedicalRecords(Set medicalRecords) {
        this.medicalRecords = medicalRecords;
    }

    public Set getDietAdvices() {
        return this.dietAdvices;
    }

    public void setDietAdvices(Set dietAdvices) {
        this.dietAdvices = dietAdvices;
    }

    public Set getCheckRecords() {
        return this.checkRecords;
    }

    public void setCheckRecords(Set checkRecords) {
        this.checkRecords = checkRecords;
    }

    public Set getTasksForTaskSponsor() {
        return this.tasksForTaskSponsor;
    }

    public void setTasksForTaskSponsor(Set tasksForTaskSponsor) {
        this.tasksForTaskSponsor = tasksForTaskSponsor;
    }

    public Set getTasksForTaskTarget() {
        return this.tasksForTaskTarget;
    }

    public void setTasksForTaskTarget(Set tasksForTaskTarget) {
        this.tasksForTaskTarget = tasksForTaskTarget;
    }

    public Set getLeaves() {
        return this.leaves;
    }

    public void setLeaves(Set leaves) {
        this.leaves = leaves;
    }

    public Set getReservations() {
        return this.reservations;
    }

    public void setReservations(Set reservations) {
        this.reservations = reservations;
    }

    public Set getWorkSchedules() {
        return this.workSchedules;
    }

    public void setWorkSchedules(Set workSchedules) {
        this.workSchedules = workSchedules;
    }

}
