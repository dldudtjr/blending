package net.app.lgn.service;

import net.app.lgn.vo.SessionUserVO;

public interface LgnService {

    SessionUserVO getLoginDtl(SessionUserVO sessionUserVO);

    String uptUserInfo(SessionUserVO sessionUserVO);

//    String insLoginHistDo(LoginHistVO loginHistVO);
//
//    List<EgovMap> getSysAuthChk(String loginId);
//
//    String getLastLoginTime(String loginId);
//
//    SessionUserVO getUserDtlDid(String deviceId);
//
//    EgovMap getUserLoginHist(UserVO vo);

}