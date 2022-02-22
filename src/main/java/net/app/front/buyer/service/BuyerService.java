package net.app.front.buyer.service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.vo.SrchVO;

public interface BuyerService {

    EgovMap getLatestBrand(SrchVO vo);


}