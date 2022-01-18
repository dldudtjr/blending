package net.app.lgn.enu;

public enum SysEnum {

    INS("001"), UDT("002"), DEL("003");

    final private String code;

    private SysEnum(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

}