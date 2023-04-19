package net.app.back.coupon.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.back.coupon.vo.CouponVO;
import net.app.vo.SrchVO;

@Repository("couponDAO")
public class CouponDAO extends EgovComAbstractDAO {

    public List<EgovMap> getCouponPageLst(SrchVO vo) {
        return this.selectList("couponDAO.getCouponPageLst", vo);
    }
    
    public CouponVO getCouponDtl(CouponVO vo) {
        return this.selectOne("couponDAO.getCouponDtl", vo);
    }

    public String insCouponDo(CouponVO vo) {
        return this.update("couponDAO.insCouponDo", vo)+"";
    }
    
    public String udtCouponUseYnDo(CouponVO vo) {
        return this.update("couponDAO.udtCouponUseYnDo", vo)+"";
    }
    
    public String delCouponDo(CouponVO vo) {
        return this.delete("couponDAO.delCouponDo", vo)+"";   
    }

    public String getCouponId(CouponVO vo) {
        return this.selectOne("couponDAO.getCouponId", vo);
    }
    
    public String getDiscount(CouponVO vo) {
        return this.selectOne("couponDAO.getDiscount", vo);
    }
}