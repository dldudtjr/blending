package net.app.back.coupon.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.cmm.EgovMessageSource;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.back.coupon.service.CouponService;
import net.app.back.coupon.vo.CouponVO;
import net.app.file.service.FileService;
import net.app.vo.SrchVO;
import net.base.web.CommUtils;

@Controller
@RequestMapping(path = "back/coupon/")
public class CouponController {

    @Resource(name = "sessionContextFactory")
    private ObjectFactory<?> sessionContextFactory;

    @Resource(name = "commUtils")
    private CommUtils commUtils;

    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    @Resource(name = "fileService")
    private FileService fileService;

    @Resource(name = "couponService")
    private CouponService couponService;

    String path = "tiles/pages/back/coupon";
    
    @RequestMapping(path = "couponList.bt")
    public String couponList(@ModelAttribute("srchFm") SrchVO srchVO, ModelMap model) {

        List<EgovMap> eMap = this.couponService.getCouponPageLst(srchVO);
        srchVO.setTotalRecordCount(eMap.size() > 0 ? Integer.parseInt(eMap.get(0).get("totCnt") + "") : 0);
        model.addAttribute("srchLst", eMap);

        return commUtils.tiles(commUtils.TILES_BACK, "coupon/couponList");
    }
    
    @RequestMapping(path = "couponMng.ax")
    public String couponMng(SrchVO srchVO, @ModelAttribute("saveFm") CouponVO couponVO, ModelMap model) {
        if (!"".equals(couponVO.getCouponId())) {
            model.addAttribute("saveFm", this.couponService.getCouponDtl(couponVO));
        }
        return this.path + "/couponMng";
    }
    
    @RequestMapping(path = "couponMngSubmitDo.ax")
    @ResponseBody
    public ModelMap couponMngSubmitDo(CouponVO couponVO) {
        ModelMap modelMap = new ModelMap();
        
        String rtn = couponService.insCouponDo(couponVO);

        if ("success".equals(rtn)) {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common." + rtn));
        } else {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
        }

        return modelMap;
    }
    
    @RequestMapping(path = "/udtCouponUseYnDo.ax")
    @ResponseBody
    public ModelMap udtCouponUseYnDo(CouponVO couponVO) {
        String rtn = couponService.udtCouponUseYnDo(couponVO);
        ModelMap modelMap = new ModelMap();
        modelMap.put("msg", "".equals(rtn) ? this.egovMessageSource.getMessage("fail.common.msg") : " 상태가 변경되었습니다. ");
        return modelMap;
    }

    @RequestMapping(path = "/delCouponDo.ax")
    @ResponseBody
    public ModelMap delCouponDo(SrchVO srchVO, CouponVO couponVO) {
        ModelMap modelMap = new ModelMap();

        String rtn = couponService.delCouponDo(couponVO);

        if ("1".equals(rtn)) {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
        } else {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
        }
        
        return modelMap;
    }

    @RequestMapping(path = "/getDiscount.ax")
    @ResponseBody
    public String getDiscount(CouponVO couponVO, ModelMap model) {
        return couponService.getDiscount(couponVO);
    }
}
