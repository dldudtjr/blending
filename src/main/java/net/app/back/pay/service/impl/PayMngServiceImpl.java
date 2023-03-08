package net.app.back.pay.service.impl;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egov.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.back.pay.service.PayMngService;
import net.app.front.mypage.vo.PayVO;
import net.app.steppay.StepPay;
import net.app.vo.SrchVO;

@Service("payMngService")
public class PayMngServiceImpl extends EgovAbstractServiceImpl implements PayMngService {


    @Autowired
    private StepPay stepPay;

    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;


    @Resource(name = "payMngDAO")
    private PayMngDAO payMngDAO;


    @Override
    public List<EgovMap> getPayPageLst(SrchVO vo) {
        return this.payMngDAO.getPayPageLst(vo);
    }

    @Override
    public String cancelPayDo(PayVO vo) {
        String rtn="";
        try {

            PayVO refundVO = payMngDAO.getPaRemainInfo(vo);
            String msg = stepPay.cancelOrderOnce(refundVO.getRefundPrice(), refundVO.getOrderCode());
            if(msg != "" && !"".equals(msg)) {
                rtn = this.payMngDAO.cancelPayDo(vo);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return rtn;
    }





}