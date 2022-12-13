package net.app.front.brand;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egov.cmm.EgovFileUpload;
import egov.cmm.EgovMessageSource;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.file.service.FileService;
import net.app.file.vo.FileVO;
import net.app.front.brand.product.service.ProductService;
import net.app.front.brand.product.vo.ProductVO;
import net.app.front.buyer.service.BuyerService;
import net.app.front.mypage.service.MypageService;
import net.app.front.mypage.vo.CmpyVO;
import net.app.lgn.enu.SessionTypeEnum;
import net.app.lgn.service.LgnService;
import net.app.lgn.util.FrntSessionUtils;
import net.app.lgn.vo.SessionContext;
import net.app.lgn.vo.SessionUserVO;
import net.app.vo.SrchVO;
import net.base.web.CommUtils;

@Controller
@RequestMapping(path = "web/brandN/")
public class BrandController {


    @Resource(name = "sessionContextFactory")
    private ObjectFactory<?> sessionContextFactory;


    @Resource(name = "commUtils")
    private CommUtils commUtils;

    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    @Resource(name = "fileService")
    private FileService fileService;

    @Resource(name = "productService")
    private ProductService productService;

    @Resource(name = "mypageService")
    private MypageService mypageService;

    @Resource(name = "lgnService")
    private LgnService lgnService;

    @Resource(name = "buyerService")
    private BuyerService buyerService;

    String path = "tiles/pages/frnt/";



    @RequestMapping(path = "buyerLst.bt")
    public String buyerLst(@ModelAttribute("srchFm") SrchVO srchVO, ModelMap model) {

        srchVO.setSrchUserType("002"); // buyer
        List<EgovMap> eMap = this.buyerService.getBuyerPageLst(srchVO);
        srchVO.setTotalRecordCount(eMap.size() > 0 ? Integer.parseInt(eMap.get(0).get("totCnt") + "") : 0);
        model.addAttribute("srchLst", eMap);

        return commUtils.tiles(commUtils.TILES_FRNT, "brand/buyer/brandNbuyerLst");
    }

    @RequestMapping(path = "buyerLst.ax")
    public String buyerLstAx(SrchVO srchVO, ModelMap model) {
        srchVO.setSrchUserType("002"); // buyer
        System.out.println("srchVO.getCurrentPageNo()="+srchVO.getCurrentPageNo());

        model.addAttribute("srchLst", this.buyerService.getBuyerPageLst(srchVO));
        return path+"/brand/buyer/brandNbuyerLstAx";
    }


    @RequestMapping(path = "manage.bt")
    public String manage(@ModelAttribute("srchFm") SrchVO srchVO, ModelMap model,ProductVO productVO) {
        productVO.setRegtId(FrntSessionUtils.getUserId());
        model.addAttribute("productLatest", productService.getProductLatestDtl(productVO));

        srchVO.setSrchUserType("002"); // buyer
        List<EgovMap> eMap = this.mypageService.getCmpyPageLst(srchVO);
        srchVO.setTotalRecordCount(eMap.size() > 0 ? Integer.parseInt(eMap.get(0).get("totCnt") + "") : 0);
        model.addAttribute("srchLst", eMap);

        return commUtils.tiles(commUtils.TILES_FRNT, "brand/manage");
    }


    @RequestMapping(path = "/imgUpload.ax")
    @ResponseBody
    public ModelMap cmpyInfoSubmitDo(MultipartHttpServletRequest request, CmpyVO cmpyVO, ModelMap model,SessionUserVO sessionUserVO, HttpSession session) {

        ModelMap modelMap = new ModelMap();

        List<FileVO> list;
        try {
            list = EgovFileUpload.fileUploads(request, this.path); // 파일 업로드
            if (list.size() > 0) {
                this.fileService.insFileDo(list, FrntSessionUtils.getUserInfo().getCmpyId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        sessionUserVO.setLoginId(FrntSessionUtils.getUserInfo().getUserId());
        sessionUserVO = this.lgnService.getLoginDtl(sessionUserVO);

        if (sessionUserVO != null) {
            session.setAttribute(SessionTypeEnum._sessionKey.toString(), sessionUserVO);
//            this.setSessionContextFactory(sessionUserVO, session);
        }


        return modelMap;
    }


    private void setSessionContextFactory(SessionUserVO sessionUserVO, HttpSession session) {
        session.invalidate();

        SessionContext sessionContext = (SessionContext) this.sessionContextFactory.getObject();
        sessionContext.setAuthenticated(true);
        sessionContext.setSessionUserVO(sessionUserVO);
        session.setAttribute(SessionTypeEnum._siteChk.toString(), "frnt");
        session.setAttribute(SessionTypeEnum._logInChk.toString(), true);
        session.setAttribute(SessionTypeEnum._sessionKey.toString(), sessionUserVO);
//        session.setAttribute(SessionTypeEnum._loginTime.toString(), this.lgnService.getLastLoginTime(FrntSessionUtils.getId()));
    }



}