package net.app.lgn.vo;

import org.springframework.context.i18n.LocaleContextHolder;

import lombok.Data;

@Data
public class SessionUserVO {

    private String loginId;

    private String userId;

    private String userType;

    private String userNm = this.getFirstNm() +" "+this.getLastNm();

    private String status;

    private String firstNm;

    private String lastNm;

    private String email;

    private String phone;

    private String rtnVal;

    private String userPassword;

    private String useYn;

    private String fileId;

    private String coverFileId;

    private String brandFileId;

    private String cmpyFileId;

    private String cmpyId;

    private String cmpyNm;

    private String mvUrl;

    private String lang = LocaleContextHolder.getLocale() + "";

}