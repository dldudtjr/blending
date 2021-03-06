package net.app.front.mypage.web;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egov.cmm.EgovFileUpload;
import egov.cmm.EgovMessageSource;
import egov.utl.inno.CryptoUtils;
import net.app.file.service.FileService;
import net.app.file.vo.FileVO;
import net.app.front.mypage.service.MypageService;
import net.app.front.mypage.vo.CmpyVO;
import net.app.front.mypage.vo.UserVO;
import net.app.lgn.enu.SessionTypeEnum;
import net.app.lgn.enu.UserStatusEnum;
import net.app.lgn.service.LgnService;
import net.app.lgn.util.CmsSessionUtils;
import net.app.lgn.vo.SessionContext;
import net.app.lgn.vo.SessionUserVO;
import net.app.vo.MailVO;
import net.app.vo.MappingVO;
import net.app.vo.SrchVO;
import net.base.cmm.CmsMailUtil;
import net.base.utl.fcc.SHA256EncryptUtil;
import net.base.web.CommUtils;

@Controller
@RequestMapping(path = "web/mypage/")
public class MyPageController {

    @Resource(name = "sessionContextFactory")
    private ObjectFactory<?> sessionContextFactory;

    @Resource(name = "commUtils")
    private CommUtils commUtils;

    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    @Resource(name = "fileService")
    private FileService fileService;

    @Resource(name = "mypageService")
    private MypageService mypageService;

    @Resource(name = "lgnService")
    private LgnService lgnService;

    @Resource(name = "cmsMailUtil")
    private CmsMailUtil cmsMailUtil;

    String path = "tiles/pages/frnt/mypage";


    @RequestMapping(path = "registGuide.bt")
    public String registGuide() {
        return commUtils.tiles(commUtils.TILES_FRNT, "mypage/registGuide");
    }

    @RequestMapping(path = "userInfo.bt")
    public String userInfo(SrchVO srchVO, @ModelAttribute("saveFm") UserVO userVO, ModelMap model) {

        if (CmsSessionUtils.getUserId() != null && !"".equals(CmsSessionUtils.getUserId())) {
            userVO.setUserId(CmsSessionUtils.getUserId());
            model.addAttribute("saveFm", mypageService.getUserDtl(userVO));
        }
        return commUtils.tiles(commUtils.TILES_FRNT, "mypage/userInfo");
    }

    @RequestMapping(path = "/userInfoSubmitDo.ax")
    @ResponseBody
    public ModelMap userInfoSubmitDo(MultipartHttpServletRequest request, UserVO userVO, SrchVO srchVO, HttpSession session, HttpServletRequest req, SessionUserVO sessionUserVO) throws IOException {

        userVO.setStatus(UserStatusEnum.USE.getCode());

        ModelMap modelMap = new ModelMap();

        // userVO.setUserPassword(SHA256EncryptUtil.getSHA256(userVO.getPassword()));

        String rtnId = mypageService.udtUserInfoDo(userVO);

        List<FileVO> list;
        try {
            list = EgovFileUpload.fileUploads(request, this.path); // ?????? ?????????
            if (list.size() > 0) {
                this.fileService.insFileDo(list, userVO.getUserId());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        if ("1".equals(rtnId)) {
            sessionUserVO.setLoginId(CmsSessionUtils.getUserInfo().getEmail());
            sessionUserVO = lgnService.getLoginDtl(sessionUserVO);

            this.setSessionContextFactory(sessionUserVO, session);
            modelMap.put("code", "0001");
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
        } else {
            modelMap.put("code", "9999");
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.fail"));
        }

        return modelMap;

        /*
         * model.addAttribute("saveFm", userService.getUserDtl(userVO)); return this.redirect("/web/lgn/logOut.lp");
         */
    }

    @RequestMapping(path = "insUserInfoDo.ax")
    public ModelMap insUserInfoDo(MultipartHttpServletRequest request ,UserVO UserVO, ModelMap model) {
        ModelMap modelMap = new ModelMap();

        String rtn = mypageService.insUserInfoDo(UserVO);

        List<FileVO> list;
        try {
            list = EgovFileUpload.fileUploads(request, this.path); // ?????? ?????????
            if (list.size() > 0) {
                this.fileService.insFileDo(list, UserVO.getUserId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if ("1".equals(rtn)) {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
        } else {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
        }

        return modelMap;
    }

    @RequestMapping(path = "cmpyInfo.bt")
    public String cmpyInfo(SrchVO srchVO, CmpyVO cmpyVO, ModelMap model) {
        cmpyVO.setUserId(CmsSessionUtils.getUserId());
        cmpyVO.setCmpyId(CmsSessionUtils.getUserInfo().getCmpyId());
        model.addAttribute("saveFm", mypageService.getCmpyDtl(cmpyVO));
        return commUtils.tiles(commUtils.TILES_FRNT, "mypage/cmpyInfo");
    }

    @RequestMapping(path = "/cmpyInfoSubmitDo.ax")
    @ResponseBody
    public ModelMap cmpyInfoSubmitDo(MultipartHttpServletRequest request, CmpyVO cmpyVO, ModelMap model) {

        ModelMap modelMap = new ModelMap();

        cmpyVO.setUserId(CmsSessionUtils.getUserId());
        String rtn = mypageService.insCmpyInfoDo(cmpyVO);

        List<FileVO> list;
        try {
            list = EgovFileUpload.fileUploads(request, this.path); // ?????? ?????????
            if (list.size() > 0) {
                this.fileService.insFileDo(list, cmpyVO.getCmpyId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if ("1".equals(rtn)) {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
        } else {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
        }

        return modelMap;
    }

    @RequestMapping(path = "insCmpyInfoDo.ax")
    public ModelMap insCmpyInfoDo(CmpyVO cmpyVO, ModelMap model) {
        String rtn = mypageService.insCmpyInfoDo(cmpyVO);

        ModelMap modelMap = new ModelMap();
        if ("insert".equals(rtn) || "update".equals(rtn)) {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common." + rtn));
        } else {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
        }

        return modelMap;
    }

    @RequestMapping(path = "loginInfo.bt")
    public String loginInfo(SrchVO srchVO
                ,@ModelAttribute("saveFm") UserVO userVO
                ,@ModelAttribute("emailFm") UserVO emailuserVO
                ,ModelMap model) {

        srchVO.setSrchMappingType("usr");
        srchVO.setSrchUserId(CmsSessionUtils.getUserId());
        model.put("authLst",  mypageService.getMappingLst(srchVO));
        return commUtils.tiles(commUtils.TILES_FRNT, "mypage/loginInfo");
    }

    @RequestMapping(path = "passChgSubmitDo.ax")
    @ResponseBody
    public ModelMap passChgSubmitDo(SrchVO srchVO, @ModelAttribute("saveFm") UserVO userVO, ModelMap model) {
        ModelMap modelMap = new ModelMap();

        String rtn ="";

        if( userVO.getChgPassWdChk().equals(userVO.getChgPassWd())) {
            userVO.setUserId(CmsSessionUtils.getUserId());
            userVO.setUserPassword(SHA256EncryptUtil.getSHA256(userVO.getChgPassWd()));
            rtn = mypageService.uptPasswordDo(userVO);
        }

        if ("1".equals(rtn)) {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
        } else {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
        }

        return modelMap;
    }




    @RequestMapping(path = "/emailChgDo.ax")
    @ResponseBody
    public ModelMap findIdPwDo(UserVO vo,HttpSession session) throws IOException {
        ModelMap modelMap = new ModelMap();

        if(vo.getEmail() != CmsSessionUtils.getUserInfo().getEmail()) {


        try {

            UserVO userVO = mypageService.getUserDtl(vo);

            UserVO emailUserVO = mypageService.getUserEmailDtl(vo);



            if (userVO != null && emailUserVO == null) {
                MailVO mailVO = new MailVO();
                userVO.setRtnVal(CryptoUtils.createChkKey(userVO.getEmail()+""));
                userVO.setEmail(vo.getEmail());

                mailVO.setRtnVal(userVO.getRtnVal());
                mailVO.setTo(vo.getEmail() + "");
                mailVO.setLang(LocaleContextHolder.getLocale() + "");
                cmsMailUtil.sendMailCertify(mailVO); // 1?????? ??????
                mypageService.uptEmailDo(userVO);



                modelMap.put("msg", this.egovMessageSource.getMessage("web.sending"));
                modelMap.put("code", "0000");
            } else {
                modelMap.put("msg", this.egovMessageSource.getMessage("success.common.fail"));
                modelMap.put("code", "9999");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        }else {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.fail"));
            modelMap.put("code", "9999");
        }
        return modelMap;// success";
    }

    @RequestMapping(path = "/udtConnectAuthDo.ax")
    @ResponseBody
    public ModelMap udtConnectAuthDo(MappingVO vo) throws IOException {

        ModelMap modelMap = new ModelMap();

        String rtn = mypageService.udtConnectAuthDo(vo);

        if ("1".equals(rtn)) {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
        } else {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
        }
        return modelMap;// success";
    }

    @RequestMapping(path = "/udtCmpyMvUrlSubmit.ax")
    @ResponseBody
    public ModelMap udtCmpyMvUrlSubmit(CmpyVO vo, SessionUserVO sessionUserVO,HttpSession session) throws IOException {

        ModelMap modelMap = new ModelMap();

        String rtn = mypageService.udtCmpyMvUrlSubmit(vo);

        if ("1".equals(rtn)) {

            sessionUserVO.setLoginId(CmsSessionUtils.getUserInfo().getEmail());
            sessionUserVO = lgnService.getLoginDtl(sessionUserVO);

            session.setAttribute(SessionTypeEnum._sessionKey.toString(), sessionUserVO);

            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
        } else {
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
        }
        return modelMap;// success";
    }





    @RequestMapping(path = "payInfo.bt")
    public String payInfo(SrchVO srchVO, @ModelAttribute("saveFm") UserVO UserVO, ModelMap model) {
        return commUtils.tiles(commUtils.TILES_FRNT, "mypage/payInfo");
    }

    @RequestMapping(path = "insPayInfoDo.ax")
    public String insPayInfoDo(SrchVO srchVO, @ModelAttribute("saveFm") UserVO UserVO, ModelMap model) {
        return commUtils.tiles(commUtils.TILES_FRNT, "mypage/payInfo");
    }

    private void setSessionContextFactory(SessionUserVO sessionUserVO, HttpSession session) {
        session.invalidate();
        SessionContext sessionContext = (SessionContext) this.sessionContextFactory.getObject();
        sessionContext.setAuthenticated(true);
        sessionContext.setSessionUserVO(sessionUserVO);
        session.setAttribute(SessionTypeEnum._siteChk.toString(), "frnt");
        session.setAttribute(SessionTypeEnum._logInChk.toString(), true);
        session.setAttribute(SessionTypeEnum._sessionKey.toString(), sessionUserVO);
        // session.setAttribute(SessionTypeEnum._loginTime.toString(), this.lgnService.getLastLoginTime(CmsSessionUtils.getId()));
    }

}