package net.base.code.vo;

import org.springframework.context.i18n.LocaleContextHolder;

import lombok.Data;
import net.base.cmm.vo.PaginationInfoVO;

@Data
public class SrchCmsmVO extends PaginationInfoVO {

    /* 코드 */


    private String srchCommCode;

    private String srchCombo;

    private String srchCmmnGroupCode = "*";
    public String srchLocale = "ko_KR".equals(LocaleContextHolder.getLocale() + "") ? "ko" : LocaleContextHolder.getLocale() + "";

    /* 코드 END */

}