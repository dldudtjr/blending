package net.app.lgn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.lgn.service.LgnService;
import net.app.lgn.vo.LoginHistVO;
import net.app.lgn.vo.SessionUserVO;
import net.app.vo.SrchVO;

@Service("lgnService")
public class LgnServiceImpl extends EgovAbstractServiceImpl implements LgnService {

    @Resource(name = "lgnDAO")
    private LgnDAO lgnDAO;

    @Override
    public SessionUserVO getLoginDtl(SessionUserVO sessionUserVO) {
        return lgnDAO.getLoginDtl(sessionUserVO);
    }

    @Override
    public String uptUserInfo(SessionUserVO sessionUserVO) {
        return lgnDAO.uptUserInfo(sessionUserVO);
    }


    @Override
    public String insLoginHistDo(LoginHistVO loginHistVO) {
        return lgnDAO.insLoginHistDo(loginHistVO);
    }

  @Override
  public List<EgovMap> getLoginHistPageLst(SrchVO vo) {
      return lgnDAO.getLoginHistPageLst(vo);
  }
//
//    @Override
//    public List<EgovMap> getSysAuthChk(String loginId) {
//        return lgnDAO.getSysAuthChk(loginId);
//    }
//
//    @Override
//    public String getLastLoginTime(String loginId) {
//        return lgnDAO.getLastLoginTime(loginId);
//    }
//
//    @Override
//    public SessionUserVO getUserDtlDid(String deviceId) {
//        return lgnDAO.getUserDtlDid(deviceId);
//    }
//
//    @Override
//    public EgovMap getUserLoginHist(UserVO vo) {
//        return lgnDAO.getUserLoginHist(vo);
//    }

}