package net.base.cmm.taglibs;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import net.base.cmm.vo.PaginationInfoVO;
import net.base.utl.htm.SrchParamUtil;

public class InputPageParamSetRenderer extends TagSupport {
    private static final long serialVersionUID = 1L;
    
    private PaginationInfoVO paginationInfoVO;
    
    public int doEndTag() throws JspException {
        try {
            
            JspWriter out = this.pageContext.getOut();
            
            StringBuilder srchFormString = new StringBuilder();
            srchFormString.append(SrchParamUtil.makeInputPageTag(paginationInfoVO));
            
            out.println(srchFormString.toString());
            
            return 6;
        } catch (IOException e) {
            throw new JspException();
        }
    }
    
    public void setPaginationInfoVO(PaginationInfoVO paginationInfoVO) {
        this.paginationInfoVO = paginationInfoVO;
    }
    
}