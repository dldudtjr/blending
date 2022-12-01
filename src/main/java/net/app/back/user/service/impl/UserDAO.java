package net.app.back.user.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.mypage.vo.CmpyVO;
import net.app.front.mypage.vo.UserVO;
import net.app.vo.SrchVO;

@Repository("userDAO")
public class UserDAO extends EgovComAbstractDAO {

    public List<EgovMap> getUserPageLst(SrchVO vo) {
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



    public String expireChg(UserVO vo) {
        return this.update("userDAO.expireChg", vo)+"";
    }



}