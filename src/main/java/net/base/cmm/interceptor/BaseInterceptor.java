package net.base.cmm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.base.cmm.annotation.CodeId;

public class BaseInterceptor extends HandlerInterceptorAdapter {

//    @Resource(name = "commCodeService")
//    private CommCodeService commCodeService;
//
//    @Resource(name = "lpsMenuService")
//    private LpsMenuService lpsMenuService;
//
//    @Resource(name = "roadMemMngService")
//    private RoadMemMngService roadMemMngService;
//
//    @Resource(name = "lpsMenuUtil")
//    private LpsMenuUtil lpsMenuUtil;

    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView modelAndView) throws Exception {

        HandlerMethod handlerMethod = handler instanceof HandlerMethod ? (HandlerMethod) handler : null;
        req.setAttribute("editor", "Ck"); // Ck,Daum,Smart 나중에 DB에서 받아옴
        // ${editor} Daum Smart Namo Ck

//        if(req.getParameter("lang") != null && !"".equals(req.getParameter("lang"))) {
//            this.commCodeService.setCacheCodeGrpLst();
//        


        if (handlerMethod != null) {
            CodeId codeIdAry = AnnotationUtils.findAnnotation(handlerMethod.getMethod(), CodeId.class);
            if (codeIdAry != null) {
                for (String codeId : codeIdAry.value()) {
                    if (!"".equals(codeId)) {
//                        HashMap<String, List<SrchKeyTxtVO>> map = this.commCodeService.getCacheCodeGrpAllLst(codeId);
//                        req.setAttribute("CodeId" + codeId, map.get("none"));
//                        req.setAttribute("CodeIdY" + codeId, map.get("Y"));
//                        req.setAttribute("CodeIdS" + codeId, map.get("S"));
                    }

                }
            }
        }
    }

}