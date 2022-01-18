package net.app.lgn.vo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Scope(value = "session")
@Component("sessionContext")
public class SessionContext {

    private boolean authenticated;

    private SessionUserVO sessionUserVO;

    public boolean isAuthenticated() {
        return authenticated;
    }

    public void setAuthenticated(boolean authenticated) {
        this.authenticated = authenticated;
    }

    public SessionUserVO getSessionUserVO() {
        return sessionUserVO;
    }

    public void setSessionUserVO(SessionUserVO sessionUserVO) {
        this.sessionUserVO = sessionUserVO;
    }

}