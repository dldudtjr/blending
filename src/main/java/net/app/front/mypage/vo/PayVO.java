package net.app.front.mypage.vo;

import lombok.Data;
import net.app.vo.SessEtdVO;

@Data
public class PayVO extends SessEtdVO{
    private String  serviceId;
    private String  userId;
    private int     periodUse = 1;

    private String  serviceStDt;
    private String  serviceEdDt;
    private String  paymentDt;
    private int     servicePrice = 100000;

    private String  refundDt;
    private int     refundPrice;

    private String  orderCode;
    private String  priceCode;
    private String  prvPriceCode;
    private String  prvServiceEdDt;

    private String  priceCodeA;
    private String  priceCodeB;
    private String  priceCodeC;
    private String  priceCodeTxt;
    private String  status;
    private String  statusTxt;
    private String  registDt;

    private int serviceRefund;

}