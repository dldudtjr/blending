package net.app.lgn.enu;

public enum AuthTypeEnum{

     SUPER_ADMIN("99")
    ,ADMIN("02")
    ,USER("01")
    ,DELIVERY("03"); // 배송기

    final private String code;

    private AuthTypeEnum(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
