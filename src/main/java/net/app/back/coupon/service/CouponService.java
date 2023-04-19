package net.app.back.coupon.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.back.coupon.vo.CouponVO;
import net.app.vo.SrchVO;

public interface CouponService {

    List<EgovMap> getCouponPageLst(SrchVO vo);
    
    CouponVO getCouponDtl(CouponVO vo);
    
    String insCouponDo(CouponVO vo);
    
    String udtCouponUseYnDo(CouponVO vo);
    
    String delCouponDo(CouponVO vo);
    
    String getDiscount(CouponVO vo);

}