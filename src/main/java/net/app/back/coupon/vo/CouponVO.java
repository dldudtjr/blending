package net.app.back.coupon.vo;

import lombok.Data;

@Data
public class CouponVO {
    private String couponId = "";
    private String couponCode;
    private String couponStDt;
    private String couponEdDt;
    private String discount;
    private String type;
    private String useYn = "Y";
    private String registDt;
    private String registId;
    private String updtDt;
    private String updtId;
    
    private String userId;
}