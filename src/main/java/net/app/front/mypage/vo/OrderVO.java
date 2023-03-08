package net.app.front.mypage.vo;

import lombok.Data;

@Data
public class OrderVO {
    private String customerId;
    private String customerCode;
    private String productId;
    private String productCode;
    private String priceId;
    private String priceCode;
    private String orderCode;

}