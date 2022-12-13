package net.app.front.mypage.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.mypage.vo.CmpyVO;
import net.app.front.mypage.vo.PayVO;
import net.app.front.mypage.vo.UserVO;
import net.app.vo.SrchVO;

@Repository("mypageDAO")
public class MypageDAO extends EgovComAbstractDAO {

    public List<EgovMap> getUserPageLst(UserVO vo) {
        return this.selectList("userDAO.getUserPageLst", vo);
    }

    public String getUserId(UserVO vo) {
        return this.selectOne("userDAO.getUserId", vo)+"";
    }


    public UserVO getUserDtl(UserVO vo) {
        return this.selectOne("userDAO.getUserDtl", vo);
    }

    public UserVO getUserEmailDtl(UserVO vo) {
        return this.selectOne("userDAO.getUserEmailDtl", vo);
    }


    public String insUserInfoDo(UserVO vo) {
        return this.insert("userDAO.insUserInfoDo", vo)+"";
    }

    public String udtUserInfoDo(UserVO vo) {
        return this.update("userDAO.udtUserInfoDo", vo)+"";
    }

    public String uptPasswordDo(UserVO vo) {
        return this.update("userDAO.uptPasswordDo", vo)+"";
    }

    public String uptEmailDo(UserVO vo) {
        return this.update("userDAO.uptEmailDo", vo)+"";
    }

    public String uptUserStatusDo(UserVO vo) {
        return this.update("userDAO.uptUserStatusDo", vo)+"";
    }

    public List<EgovMap> getCmpyPageLst(SrchVO vo) {
        return this.selectList("cmpyDAO.getCmpyPageLst", vo);
    }

    public CmpyVO getCmpyDtl(CmpyVO vo) {
        return this.selectOne("cmpyDAO.getCmpyDtl", vo);
    }

    public CmpyVO getCmpyIdDtl(String cmpyId) {
        return this.selectOne("cmpyDAO.getCmpyIdDtl", cmpyId);
    }



    public String insCmpyInfoDo(CmpyVO vo) {
        return this.insert("cmpyDAO.insCmpyInfoDo", vo)+"";
    }

    public String uptCmpyStatusDo(CmpyVO vo) {
        return this.update("cmpyDAO.uptCmpyStatusDo", vo)+"";
    }

    public String udtCmpyMvUrlSubmit(CmpyVO vo) {
        return this.update("cmpyDAO.udtCmpyMvUrlSubmit", vo)+"";
    }






    /* 접근 권한 */
    public List<EgovMap> getMappingLst(SrchVO vo) {
        return this.selectList("mappingDAO.getMappingLst", vo);
    }

    public String uptMappingUseYnDo(String parntsId) {
        return this.update("mappingDAO.uptMappingUseYnDo", parntsId)+"";
    }

    public String udtConnectAuthDo(UserVO insVO) {
        return this.update("mappingDAO.udtConnectAuthDo", insVO)+"";
    }

    public String insPayInfoDo(PayVO vo) {
        return this.update("mappingDAO.insPayInfoDo", vo)+"";
    }

    public String cancelPayInfoDo(PayVO vo) {
        return this.update("mappingDAO.cancelPayInfoDo", vo)+"";
    }


}