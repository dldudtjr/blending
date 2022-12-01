package net.app.lgn.vo;

import org.springframework.context.i18n.LocaleContextHolder;

import lombok.Data;
import net.app.lgn.util.FrntSessionUtils;

@Data
public class LoginHistVO {

    private String loginHistSn;
    private String loginId   = FrntSessionUtils.getId();
    private String userId    = FrntSessionUtils.getUserId();
    private String userIp    = FrntSessionUtils.getHttpServletRequest().getRemoteAddr();
    private String sessionId = FrntSessionUtils.getSessionId();
    private String status;
    private String locale    = LocaleContextHolder.getLocale() + "";


}