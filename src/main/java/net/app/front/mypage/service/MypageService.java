package net.app.front.mypage.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.front.mypage.vo.CmpyVO;
import net.app.front.mypage.vo.PayVO;
import net.app.front.mypage.vo.UserVO;
import net.app.vo.MappingVO;
import net.app.vo.SrchVO;

public interface MypageService {

//  마이페이지 사용자
    List<EgovMap> getUserPageLst(UserVO vo);




    String getUserId(UserVO vo);

    UserVO getUserDtl(UserVO vo);

    UserVO getUserEmailDtl(UserVO vo);


    String insUserInfoDo(UserVO vo);

    String uptUserStatusDo(UserVO vo);

    String udtUserInfoDo(UserVO userVO);

    String uptPasswordDo(UserVO userVO);

    // 이메일 변경
    String uptEmailDo(UserVO userVO);

    // 접근권한추가
    String udtConnectAuthDo(MappingVO vo);




    //  마이페이지 회사
    List<EgovMap> getCmpyPageLst(SrchVO vo);

    CmpyVO getCmpyDtl(CmpyVO vo);

    String insCmpyInfoDo(CmpyVO vo);

    String uptCmpyStatusDo(CmpyVO vo);

    List<EgovMap> getMappingLst(SrchVO vo);

    String udtCmpyMvUrlSubmit(CmpyVO vo);



    String insUserCmpyInfoDo(UserVO userVO, CmpyVO cmpyVO);


    CmpyVO getCmpyIdDtl(String cmpyId);

    String insPayInfoDo(PayVO vo);

    String cancelPayInfoDo(PayVO vo);




    PayVO getPayInfo(PayVO vo);









}