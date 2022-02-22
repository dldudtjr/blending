package net.app.front.buyer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.buyer.service.BuyerService;
import net.app.vo.SrchVO;

@Service("buyerService")
public class BuyerServiceImpl extends EgovAbstractServiceImpl implements BuyerService {



    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;


    @Resource(name = "buyerDAO")
    private BuyerDAO buyerDAO;



    @Override
    public EgovMap getLatestBrand(SrchVO vo) {
        return this.buyerDAO.getLatestBrand(vo);
    }



}