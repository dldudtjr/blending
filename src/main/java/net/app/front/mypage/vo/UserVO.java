package net.app.front.mypage.vo;

import lombok.Data;
import net.app.vo.SessEtdVO;

@Data
public class UserVO extends SessEtdVO{
    private String firstNm;
    private String lastNm;
    private String position;
    private String email;
    private String phone;
    private String preferredTimeZone;
    private String emailCheckYn ="N";
    private String phoneCheckYn ="N";


    private String userId;
    private String userType = "001"; // 001 :brand 002 :buyer
    private String status = "001"; // 001 : ready 002 : use  003: fail
    private String password;
    private String userPassword;
    private String chgPassWd;
    private String chgPassWdChk;
    private String rtnVal;
    private String fileId;
    private String  authorGradCodeNm;
    private String  licenseTypeNm;
}