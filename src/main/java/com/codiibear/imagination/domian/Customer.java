package com.codiibear.imagination.domian;

import java.io.Serializable;

/**
 * Created by codiibear on 2018/3/19.
 * 用户id、账户、密码、昵称、座右铭、信息、密码
 * 身份证、关注人、关注话题、评论
 */


public class Customer{
    private Integer userid;
    private String username;
    private String nickname;
    private String usermotto;
    private String userinfo;
    private String userpwd;
    private String usercerti;
    private String careuser;
    private String caretopic;
    private String comments;

    @Override
    public String toString() {
        return "Customer{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", nickname='" + nickname + '\'' +
                ", usermotto='" + usermotto + '\'' +
                ", userinfo='" + userinfo + '\'' +
                ", userpwd='" + userpwd + '\'' +
                ", usercerti='" + usercerti + '\'' +
                ", careuser='" + careuser + '\'' +
                ", caretopic='" + caretopic + '\'' +
                ", comments='" + comments + '\'' +
                '}';
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUsermotto() {
        return usermotto;
    }

    public void setUsermotto(String usermotto) {
        this.usermotto = usermotto;
    }

    public String getUserinfo() {
        return userinfo;
    }

    public void setUserinfo(String userinfo) {
        this.userinfo = userinfo;
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public String getUsercerti() {
        return usercerti;
    }

    public void setUsercerti(String usercerti) {
        this.usercerti = usercerti;
    }

    public String getCareuser() {
        return careuser;
    }

    public void setCareuser(String careuser) {
        this.careuser = careuser;
    }

    public String getCaretopic() {
        return caretopic;
    }

    public void setCaretopic(String caretopic) {
        this.caretopic = caretopic;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
}
