package com.codiibear.imagination.domian;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by codiibear on 2018/3/13.
 */
public class Tested implements Serializable{
    private Integer id;
    private String somename;
    private String somepsd;
    private Date somedate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSomename() {
        return somename;
    }

    public void setSomename(String somename) {
        this.somename = somename;
    }

    public String getSomepsd() {
        return somepsd;
    }

    public void setSomepsd(String somepsd) {
        this.somepsd = somepsd;
    }

    public Date getSomedate() {
        return somedate;
    }

    public void setSomedate(Date somedate) {
        this.somedate = somedate;
    }
}
