package net.app.lgn.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.lgn.vo.LoginHistVO;
import net.app.lgn.vo.SessionUserVO;
import net.app.vo.SrchVO;

public interface LgnService {

    SessionUserVO getLoginDtl(SessionUserVO sessionUserVO);

    String uptUserInfo(SessionUserVO sessionUserVO);

    String insLoginHistDo(LoginHistVO loginHistVO);

    List<EgovMap> getLoginHistPageLst(SrchVO loginId);
//
//    String getLastLoginTime(String loginId);
//
//    SessionUserVO getUserDtlDid(String deviceId);
//
//    EgovMap getUserLoginHist(UserVO vo);

}