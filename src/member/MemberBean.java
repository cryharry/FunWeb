/*
 * MemberBean.java 2014. 10. 29.
 *
 * Copyright oracleclub.com All rights Reserved.
 */
package member;

import java.sql.Timestamp;

/**
 * Class 내용 기술
 *
 * @author : user
 *
 */
public class MemberBean {
    private String id;
    private String passwd;
    private String name;
    private Timestamp reg_date;
    private int age;
    private String gender;
    private String email;
    private String address;
    private String tel;
    private String mtel;
    /**
     * @return the id
     */
    public String getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
    /**
     * @return the passwd
     */
    public String getPasswd() {
        return passwd;
    }
    /**
     * @param passwd the passwd to set
     */
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return the reg_date
     */
    public Timestamp getReg_date() {
        return reg_date;
    }
    /**
     * @param reg_date the reg_date to set
     */
    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }
    /**
     * @return the age
     */
    public int getAge() {
        return age;
    }
    /**
     * @param age the age to set
     */
    public void setAge(int age) {
        this.age = age;
    }
    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }
    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }
    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }
    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }
    /**
     * @return the tel
     */
    public String getTel() {
        return tel;
    }
    /**
     * @param tel the tel to set
     */
    public void setTel(String tel) {
        this.tel = tel;
    }
    /**
     * @return the mtel
     */
    public String getMtel() {
        return mtel;
    }
    /**
     * @param mtel the mtel to set
     */
    public void setMtel(String mtel) {
        this.mtel = mtel;
    }
}
