package egov.cmm;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.MessageSourceAccessor;

public class EgovMessageSourceExt {
    private static MessageSourceAccessor msAcc = null;

    public void setMessageSourceAccessor(MessageSourceAccessor msAcc) {
        EgovMessageSourceExt.msAcc = msAcc;
    }

    public static String getMessage(String code) {
        return msAcc.getMessage(code, LocaleContextHolder.getLocale());
    }

    public static String getMessage(String code, Object[] objs) {
        return msAcc.getMessage(code, objs, LocaleContextHolder.getLocale());
    }
}
