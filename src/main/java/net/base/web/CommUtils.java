package net.base.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.CookieGenerator;

import egov.cmm.EgovMessageSource;
import egov.cmm.util.EgovBasicLogger;

@Component
public class CommUtils {

    public final String BASE_JSP_DIR = "/tiles/pages/";

    public final String TILES_BACK = "back";

    public final String TILES_FRNT = "frnt";

    public final String BACK_JSP_DIR = BASE_JSP_DIR + TILES_BACK + "/";
    public final String FRNT_JSP_DIR = BASE_JSP_DIR + TILES_FRNT + "/";

    @Resource(name = "egovMessageSource")
    public EgovMessageSource egovMessageSource;

    public HttpServletResponse response;

    @ModelAttribute
    public void setResponse(HttpServletResponse res) {
        this.response = res;
    }

    public String redirect() {
        return this.redirect(null);
    }

    public String redirect(String url) {
        return "redirect:" + url;
    }

    public String page(String baseDir, String path) {
        return baseDir + "/" + path;
    }

    public ModelAndView downloadFile(ModelMap modelMap) {
        return new ModelAndView("downloadFileView", modelMap);
    }

    public String tiles(String path) {
        StringBuilder tilesPath = new StringBuilder(":");
        tilesPath.append(path);
        return tilesPath.toString();
    }

    public String tiles(String key, String path) {
        StringBuilder tilesPath = new StringBuilder(key);
        if (path != null) {
            tilesPath.append(":").append(path);
        }
        return tilesPath.toString();
    }

    public void pageAltMsgProp(String prop) {
        this.pageAltMsg(this.egovMessageSource.getMessage(prop));
    }

    public void pageErrorMsgProp(String prop) {
        this.pageAltMsg(this.egovMessageSource.getMessage(prop));
    }

    public void pageAltMsg(String egovMessageSource) {
        pageCookieMsg("_alertMsg", egovMessageSource, response);
    }

    public void pageErrorMsg(String egovMessageSource) {
        pageCookieMsg("_errorMsg", egovMessageSource, response);
    }

    public String pageRedirectAltMsg(String url, String altMsg) {
        this.pageAltMsg(altMsg);
        return this.redirect(url);
    }

    public String pageRedirectAltMsgProp(String url, String altProp) {
        this.pageAltMsgProp(altProp);
        return this.redirect(url);
    }

    public String pageRedirectErrorMsg(String url, String altMsg) {
        this.pageErrorMsg(altMsg);
        return this.redirect(url);
    }

    public String pageRedirectErrorMsgProp(String url, String altProp) {
        this.pageErrorMsgProp(altProp);
        return this.redirect(url);
    }

    public ModelMap returnSetMessage(String rtn) {
        ModelMap modelMap = new ModelMap();
        modelMap.put("msg", this.egovMessageSource.getMessage("success.common." + ("".equals(rtn) ? "error" : "insert")));
        return modelMap;
    }

    public void pageCookieMsg(String cookieName, String egovMessageSource, HttpServletResponse response) {
        if (cookieName != null && !"".equals(cookieName) && egovMessageSource != null && !"".equals(egovMessageSource)) {
            try {
                CookieGenerator cookieSet = new CookieGenerator();
                cookieSet.setCookieName(cookieName);
                cookieSet.addCookie(response, URLEncoder.encode(egovMessageSource, "UTF-8"));
                cookieSet.setCookiePath("/");
                cookieSet.setCookieSecure(true);
            } catch (UnsupportedEncodingException e) {
                EgovBasicLogger.ignore("EgovWebUtil pageCookieMsg >> Occurred Exception to close resource is ignored!! error message : " + e);
            }
        }
    }

}