package net.app.vo;

import org.springframework.context.i18n.LocaleContextHolder;

import lombok.Data;

@Data
public class SessEtdVO {
//
//    private String memberId = "".equals(CmsSessionUtils.getMainMemberId()) ? CmsSessionUtils.getMemberId() : CmsSessionUtils.getMainMemberId();
//    private String memberNm;
//
//    private String userId = CmsSessionUtils.getUserId();
//
//    private String userNm = CmsSessionUtils.getName();
//
    private String registId;
    private String registDt;
    private String updtId;
    private String updtDt;
    private String useYn  = "Y";
    private String status = "001";
    private String fileId;
    private String saveFilePath;
    private String changeFileNm;
    private String locale = "ko_KR".equals(LocaleContextHolder.getLocale()+"") ? "ko" : LocaleContextHolder.getLocale()+"";
}