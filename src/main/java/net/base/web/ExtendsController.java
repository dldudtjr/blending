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
public class ExtendsController {

    @Resource(name = "egovMessageSource")
    protected EgovMessageSource egovMessageSource;

    protected HttpServletResponse response;

    @ModelAttribute
    protected void setResponse(HttpServletResponse res) {
        this.response = res;
    }

    protected String redirect() {
        return this.redirect(null);
    }

    protected String redirect(String url) {
        return "redirect:" + url;
    }

    protected String page(String baseDir, String path) {
        return baseDir + "/" + path;
    }

    protected ModelAndView downloadFile(ModelMap modelMap) {
        return new ModelAndView("downloadFileView", modelMap);
    }

    protected String tiles(String path) {
        StringBuilder tilesPath = new StringBuilder(":");
        tilesPath.append(path);
        return tilesPath.toString();
    }

    protected String tiles(String key, String path) {
        StringBuilder tilesPath = new StringBuilder(key);
        if (path != null) {
            tilesPath.append(":").append(path);
        }
        return tilesPath.toString();
    }

    protected void pageAltMsgProp(String prop) {
        this.pageAltMsg(this.egovMessageSource.getMessage(prop));
    }

    protected void pageErrorMsgProp(String prop) {
        this.pageAltMsg(this.egovMessageSource.getMessage(prop));
    }

    protected void pageAltMsg(String egovMessageSource) {
        pageCookieMsg("_alertMsg", egovMessageSource, response);
    }

    protected void pageErrorMsg(String egovMessageSource) {
        pageCookieMsg("_errorMsg", egovMessageSource, response);
    }

    protected String pageRedirectAltMsg(String url, String altMsg) {
        this.pageAltMsg(altMsg);
        return this.redirect(url);
    }

    protected String pageRedirectAltMsgProp(String url, String altProp) {
        this.pageAltMsgProp(altProp);
        return this.redirect(url);
    }

    protected String pageRedirectErrorMsg(String url, String altMsg) {
        this.pageErrorMsg(altMsg);
        return this.redirect(url);
    }

    protected String pageRedirectErrorMsgProp(String url, String altProp) {
        this.pageErrorMsgProp(altProp);
        return this.redirect(url);
    }

    protected ModelMap returnSetMessage(String rtn) {
        ModelMap modelMap = new ModelMap();
        modelMap.put("msg", this.egovMessageSource.getMessage("success.common." + ("".equals(rtn) ? "error" : "insert")));
        return modelMap;
    }

    protected void pageCookieMsg(String cookieName, String egovMessageSource, HttpServletResponse response) {
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