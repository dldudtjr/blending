package net.app.front.mypage.vo;

import lombok.Data;
import net.app.vo.SessEtdVO;

@Data
public class CmpyVO extends SessEtdVO{

    private String cmpyId;
    private String userId;
    private String cmpyNm;
    private String brandNm;
    private String bizType;
    private String bizCategory;
    private String bizRegNo;
    private String legalEntityNo;
    private String sectors;
    private String industry;
    private String repNm;
    private String repPhone;
    private String repPhoneCheckYn;
    private String repEmail;
    private String repEmailCheckYn;
    private String repFax;
    private String addr;
    private String fileId;
    private String mvUrl;
 }