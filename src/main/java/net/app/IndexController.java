package net.app;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.cmm.EgovMessageSource;
import egov.utl.inno.CryptoUtils;
import net.app.front.mypage.service.MypageService;
import net.app.front.mypage.vo.UserVO;
import net.app.lgn.annotation.PassAuth;
import net.base.web.CommUtils;

@PassAuth
@Controller
@RequestMapping(path = "/web/main")
public class IndexController {


    @Resource(name = "sessionContextFactory")
    private ObjectFactory<?> sessionContextFactory;

    @Resource(name = "commUtils")
    private CommUtils commUtils;

    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;


    @Resource(name = "mypageService")
    private MypageService mypageService;


    String path = "tiles/pages/lpsm/road/user";


    @RequestMapping(path = "index.bt")
    public String index() {
        return  "tiles/pages/frnt/index";
    }


    @RequestMapping(path = "main.bt")
    public String main(
            @ModelAttribute("loginFm") UserVO loginVO,
            @ModelAttribute("saveFm") UserVO userVO,
            ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

        String sessKey = CryptoUtils.createChkKey("loginPageA");
        String symtcKey = CryptoUtils.createChkKey("loginPageB");
        req.getSession().setAttribute(sessKey, symtcKey);
        model.addAttribute("_ssesKey", sessKey);
        model.addAttribute("_symtcKey", symtcKey);
        return  "tiles/pages/frnt/main";

    }




}