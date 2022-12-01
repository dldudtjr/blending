package net.base.cmm.interceptor;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.app.front.brand.product.service.ProductService;
import net.app.front.brand.product.vo.ProductVO;
import net.app.front.mypage.service.MypageService;
import net.app.lgn.util.FrntSessionUtils;
import net.base.cmm.annotation.CodeId;
import net.base.cmm.vo.SrchKeyTxtVO;
import net.base.code.service.CommCodeService;

public class BaseInterceptor extends HandlerInterceptorAdapter {

    @Resource(name = "commCodeService")
    private CommCodeService commCodeService;
//
//    @Resource(name = "lpsMenuService")
//    private LpsMenuService lpsMenuService;
//
//    @Resource(name = "roadMemMngService")
//    private RoadMemMngService roadMemMngService;
//
    @Resource(name = "mypageService")
    private MypageService mypageService;

    @Resource(name = "productService")
    private ProductService productService;



    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView modelAndView) throws Exception {

        HandlerMethod handlerMethod = handler instanceof HandlerMethod ? (HandlerMethod) handler : null;
        req.setAttribute("editor", "Ck"); // Ck,Daum,Smart 나중에 DB에서 받아옴

        if (FrntSessionUtils.isLoginChk()) {
//            req.setAttribute("_company",this.mypageService.getCmpyIdDtl(CmsSessionUtils.getUserInfo().getCmpyId()));
            ProductVO  productVO = new ProductVO();
            productVO.setRegtId(FrntSessionUtils.getUserId());
            req.setAttribute("productLatest", productService.getProductLatestDtl(productVO));
        }

        if (handlerMethod != null) {
            CodeId codeIdAry = AnnotationUtils.findAnnotation(handlerMethod.getMethod(), CodeId.class);
            if (codeIdAry != null) {
                for (String codeId : codeIdAry.value()) {
                    if (!"".equals(codeId)) {
                        HashMap<String, List<SrchKeyTxtVO>> map = this.commCodeService.getCacheCodeGrpAllLst(codeId);
                        req.setAttribute("CodeId" + codeId, map.get("none"));
                        req.setAttribute("CodeIdY" + codeId, map.get("Y"));
                        req.setAttribute("CodeIdS" + codeId, map.get("S"));
                    }

                }
            }
        }
    }

}