package net.app.lgn.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.lgn.vo.LoginHistVO;
import net.app.lgn.vo.SessionUserVO;
import net.app.vo.SrchVO;

@Repository("lgnDAO")
public class LgnDAO extends EgovComAbstractDAO {

    public SessionUserVO getLoginDtl(SessionUserVO sessionUserVO) {
        return selectOne("lgnDAO.getLoginDtl", sessionUserVO);
    }

  public String uptUserInfo(SessionUserVO sessionUserVO) {
      return update("lgnDAO.uptUserInfo", sessionUserVO) + "";
  }

    public String insLoginHistDo(LoginHistVO loginHistVO) {
        return insert("lgnDAO.insLoginHistDo", loginHistVO) + "";
    }

    public List<EgovMap> getLoginHistPageLst(SrchVO vo) {
        return selectList("lgnDAO.getLoginHistPageLst", vo);
    }
//
//    public String getLastLoginTime(String loginId) {
//        return selectOne("lgnDAO.getLastLoginTime", loginId);
//    }
//
//    public SessionUserVO getUserDtlDid(String deviceId) {
//        return selectOne("lgnDAO.getUserDtlDid", deviceId);
//    }
//
//    public EgovMap getUserLoginHist(UserVO vo) {
//        return selectOne("lgnDAO.getUserLoginHist", vo);
//    }

}