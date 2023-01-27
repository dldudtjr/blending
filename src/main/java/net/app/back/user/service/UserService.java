package net.app.back.user.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.mypage.vo.UserVO;
import net.app.vo.SrchVO;

public interface UserService {

//  마이페이지 사용자
    List<EgovMap> getUserPageLst(SrchVO vo);

    String getUserId(UserVO vo);

    UserVO getUserDtl(UserVO vo);

    UserVO getUserEmailDtl(UserVO vo);


    String insUserInfoDo(UserVO vo);

    String uptUserStatusDo(UserVO vo);

    String udtUserInfoDo(UserVO userVO);

    String uptPasswordDo(UserVO userVO);

    String expireChg(UserVO userVO);

    String udtBuyerViewChgDo(UserVO userVO);



}