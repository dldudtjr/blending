package net.app.front.mypage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.mypage.service.MypageService;
import net.app.front.mypage.vo.CmpyVO;
import net.app.front.mypage.vo.UserVO;
import net.app.lgn.enu.UserStatusEnum;
import net.app.lgn.util.CmsSessionUtils;
import net.app.vo.MappingVO;
import net.app.vo.SrchVO;

@Service("mypageService")
public class MypageServiceImpl extends EgovAbstractServiceImpl implements MypageService {



    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;


    @Resource(name = "mypageDAO")
    private MypageDAO mypageDAO;


    @Override
    public List<EgovMap> getUserPageLst(UserVO vo) {
        return this.mypageDAO.getUserPageLst(vo);
    }

    @Override
    public UserVO getUserDtl(UserVO userVO) {

        userVO.setUserId(CmsSessionUtils.getUserId());

        return this.mypageDAO.getUserDtl(userVO);
    }

    @Override
    public String insUserInfoDo(UserVO vo) {
        return this.mypageDAO.insUserInfoDo(vo);
    }

    @Override
    public String udtUserInfoDo(UserVO vo) {
        return this.mypageDAO.udtUserInfoDo(vo);
    }

    @Override
    public String uptPasswordDo(UserVO vo) {
        return this.mypageDAO.uptPasswordDo(vo);
    }

    @Override
    public String uptEmailDo(UserVO userVO) {

        userVO.setUseYn(UserStatusEnum.Y.getCode());
        userVO.setStatus(UserStatusEnum.REG.getCode());
        userVO.setUserId(CmsSessionUtils.getUserId());
        return this.mypageDAO.uptEmailDo(userVO);
    }


    @Override
    public String udtConnectAuthDo(MappingVO mappingVO) {

     this.mypageDAO.uptMappingUseYnDo(CmsSessionUtils.getUserId());
     for(String email :  mappingVO.getUserEmailArr()) {

         UserVO insVO = new UserVO();
         insVO.setUserId(CmsSessionUtils.getUserId());
         insVO.setEmail(email);
         this.mypageDAO.udtConnectAuthDo(insVO);
     }
        return "1";
    }


    @Override
    public String uptUserStatusDo(UserVO vo) {
        return this.mypageDAO.uptUserStatusDo(vo);
    }

    @Override
    public List<EgovMap> getCmpyPageLst(CmpyVO vo) {
        return this.mypageDAO.getCmpyPageLst(vo);
    }


    @Override
    public CmpyVO getCmpyDtl(CmpyVO vo) {
        return this.mypageDAO.getCmpyDtl(vo);
    }

    @Override
    public String insCmpyInfoDo(CmpyVO vo) {
        return this.mypageDAO.insCmpyInfoDo(vo);
    }

    @Override
    public String uptCmpyStatusDo(CmpyVO vo) {
        return this.mypageDAO.uptCmpyStatusDo(vo);
    }

    @Override
    public List<EgovMap> getMappingLst(SrchVO vo) {
        return this.mypageDAO.getMappingLst(vo);
    }


}