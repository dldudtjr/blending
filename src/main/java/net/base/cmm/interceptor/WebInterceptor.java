package net.base.cmm.interceptor;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import egov.cmm.util.EgovBasicLogger;
import net.app.lgn.annotation.PassAuth;
import net.app.lgn.util.CmsSessionUtils;
import net.base.utl.str.CommStringUtil;

public class WebInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) {

        if(req.getParameter("lang") != null && !"".equals(req.getParameter("lang"))) {
            Locale locale = extractLocale(req,req.getParameter("lang"));
            LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(req);
            localeResolver.setLocale(req, res, locale);
        }

        if (CmsSessionUtils.isLoginChk() && (req.getRequestURI().indexOf("login.lp") > -1)) {
            try {
                res.sendRedirect(req.getContextPath() + "/web/main/index.bt");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return false;
        }

        if (this.annotationLoginChk(handler) || (req.getRequestURI().indexOf(".ax") > -1)) {
            return true;
        }

        if (!CmsSessionUtils.isLoginChk()) {
            return this.loginPage(req, res);
        }

        return true;
    }

    private boolean loginPage(HttpServletRequest req, HttpServletResponse res, String rtnParm) {
        try {
            res.sendRedirect(req.getContextPath() + "/web/main/main.bt" + rtnParm);
        } catch (IOException ignore) {
            EgovBasicLogger.ignore(this.getClass() + "loginPage sendRedirect >> rtnParm : " + rtnParm + "Occurred Exception to close resource is ignored!! message : " + ignore);
        }
        return false;
    }

    private boolean loginPage(HttpServletRequest req, HttpServletResponse res) {
        String rtnPage = req.getRequestURL() + (req.getQueryString() != null ? ("?" + req.getQueryString()) : "");
        String rtnParm = !"".equals(rtnPage) && "GET".equals(req.getMethod()) ? "?returnPage=" + CommStringUtil.urlEncoder(rtnPage) : "";
        return this.loginPage(req, res, rtnParm);
    }

    private boolean annotationLoginChk(Object handler) {
        HandlerMethod handlerMethod = null;
        if (handler instanceof HandlerMethod) {
            handlerMethod = (HandlerMethod) handler;
        } else {
            return false;
        }
        if ((AnnotationUtils.findAnnotation(handlerMethod.getBeanType(), PassAuth.class) != null) || (AnnotationUtils.findAnnotation(handlerMethod.getMethod(), PassAuth.class) != null)) {
            return true;
        }
        return false;
    }

    private Locale extractLocale(HttpServletRequest request, String local) {
        if (StringUtils.hasText(local)) {
            return StringUtils.parseLocaleString(local);
        }
        return request.getLocale();
    }

}