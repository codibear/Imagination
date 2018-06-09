package com.codiibear.imagination.domian;


import java.util.Date;

/**
 * Created by codiibear on 2018/4/30.
 */
public class Imagination {
    private Integer imaid;
    private String imaname;
    private Integer userid;
    private Integer praisenum;
    private Date imatime;
    private int imalike;
    private String imabrief;
    private String imacontent;
    private String imaphoto;

    public String getImaphoto() {
        return imaphoto;
    }

    public void setImaphoto(String imaphoto) {
        this.imaphoto = imaphoto;
    }

    public Integer getImaid() {
        return imaid;
    }

    public void setImaid(Integer imaid) {
        this.imaid = imaid;
    }

    public String getImaname() {
        return imaname;
    }

    public void setImaname(String imaname) {
        this.imaname = imaname;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getPraisenum() {
        return praisenum;
    }

    public void setPraisenum(Integer praisenum) {
        this.praisenum = praisenum;
    }

    public Date getImatime() {
        return imatime;
    }

    public void setImatime(Date imatime) {
        this.imatime = imatime;
    }

    public int getImalike() {
        return imalike;
    }

    public void setImalike(int imalike) {
        this.imalike = imalike;
    }

    public String getImabrief() {
        return imabrief;
    }

    public void setImabrief(String imabrief) {
        this.imabrief = imabrief;
    }

    public String getImacontent() {
        return imacontent;
    }

    public void setImacontent(String imacontent) {
        this.imacontent = imacontent;
    }
}
