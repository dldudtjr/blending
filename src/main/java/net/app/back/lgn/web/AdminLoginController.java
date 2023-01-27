package net.app.back.lgn.web;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egov.cmm.EgovMessageSource;
import egov.utl.inno.CryptoTest;
import egov.utl.inno.CryptoUtils;
import net.app.back.user.service.UserService;
import net.app.file.service.FileService;
import net.app.front.mypage.service.MypageService;
import net.app.front.mypage.vo.UserVO;
import net.app.lgn.annotation.PassAuth;
import net.app.lgn.enu.LoginHistEnum;
import net.app.lgn.enu.SessionTypeEnum;
import net.app.lgn.service.LgnService;
import net.app.lgn.util.CmsSessionUtils;
import net.app.lgn.vo.LoginHistVO;
import net.app.lgn.vo.SessionContext;
import net.app.lgn.vo.SessionUserVO;
import net.base.cmm.CmsMailUtil;
import net.base.utl.fcc.SHA256EncryptUtil;
import net.base.web.CommUtils;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

@Controller
@PassAuth
@RequestMapping(path = "back/lgn")
public class AdminLoginController  {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminLoginController.class);

	@Resource(name = "sessionContextFactory")
	private ObjectFactory<?> sessionContextFactory;

	@Resource(name = "lgnService")
	private LgnService lgnService;


	@Resource(name = "commUtils")
	private CommUtils commUtils;

	@Resource(name = "egovMessageSource")
	private EgovMessageSource egovMessageSource;


	@Resource(name = "fileService")
	private FileService fileService;

   @Resource(name = "userService")
    private UserService userService;




	@Resource(name = "mypageService")
	private MypageService mypageService;


	@Resource(name = "cmsMailUtil")
	private CmsMailUtil cmsMailUtil;


	@RequestMapping(path = "login.bt")
	public String login(HttpSession httpSession,HttpServletRequest req, HttpServletResponse res, ModelMap model) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		String sessKey = CryptoUtils.createChkKey("loginPageA");
			String symtcKey = CryptoUtils.createChkKey("loginPageB");
			req.getSession().setAttribute(sessKey, symtcKey);
			model.addAttribute("_ssesKey", sessKey);
			model.addAttribute("_symtcKey", symtcKey);
		// return commUtils.tiles(commUtils.TILES_BACK, "login");
			return "/tiles/pages/back/login";
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
				modelMap.put("msg", this.egovMessageSource.getMessage("fail.common.login"));
				return modelMap;
		}

		this.setSessionContextFactory(sessionUserVO, session);

		 if (!CmsSessionUtils.getId().equals("")) {
	            this.loginHistDo(loginHistVO, LoginHistEnum.LogIn);
        }


		modelMap.put("msg", this.egovMessageSource.getMessage("lgn.common.msgD"));
		modelMap.put("code", "0000");
		return modelMap; // 성공했습니다.");
	}

	private void setSessionContextFactory(SessionUserVO sessionUserVO, HttpSession session) {
		SessionContext sessionContext = (SessionContext) this.sessionContextFactory.getObject();
		sessionContext.setAuthenticated(true);
		sessionContext.setSessionUserVO(sessionUserVO);
		session.setAttribute(SessionTypeEnum._siteChk.toString(), "frnt");
		session.setAttribute(SessionTypeEnum._logInChk.toString(), true);
		session.setAttribute(SessionTypeEnum._backSessionKey.toString(), sessionUserVO);


	}


	@RequestMapping(path = "udtUserPassDo.ax")
    @ResponseBody
    public ModelMap udtUsertPassDo(UserVO userVO) {
        userVO.setUserPassword(SHA256EncryptUtil.getInitPwd(userVO.getEmail()));
        Cache cache = CacheManager.create().getCache("loginChkCache");
        Element newElement = new Element(userVO.getEmail(), 0);
        cache.put(newElement);

        String rtn = userService.uptPasswordDo(userVO);
        ModelMap modelMap = new ModelMap();
        modelMap.put("msg", "".equals(rtn) ? this.egovMessageSource.getMessage("fail.common.msg") : " 'p'+'email' 로 변경되었습니다. ");
        return modelMap;
    }



    @RequestMapping(path = "udtBuyerViewChgDo.ax")
    @ResponseBody
    public ModelMap udtBuyerViewChgDo(UserVO userVO) {
        String rtn = userService.udtBuyerViewChgDo(userVO);
        ModelMap modelMap = new ModelMap();
        modelMap.put("msg", "".equals(rtn) ? this.egovMessageSource.getMessage("fail.common.msg") : " 'p'+'email' 로 변경되었습니다. ");
        return modelMap;
    }


    @RequestMapping(path = "expireChg.ax")
    @ResponseBody
    public ModelMap expireChg(UserVO userVO) {

        String rtn = userService.expireChg(userVO);
        ModelMap modelMap = new ModelMap();
        modelMap.put("msg", "".equals(rtn) ? this.egovMessageSource.getMessage("fail.common.msg") : " 'p'+'email' 로 변경되었습니다. ");
        return modelMap;
    }


	@RequestMapping(path = "logOut.bt")
	public ModelAndView logOut(LoginHistVO loginHistVO, HttpSession httpSession,HttpServletRequest req, HttpServletResponse res) {
        if (!CmsSessionUtils.getId().equals("")) {
            this.loginHistDo(loginHistVO, LoginHistEnum.logOut);
        }
		httpSession.invalidate();
		return new ModelAndView("redirect:" + "/web/main/index.bt?lang="+loginHistVO.getLocale());
	}

    private void loginHistDo(LoginHistVO loginHistVO, LoginHistEnum loginHistEnum) {
        loginHistVO.setStatus(loginHistEnum.getCode() +"");
        this.lgnService.insLoginHistDo(loginHistVO);
    }

}
