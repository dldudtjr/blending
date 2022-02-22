package net.app.front.buyer.service.impl;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.vo.SrchVO;

@Repository("buyerDAO")
public class BuyerDAO extends EgovComAbstractDAO {

    public EgovMap getLatestBrand(SrchVO vo) {
        return this.selectOne("buyerDAO.getLatestBrand", vo);
    }

}