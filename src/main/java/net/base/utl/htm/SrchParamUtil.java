package net.base.utl.htm;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.springframework.core.annotation.AnnotationUtils;

import egov.cmm.util.EgovBasicLogger;
import net.base.cmm.annotation.SrchParm;
import net.base.cmm.vo.PaginationInfoVO;

public class SrchParamUtil {
    
    public static String makeInputTag(PaginationInfoVO paginationInfoVO) {
        
        Class<?> cls = paginationInfoVO.getClass();
        StringBuilder tagString = new StringBuilder();
        for (Method method : cls.getMethods()) {
            
            for (Field fld : cls.getDeclaredFields()) {
                if (AnnotationUtils.findAnnotation(fld, SrchParm.class) != null) {
                    if (method.getName().equals("get" + fld.getName().substring(0, 1).toUpperCase() + fld.getName().substring(1))) {
                        try {
                            Method m = cls.getMethod(method.getName(), new Class[] {});
                            String value = m.invoke(paginationInfoVO, new Object[] {}) == null ? "" : m.invoke(paginationInfoVO, new Object[] {}) + "";
                            tagString.append("<input type=\"hidden\" name=\"").append(fld.getName()).append("\" value=\"").append(value).append("\" />");
                        } catch (SecurityException | NoSuchMethodException | IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
                            EgovBasicLogger.ignore("SrchParamUtil makeInputTag : Occurred Exception to close resource is ignored!!" + e);
                        }
                    }
                }
            }
        }
        
        tagString.append(makeInputPageTag(paginationInfoVO));
        
        return tagString.toString();
        
    }
    
    public static String makeInputPageTag(PaginationInfoVO paginationInfoVO) {
        
        StringBuilder tagString = new StringBuilder();
        tagString.append("<input type=\"hidden\" id=\"currentPageNo\" name=\"currentPageNo\" value=\"").append(paginationInfoVO.getCurrentPageNo()).append("\" />");
        tagString.append("<input type=\"hidden\" id=\"recordCountPerPage\" name=\"recordCountPerPage\" value=\"").append(paginationInfoVO.getRecordCountPerPage()).append("\" />");
        tagString.append("<input type=\"hidden\" id=\"pageSize\" name=\"pageSize\" value=\"").append(paginationInfoVO.getPageSize()).append("\" />");
        tagString.append("<input type=\"hidden\" id=\"totalRecordCount\" name=\"totalRecordCount\" value=\"").append(paginationInfoVO.getTotalRecordCount()).append("\" />");
        
        return tagString.toString();
        
    }
    
}