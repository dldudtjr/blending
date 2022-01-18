package net.app.vo;

import org.springframework.context.i18n.LocaleContextHolder;

import lombok.Data;
import net.base.cmm.vo.PaginationInfoVO;

@Data
public class SrchVO extends PaginationInfoVO {

    public String locale     = "ko_KR".equals(LocaleContextHolder.getLocale() + "") ? "ko" : LocaleContextHolder.getLocale() + "";
    public String srchLocale = "ko_KR".equals(LocaleContextHolder.getLocale() + "") ? "ko" : LocaleContextHolder.getLocale() + "";

    public String srchMappingType;
    public String srchUserId;

    public String goodsDtpgType;
}