package net.base.cmm.handlerMhdResolver;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.springframework.core.MethodParameter;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.nhncorp.lucy.security.xss.XssPreventer;

import egov.cmm.util.EgovBasicLogger;
import net.base.cmm.annotation.XssExcp;

public class ExcpXSSHandlerResolver implements HandlerMethodArgumentResolver {

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        Class<?> clz = parameter.getParameterType();
        for (Field fld : clz.getDeclaredFields()) {
            if (AnnotationUtils.findAnnotation(fld, XssExcp.class) != null) {
                return true;
            }
        }
        return false;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {

        Object obj = Class.forName(parameter.getParameterType().getName()).newInstance();
        Class<?> clz = obj.getClass();
        for (Method method : clz.getMethods()) {
            for (Field fld : clz.getDeclaredFields()) {
                if (method.getName().equals("set" + fld.getName().substring(0, 1).toUpperCase() + fld.getName().substring(1))) {
                    try {
                        Method mtd = clz.getMethod(method.getName(), String.class);
                        mtd.invoke(obj, AnnotationUtils.findAnnotation(fld, XssExcp.class) != null ? XssPreventer.unescape(webRequest.getParameter(fld.getName())) : webRequest.getParameter(fld.getName()));
                    } catch (SecurityException | NoSuchMethodException | IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
                        EgovBasicLogger.ignore("ExcpXSSHandlerResolver resolveArgument >> Occurred Exception to close resource is ignored!!" + e);
                    }
                }
            }
        }
        return obj;
    }
}