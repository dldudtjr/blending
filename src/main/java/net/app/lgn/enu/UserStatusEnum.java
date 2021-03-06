package net.app.lgn.enu;

public enum UserStatusEnum{

     REG("001")
    ,USE("002")
    ,DEL("003")
    ,Y("Y")
    ,N("N")
    ,INTRODUCE("001")
    ,DETAIL("002")
    ,DISTRIBUTTION("003")
    ,MAKETING("004")
    ;

    final private String code;

    private UserStatusEnum(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
