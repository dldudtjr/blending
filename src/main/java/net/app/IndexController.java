
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
import net.app.lgn.util.FrntSessionUtils;
import net.base.web.CommUtils;

@PassAuth
@Controller
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

    @RequestMapping(path = {"/web/main/main.bt"})
    public String indexss(
            @ModelAttribute("loginFm") UserVO loginVO,
            @ModelAttribute("saveFm") UserVO userVO,
            ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

        String rtnPage = "redirect:/web/main/index.bt";

        return  rtnPage;

    }

    @RequestMapping(path = {"/web/main/index.bt"})
    public String main(
            @ModelAttribute("loginFm") UserVO loginVO,
            @ModelAttribute("saveFm") UserVO userVO,
            ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

        String sessKey = CryptoUtils.createChkKey("loginPageA");
        String symtcKey = CryptoUtils.createChkKey("loginPageB");
        req.getSession().setAttribute(sessKey, symtcKey);
        model.addAttribute("_ssesKey", sessKey);
        model.addAttribute("_symtcKey", symtcKey);
        String rtnPage = "tiles/pages/frnt/index";
        if (FrntSessionUtils.isLoginChk() && "001".equals(FrntSessionUtils.getUserInfo().getUserType())){
            // rtnPage = "tiles/pages/frnt/brandIndex";
            rtnPage = "redirect:/web/brand/productLst.bt";
        }else if (FrntSessionUtils.isLoginChk() && "002".equals(FrntSessionUtils.getUserInfo().getUserType())){
//            rtnPage = "tiles/pages/frnt/buyerIndex";
            rtnPage = "redirect:/web/buyer/productLst.bt";
        }
        return  rtnPage;
    }


    @RequestMapping(path = {"/web/main/buyerMain.bt"})
    public String buyerMain(
            @ModelAttribute("loginFm") UserVO loginVO,
            @ModelAttribute("saveFm") UserVO userVO,
            ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

        String sessKey = CryptoUtils.createChkKey("loginPageA");
        String symtcKey = CryptoUtils.createChkKey("loginPageB");
        req.getSession().setAttribute(sessKey, symtcKey);
        model.addAttribute("_ssesKey", sessKey);
        model.addAttribute("_symtcKey", symtcKey);
        String rtnPage = "tiles/pages/frnt/buyerIndex";
        return  rtnPage;

    }

    @RequestMapping(path = {"/web/main/brandMain.bt"})
    public String brandMain(
            @ModelAttribute("loginFm") UserVO loginVO,
            @ModelAttribute("saveFm") UserVO userVO,
            ModelMap model, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

        String sessKey = CryptoUtils.createChkKey("loginPageA");
        String symtcKey = CryptoUtils.createChkKey("loginPageB");
        req.getSession().setAttribute(sessKey, symtcKey);
        model.addAttribute("_ssesKey", sessKey);
        model.addAttribute("_symtcKey", symtcKey);
        String rtnPage = "tiles/pages/frnt/brandIndex";
        return  rtnPage;

    }


}