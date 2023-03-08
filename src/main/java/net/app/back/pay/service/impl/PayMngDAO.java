package net.app.back.pay.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.mypage.vo.PayVO;
import net.app.vo.SrchVO;

@Repository("payMngDAO")
public class PayMngDAO extends EgovComAbstractDAO {

    public List<EgovMap> getPayPageLst(SrchVO vo) {
        return this.selectList("payMngDAO.getPayPageLst", vo);
    }


    public String cancelPayDo(PayVO vo) {
        return this.update("payMngDAO.cancelPayDo", vo)+"";
    }

    public PayVO getPaRemainInfo(PayVO vo) {
        return this.selectOne("payMngDAO.getPaRemainInfo", vo);
    }



}