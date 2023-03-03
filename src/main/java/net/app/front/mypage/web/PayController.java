package net.app.front.mypage.web;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.app.front.mypage.service.MypageService;
import net.app.front.mypage.vo.PayVO;
import net.app.lgn.util.FrntSessionUtils;
import net.app.steppay.StepPay;

@Controller
@RequestMapping(path = "web/mypage/")
public class PayController {

    @Resource(name = "sessionContextFactory")
    private ObjectFactory<?> sessionContextFactory;

    @Autowired
    private StepPay stepPay;

    @Autowired
    private MypageService mypageService;


    String path = "tiles/pages/frnt/mypage";


    @RequestMapping(path = "appServiceInsDo.ax")
    @ResponseBody
    public ModelMap appServiceInsDo(PayVO payVO, Model model, HttpSession session) {

        ModelMap modelMap = new ModelMap();

        try {
            System.out.println(">>>>FrntSessionUtils.getUserInfo().getEmail()"+FrntSessionUtils.getUserInfo().getEmail());
            String customerCode = stepPay.getCustomers(FrntSessionUtils.getUserInfo().getEmail());
            payVO.setServicePrice(1000);
            payVO.setPriceCode("001");
            payVO.setPeriodUse(3);

            String priceCode = stepPay.createPricePlan(payVO.getServicePrice(), payVO.getPriceCode(), payVO.getPriceCode() +"",payVO.getPeriodUse());

            System.out.println(">>>>customerCode="+customerCode);
            System.out.println(">>>>priceCode="+priceCode);

            String orderCode = stepPay.getOrders(customerCode, priceCode);

            System.out.println(">>>>orderCode="+orderCode);

            modelMap.addAttribute("msg", orderCode);
            modelMap.addAttribute("loginId", FrntSessionUtils.getUserInfo().getEmail());
            payVO.setOrderCode(orderCode);
        } catch (IOException | InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        session.setAttribute("payVO", payVO);
        return modelMap;

    }




    @RequestMapping(path = "success")
    public String successPayment(PayVO payVO, Model model, HttpSession session) throws Exception {
        PayVO vo  = (PayVO) session.getAttribute("payVO");
        vo.setUserId(FrntSessionUtils.getUserInfo().getUserId());
        String rtn = mypageService.insPayInfoDo(vo);
        session.removeAttribute("payVO");
        return "paySuccess";
    }

    @RequestMapping(path = "error")
    public String errorPayment(HttpSession session) {
        return "error";
    }

    @RequestMapping(path = "cancel")
    public String cancelPayment(HttpSession session) {
        return "cancel";
    }

}