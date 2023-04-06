package net.app.lgn.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egov.cmm.EgovMessageSource;
import egov.utl.inno.CryptoTest;
import egov.utl.inno.CryptoUtils;
import net.app.file.service.FileService;
import net.app.front.mypage.service.MypageService;
import net.app.front.mypage.vo.CmpyVO;
import net.app.front.mypage.vo.UserVO;
import net.app.lgn.annotation.PassAuth;
import net.app.lgn.enu.LoginHistEnum;
import net.app.lgn.enu.SessionTypeEnum;
import net.app.lgn.enu.UserStatusEnum;
import net.app.lgn.service.LgnService;
import net.app.lgn.util.FrntSessionUtils;
import net.app.lgn.vo.LoginHistVO;
import net.app.lgn.vo.SessionContext;
import net.app.lgn.vo.SessionUserVO;
import net.app.steppay.StepPay;
import net.app.vo.MailVO;
import net.app.vo.SrchVO;
import net.base.cmm.CmsMailUtil;
import net.base.utl.fcc.SHA256EncryptUtil;

@Controller
@PassAuth

@RequestMapping(path = "web/lgn")
public class LoginController  {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    @Resource(name = "sessionContextFactory")
    private ObjectFactory<?> sessionContextFactory;

    @Resource(name = "lgnService")
    private LgnService lgnService;

    @Resource(name = "stepPay")
    private StepPay stepPay;



    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;


    @Resource(name = "fileService")
    private FileService fileService;

    @Resource(name = "mypageService")
    private MypageService mypageService;


    @Resource(name = "cmsMailUtil")
    private CmsMailUtil cmsMailUtil;

    @RequestMapping(path = "/{userChkKey}/usrCertUdt.bt")
    @ResponseBody
    public ModelAndView loginDo(@PathVariable("userChkKey") String userChkKey
            , HttpSession session, HttpServletRequest req
            , HttpServletResponse res, ModelMap model
            , UserVO userVO
            , LoginHistVO loginHistVO
            , SessionUserVO sessionUserVO
            , BindingResult bindingResult) {


        ModelMap modelMap = new ModelMap();
        modelMap.put("code", "9999");

        sessionUserVO.setRtnVal(userChkKey);
        sessionUserVO = this.lgnService.getLoginDtl(sessionUserVO);

        if (sessionUserVO != null) {
            this.setSessionContextFactory(sessionUserVO, session);
            this.lgnService.uptUserInfo(sessionUserVO);

        }

        String urls ="/web/brand/productLst.bt";
        if("001".equals(sessionUserVO.getUserType())) {
            urls ="/web/brand/productLst.bt";
        }else {
            urls ="/web/buyer/productLst.bt";
        }
        //        return new ModelAndView("redirect:" + urls"/web/main/main.bt?lang="+loginHistVO.getLocale());
        return new ModelAndView("redirect:" + urls+"?lang="+loginHistVO.getLocale());
    }


    @RequestMapping(path = "loginDo.ax")
    @ResponseBody
    public ModelMap loginDo(@RequestParam(name = "userPassword", defaultValue = "") String userPassword
            , @RequestParam(name = "loginId", defaultValue = "") String loginId
            , @RequestParam(defaultValue = "") String returnPage
            , @RequestParam(name = "sessKey", defaultValue = "") String sessKey
            , HttpSession session, HttpServletRequest req
            //, LoginHistVO loginHistVO
            , HttpServletResponse res, ModelMap model
            , UserVO userVO
            , LoginHistVO loginHistVO
            , SessionUserVO sessionUserVO
            , BindingResult bindingResult) {

        ModelMap modelMap = new ModelMap();
        modelMap.put("code", "9999");

       sessionUserVO = this.lgnService.getLoginDtl(sessionUserVO);

        if (sessionUserVO == null) {
            modelMap.put("msg", this.egovMessageSource.getMessage("fail.common.login"));
            return modelMap;
        } else if ("N".equals(sessionUserVO.getUseYn())) {
            modelMap.put("msg", this.egovMessageSource.getMessage("lgn.common.msgC") + "\r\n" + this.egovMessageSource.getMessage("lgn.common.msgM"));
            return modelMap;
        }

        userPassword = CryptoTest.decrypt(userPassword, req.getSession().getAttribute(sessKey)+"");


        if ((sessionUserVO != null) && !sessionUserVO.getUserPassword().equals(SHA256EncryptUtil.getSHA256(userPassword))) {
            loginHistVO.setUserId(sessionUserVO.getUserId());
            this.loginHistDo(loginHistVO, LoginHistEnum.LogInFail);
//            int failCnt = this.setLoginFailCntPlus(loginId, this.getLoginFailCnt(loginId) + 1);
//            if (failCnt > 2) {
//                this.userService.udtLoginUserStopDo(loginId);
//                modelMap.put("msg", this.egovMessageSource.getMessage("lgn.common.msgA") + "\r\n" + this.egovMessageSource.getMessage("lgn.common.msgM"));
//                return modelMap;
//            } else {
//                // modelMap.put("msg", this.egovMessageSource.getMessage("fail.common.login") + failCnt + "\r\n" + this.egovMessageSource.getMessage("lgn.common.msgM"));
                modelMap.put("msg", this.egovMessageSource.getMessage("fail.common.login"));
                return modelMap;
//            }
        }
        this.loginHistDo(loginHistVO, LoginHistEnum.LogIn);

        this.setSessionContextFactory(sessionUserVO, session);


        modelMap.put("msg", this.egovMessageSource.getMessage("lgn.common.msgD"));
        modelMap.put("code", "0000");
        return modelMap; // 성공했습니다.");
    }





    private void loginHistDo(LoginHistVO loginHistVO, LoginHistEnum loginHistEnum) {
        loginHistVO.setStatus(loginHistEnum.getCode() +"");
        this.lgnService.insLoginHistDo(loginHistVO);
    }

    private void setSessionContextFactory(SessionUserVO sessionUserVO, HttpSession session) {
        SessionContext sessionContext = (SessionContext) this.sessionContextFactory.getObject();
        sessionContext.setAuthenticated(true);
        sessionContext.setSessionUserVO(sessionUserVO);
        session.setAttribute(SessionTypeEnum._siteChk.toString(), "frnt");
        session.setAttribute(SessionTypeEnum._logInChk.toString(), true);
        session.setAttribute(SessionTypeEnum._sessionKey.toString(), sessionUserVO);
//        session.setAttribute(SessionTypeEnum._loginTime.toString(), this.lgnService.getLastLoginTime(CmsSessionUtils.getId()));
    }


    @RequestMapping(path = "/joinSubmitDo.ax")
    @ResponseBody
    public ModelMap joinSubmitDo(
            UserVO userVO
            ,CmpyVO cmpyVO
            ,SrchVO srchVO
            , HttpSession session, HttpServletRequest req
            , SessionUserVO sessionUserVO
            ) throws IOException, InterruptedException {

        ModelMap modelMap = new ModelMap();
        String rtnId  ="";



        UserVO emailUserVO = mypageService.getUserEmailDtl(userVO);
         if(emailUserVO == null) {
            try {
                userVO.setStatus(UserStatusEnum.REG.getCode());
                userVO.setRtnVal(CryptoUtils.createChkKey(userVO.getEmail()+""));
                userVO.setUserPassword(SHA256EncryptUtil.getSHA256(userVO.getPassword()));

                rtnId  = mypageService.insUserCmpyInfoDo(userVO,cmpyVO);


                MailVO mailVO = new MailVO();
                userVO.setEmail(userVO.getEmail());
                mailVO.setRtnVal(userVO.getRtnVal());
                mailVO.setTo(userVO.getEmail() + "");
                mailVO.setLang(LocaleContextHolder.getLocale() + "");
                cmsMailUtil.sendMailCertify(mailVO); // 1건씩 전송

            } catch (UnsupportedEncodingException | GeneralSecurityException e) {
                e.printStackTrace();
            }

            if ("1".equals(rtnId)) {
                modelMap.put("code","0001");
                modelMap.put("msg", this.egovMessageSource.getMessage("success.common.join"));
                stepPay.createUsers(userVO.getFirstNm()+""+userVO.getLastNm(),userVO.getEmail(),telNumber(userVO.getPhone()));

            }else {
                modelMap.put("code","9999");
                modelMap.put("msg", this.egovMessageSource.getMessage("success.common.fail"));
            }
        }else {
            modelMap.put("code","9999");
            modelMap.put("msg", this.egovMessageSource.getMessage("success.common.fail"));
        }

        return modelMap;
    }

    public static String telNumber(String number) {
        // 전화번호 정규표현식으로 제한
        String regEx = "(\\d{2,3})(\\d{3,4})(\\d{4})";
          if(!Pattern.matches(regEx, number)){
              return null;
          }

          // 070일때, 중간자리 3, 마지막자리 3자리 입력일 때 (ex. 070 123 123)
          if(number.substring(0,3).contains("070") && number.length() == 9){
            // 받은 값을 확인하고 싶다면
            System.out.println(number.toString());
            return null;
          }
          // 지역번호가 3자리수일 때, 중간자리 3, 마지막자리 3자리 입력일 때(ex. 031 123 123)
          // 에러남 02-123-1234도 포함이 되기 때문에
          // else if(number.substring(0,3).length() == 3 && number.length() == 9) {
            // 받은 값을 확인하고 싶다면
            //System.out.println(number.toString());
            //return null;
          //}
         return number.replaceAll(regEx, "$1-$2-$3"); // 출력 xxx-xxxx-xxxx
       }


    @RequestMapping(path = "logOut.bt")
    public ModelAndView logOut(LoginHistVO loginHistVO, HttpSession httpSession,HttpServletRequest req, HttpServletResponse res) {
        if (!FrntSessionUtils.getId().equals("")) {
            this.loginHistDo(loginHistVO, LoginHistEnum.logOut);
        }
        httpSession.invalidate();
        return new ModelAndView("redirect:" + "/web/main/index.bt?lang="+loginHistVO.getLocale());
    }


}