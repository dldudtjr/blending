package net.app.back.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.back.user.service.UserService;
import net.app.front.mypage.vo.UserVO;
import net.app.lgn.util.FrntSessionUtils;
import net.app.vo.SrchVO;

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {



    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;


    @Resource(name = "userDAO")
    private UserDAO userDAO;


    @Override
    public List<EgovMap> getUserPageLst(SrchVO vo) {
        return this.userDAO.getUserPageLst(vo);
    }



    @Override
    public String uptPasswordDo(UserVO vo) {
        vo.setEmail(FrntSessionUtils.getUserInfo().getEmail());
        return this.userDAO.uptPasswordDo(vo);
    }


    @Override
    public String expireChg(UserVO vo) {
        return this.userDAO.expireChg(vo);
    }


    @Override
    public String getUserId(UserVO vo) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public UserVO getUserDtl(UserVO vo) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public UserVO getUserEmailDtl(UserVO vo) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public String insUserInfoDo(UserVO vo) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public String uptUserStatusDo(UserVO vo) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public String udtUserInfoDo(UserVO userVO) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String udtBuyerViewChgDo(UserVO vo) {
        return this.userDAO.udtBuyerViewChgDo(vo);
    }







}