package egov.cmm;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

public class EgovMessageSource extends ReloadableResourceBundleMessageSource implements MessageSource {

    private ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource;

    public void setReloadableResourceBundleMessageSource(ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource) {
        this.reloadableResourceBundleMessageSource = reloadableResourceBundleMessageSource;
    }

    public ReloadableResourceBundleMessageSource getReloadableResourceBundleMessageSource() {
        return reloadableResourceBundleMessageSource;
    }

    public String getMessage(String code) {
        return getReloadableResourceBundleMessageSource().getMessage(code, null, LocaleContextHolder.getLocale());
    }

    public String getMessage(String code, Object[] args) {
        return getReloadableResourceBundleMessageSource().getMessage(code, args, LocaleContextHolder.getLocale());
    }

}