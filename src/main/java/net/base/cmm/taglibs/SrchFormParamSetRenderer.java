package net.base.cmm.taglibs;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import net.base.cmm.vo.PaginationInfoVO;
import net.base.utl.htm.SrchParamUtil;

public class SrchFormParamSetRenderer extends TagSupport {
    private static final long serialVersionUID = 1L;

    private PaginationInfoVO paginationInfoVO;

    private String formname = "srchFm";

    private String action;

    private String method = "post";

    public int doEndTag() throws JspException {
        try {

            JspWriter out = this.pageContext.getOut();

            StringBuilder srchFormString = new StringBuilder();
            srchFormString.append("<form ");
            srchFormString.append("id=\"").append(formname).append("\" ");
            srchFormString.append("action=\"").append(action).append("\" ");
            srchFormString.append("method=\"").append(method).append("\" ");
            srchFormString.append(">");
            srchFormString.append(SrchParamUtil.makeInputTag(paginationInfoVO));
            srchFormString.append("</form>");

            out.println(srchFormString.toString());

            return 6;
        } catch (IOException e) {
            throw new JspException();
        }
    }

    public void setFormname(String formname) {
        this.formname = formname;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public void setPaginationInfoVO(PaginationInfoVO paginationInfoVO) {
        this.paginationInfoVO = paginationInfoVO;
    }

}