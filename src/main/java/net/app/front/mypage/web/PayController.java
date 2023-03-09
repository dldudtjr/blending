package net.app.front.mypage.web;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.app.front.mypage.service.MypageService;
import net.app.front.mypage.vo.PayVO;
import net.app.lgn.util.FrntSessionUtils;
import net.app.steppay.StepPay;
import net.base.web.CommUtils;

@Controller
@RequestMapping(path = "web/mypage/")
public class PayController {

    @Resource(name = "sessionContextFactory")
    private ObjectFactory<?> sessionContextFactory;

    @Autowired
    private StepPay stepPay;

    @Autowired
    private MypageService mypageService;


    @Resource(name = "commUtils")
    private CommUtils commUtils;


    String path = "tiles/pages/frnt/mypage";


    @RequestMapping(path = "appServiceInsDo.ax")
    @ResponseBody
    public ModelMap appServiceInsDo(PayVO payVO, HttpSession session) {
        ModelMap modelMap = new ModelMap();
        try {
            String orderCode = stepPay.getOrderPrice(payVO.getServicePrice(), payVO.getPriceCode());
            modelMap.addAttribute("msg", orderCode);
            modelMap.addAttribute("loginId", FrntSessionUtils.getUserInfo().getEmail());
            payVO.setOrderCode(orderCode);
//            mypageService.insPayInfoDo(payVO);
        } catch (IOException | InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        session.setAttribute("payVO", payVO);
        return modelMap;
    }

    @RequestMapping(path = "success.bt")
    public String successPayment( @ModelAttribute("saveFm") PayVO  payVO, Model model, HttpSession session) throws Exception {



        PayVO vo  = (PayVO) session.getAttribute("payVO");
        vo.setUserId(FrntSessionUtils.getUserInfo().getUserId());

        if(!"".equals(vo.getPrvPriceCode()) && vo.getPrvPriceCode() != null && !vo.getPriceCode().equals(vo.getPrvPriceCode())) {
            stepPay.changeProduct(vo); // 모둔 결제 취소
            vo.setPrvServiceEdDt("");
        }

        mypageService.insPayInfoDo(vo);
        session.removeAttribute("payVO");

        return "redirect:/web/mypage/paySuccess.bt";
    }



    @RequestMapping(path = "cancelOrder.ax")
    @ResponseBody
    public ModelMap cancelOrder(PayVO payVO, Model model, HttpSession session) {
        ModelMap modelMap = new ModelMap();
        try {
            String orderCode = stepPay.cancelOrderOnce(payVO.getServicePrice(), payVO.getOrderCode());
            payVO.setOrderCode(orderCode);
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        session.setAttribute("payVO", payVO);
        return modelMap;
    }

    @RequestMapping(path = "paySuccess.bt")
    public String paySuccess( @ModelAttribute("saveFm") PayVO vo,HttpSession session,ModelMap model) {
        vo.setUserId(FrntSessionUtils.getUserInfo().getUserId());
        PayVO payVO = mypageService.getPayInfo(vo);
        if(payVO !=  null ){
//            System.out.println(">>>>>>"+payVO.getUserId());
            model.addAttribute("msg", "결제 되었습니다. ");
            model.addAttribute("saveFm", payVO);
        }else {
            model.addAttribute("saveFm", vo);
        }
        return commUtils.tiles(commUtils.TILES_FRNT, "mypage/payInfo");
    }


    @RequestMapping(path = "error.bt")
    public String errorPayment( @ModelAttribute("saveFm") PayVO  vo,HttpSession session,ModelMap model) {
        session.removeAttribute("payVO");

        ModelMap modelMap = new ModelMap();
        vo.setUserId(FrntSessionUtils.getUserInfo().getUserId());

        PayVO payVO = mypageService.getPayInfo(vo);
        if(payVO !=  null ){
            model.addAttribute("saveFm", payVO);
        }else {
            vo.setPriceCode("active");
            vo.setPriceCodeTxt("Free");

            model.addAttribute("saveFm", vo);
        }
        model.put("msg", "결제 도중 에러가 발생했습니다. ");
        return commUtils.tiles(commUtils.TILES_FRNT, "mypage/payInfo");
    }

    @RequestMapping(path = "cancel.bt")
    public String cancelPayment( @ModelAttribute("saveFm") PayVO  vo,HttpSession session,ModelMap model) {
        session.removeAttribute("payVO");
        vo.setUserId(FrntSessionUtils.getUserInfo().getUserId());

        PayVO payVO = mypageService.getPayInfo(vo);

        if(payVO !=  null ){
            model.addAttribute("saveFm", payVO);
        }else {
            vo.setPriceCode("active");
            vo.setPriceCodeTxt("Free");
            model.addAttribute("saveFm", vo);
        }
//        model.addAttribute("msg", "결제를 취소했습니다. ");
        return commUtils.tiles(commUtils.TILES_FRNT, "mypage/payInfo");
    }

}