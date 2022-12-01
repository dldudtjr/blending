package net.app.lgn.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import net.app.lgn.enu.SessionTypeEnum;
import net.app.lgn.vo.SessionUserVO;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

public class FrntSessionUtils {

    public final static String sessionKey = SessionTypeEnum._sessionKey.toString();

    public final static String mainMemberId = SessionTypeEnum._mainMemberId.toString();

    public static HttpServletRequest getHttpServletRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    public static String getId() {
        return isLoginChk() ? getUserInfo().getEmail() : "";
    }

    public static String getUserId() {
        return isLoginChk() ? getUserInfo().getUserId() : "";
    }

    public static SessionUserVO getUserInfo() {
        return (SessionUserVO) getHttpServletRequest().getSession().getAttribute(sessionKey);
    }

    public static HttpSession getUserSession() {
        return getHttpServletRequest().getSession();
    }

    public static boolean isLoginChk() {
        if ((getUserInfo() != null) && (getUserInfo().getUserId() != null)) {
            return true;
        } else {
            return false;
        }
    }

    public static String getSessionId() {
        return getHttpServletRequest().getSession().getId();
    }

    public static String getIp() {
        return getHttpServletRequest().getLocalAddr();
    }

    public static void loginCacheReset(String loginId, int cnt) {
        Cache cache = CacheManager.create().getCache("loginChkCache");
        Element newElement = new Element(loginId, cnt);
        cache.put(newElement);
    }

}