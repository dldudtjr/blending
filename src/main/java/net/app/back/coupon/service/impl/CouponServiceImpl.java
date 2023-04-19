package net.app.back.coupon.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.back.coupon.service.CouponService;
import net.app.back.coupon.vo.CouponVO;
import net.app.lgn.util.CmsSessionUtils;
import net.app.lgn.util.FrntSessionUtils;
import net.app.vo.SrchVO;

@Service("couponService")
public class CouponServiceImpl extends EgovAbstractServiceImpl implements CouponService {

    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;


    @Resource(name = "couponDAO")
    private CouponDAO couponDAO;

    @Override
    public List<EgovMap> getCouponPageLst(SrchVO vo) {
        return this.couponDAO.getCouponPageLst(vo);
    }
    @Override
    public CouponVO getCouponDtl(CouponVO vo) {
        return this.couponDAO.getCouponDtl(vo);   
    }
    @Override
    public String insCouponDo(CouponVO vo) {
        vo.setRegistId(CmsSessionUtils.getUserId());
        if("".equals(vo.getCouponId()) || vo.getCouponId() == null ) {
            vo.setCouponId(this.couponDAO.getCouponId(vo));
        }
        
        return this.couponDAO.insCouponDo(vo) == "1" ? "success" : "error"; 
    }
    @Override
    public String udtCouponUseYnDo(CouponVO vo) {
        return this.couponDAO.udtCouponUseYnDo(vo);
    }
    @Override
    public String delCouponDo(CouponVO vo) {
        return this.couponDAO.delCouponDo(vo);   
    }
    @Override
    public String getDiscount(CouponVO vo) {
        vo.setUserId(FrntSessionUtils.getUserId());
        return this.couponDAO.getDiscount(vo);
    }

}