package net.app.lgn.vo;

import org.springframework.context.i18n.LocaleContextHolder;

import lombok.Data;
import net.app.lgn.util.CmsSessionUtils;

@Data
public class LoginHistVO {

    private String loginHistSn;
    private String loginId   = CmsSessionUtils.getId();
    private String userId    = CmsSessionUtils.getUserId();
    private String userIp    = CmsSessionUtils.getHttpServletRequest().getRemoteAddr();
    private String sessionId = CmsSessionUtils.getSessionId();
    private String status;
    private String locale    = LocaleContextHolder.getLocale() + "";


}