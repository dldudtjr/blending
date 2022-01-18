package net.app.lgn.enu;

public enum LoginHistEnum {

    LogIn("001"), logOut("002"), LogInFail("003");

    final private String code;

    private LoginHistEnum(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

}