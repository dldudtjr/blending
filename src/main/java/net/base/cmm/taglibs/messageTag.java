package net.base.cmm.taglibs;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.NoSuchMessageException;

import egov.cmm.EgovMessageSourceExt;

public class messageTag extends TagSupport {
    private static final long serialVersionUID = 1L;

    private String code = "";

    private String arguments;

    private static final Logger LOGGER = LoggerFactory.getLogger(messageTag.class);

    public int doEndTag() {
        JspWriter out = this.pageContext.getOut();
        StringBuilder srchFormString = new StringBuilder();

        try {
            if(arguments != null) {
                srchFormString.append(EgovMessageSourceExt.getMessage(code, arguments.split(",")));
            }else {
                srchFormString.append(EgovMessageSourceExt.getMessage(code));
            }

            out.print(srchFormString.toString());

        } catch (NullPointerException e) {
            try {
                out.println(code);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            LOGGER.error("code not found =" + code);
            // e.printStackTrace();
        } catch (NoSuchMessageException e) {
            try {
                out.println(code);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            LOGGER.error("code not found =" + code);
        } catch (IOException e) {
            try {
                out.println(code);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            LOGGER.error("code not found =" + code);
        } finally {

        }
        return 6;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getArguments() {
        return arguments;
    }

    public void setArguments(String arguments) {
        this.arguments = arguments;
    }

}