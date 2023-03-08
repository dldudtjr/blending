package net.app.back.pay.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.mypage.vo.PayVO;
import net.app.vo.SrchVO;

public interface PayMngService {

    List<EgovMap> getPayPageLst(SrchVO vo);

    String cancelPayDo(PayVO vo);

}