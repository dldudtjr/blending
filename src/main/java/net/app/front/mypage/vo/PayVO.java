package net.app.front.mypage.vo;

import lombok.Data;
import net.app.vo.SessEtdVO;

@Data
public class PayVO extends SessEtdVO{
    private String serviceId;
    private String userId;
    private int periodUse = 1;
    private int servicePrice = 100000;
    private String serviceStDt;
    private String serviceEdDt;
    private String paymentDt;
    private String refundDt;
    private String orderCode;
    private String priceCode;
    private String status;
    private String registDt;
}