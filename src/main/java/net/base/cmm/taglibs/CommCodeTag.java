package net.base.cmm.taglibs;

import javax.servlet.jsp.tagext.TagSupport;

public class CommCodeTag extends TagSupport {

    private static final long serialVersionUID = 1L;

    private String code = "";

    public int doEndTag() {
//        JspWriter out = this.pageContext.getOut();
//        try {
//            out.println(JsonObjConvertUtil.listObjToJsonAry(WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext()).getBean(CommCodeService.class).getCacheCodeGrpLst(code)));
//        } catch (BeansException | IOException e) {
//            EgovBasicLogger.ignore("Occurred Exception to close resource is ignored!!");
//        }
        return 6;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}