package net.app.vo;

import lombok.Data;

@Data
public class MailVO {

    private String from;
    private String to;
    private String subject;
    private String contents;
    private String rtnUrl;
    private String rtnVal;
    private String userId;
    private String loginId;
    private String votMakeNo;
    private String email;
    private String now;
    private String votStDt;
    private String votEdDt;
    private String lang;

}