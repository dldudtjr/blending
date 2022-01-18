package net.base.cmm.pageRenderer;

import java.text.MessageFormat;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class CmsPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {

    private ServletContext servletContext;

    public CmsPaginationRenderer() {
    }

    public void initVariables() {

        firstPageLabel = new StringBuilder().append("<div id='pageDiv' class=\"col-md-12\" style=\"text-align: center;\">\n") //
                .append("\t<div class=\"paging\">\n").append("\t<ul class=\"pagingMake\">\n").append("<li class=\"paging_nonbar\"><a href='javascript:' onclick=\"{0}({1});return false;\">").append(servletContext.getContextPath())
                .append("\t<img src=\"/files/cmsm/images/main/first_list.png\" alt=\"처음 리스트로\" /></a></li>\n").toString();

        previousPageLabel = new StringBuilder().append("\t\t<li class=\"paging_nonbar\"><a href='javascript:' onclick=\"{0}({1});return false;\">").append(servletContext.getContextPath()).append("\t<img src=\"/files/cmsm/images/main/pre_list.png\" alt=\"이전 리스트로\" /></a></li>\n").toString(); // '").append(servletContext).append("'/files/
        currentPageLabel = new StringBuilder().append("\t\t<li class='on'><a href='#' class='on' onclick=\"return false;\">{0}</a></li>\n").toString();
        otherPageLabel = new StringBuilder().append("\t\t<li class='active'><a href='#' class='active' onclick=\"{0}({1});return false;\">{1}</a></li>").toString();

        nextPageLabel = new StringBuilder().append("\t\t<li class=\"paging_nonbar\"><a href='#' onclick=\"{0}({1});return false;\">").append(servletContext.getContextPath()).append("\t<img src=\"/files/cmsm/images/main/next_list.png\" alt=\"다음 리스트로\" /></a></li>\n").toString();
        lastPageLabel = new StringBuilder().append("\t\t<li class=\"paging_nonbar\"><a href='#' onclick=\"{0}({1});return false;\">").append(servletContext.getContextPath()).append("\t<img src=\"/files/cmsm/images/main/last_list.png\" alt=\"마지막 리스트로\" /></a></li>\n") //

                .append("\t</ul>\n") // 1n-group end

                .append("\t<div class='list_num'>\n") // 1n-group end
                .append("\t<p>\n") // 1n-group end
//                .append("\t<label for='list_num_set'>한 쪽당</label>\n") // 1n-group                                                                      // end
//                .append("\t<select id=\"list_num_set\">\n") // 1n-group end
//                .append("\t<option value='20'>20</option>\n") // 1n-group end
//                .append("\t<option value='50'>50</option>\n") // 1n-group end
//                .append("\t<option value='100'>100</option>\n") // 1n-group                                                                // end
//                .append("\t<option value='150'>150</option>\n") // 1n-group end
//                .append("\t<option value='200'>200</option>\n") // 1n-group end
//                .append("\t</select>\n") // 1n-group end
//                .append("\t건</p>\n") // 1n-group end
                .append("\t</div>\n") // 1n-group end
                .append("\t</div>\n") // 1n-group end
                .append("</div>\n").toString();
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
        initVariables();
    }

    public String renderPagination(PaginationInfo paginationInfo, String jsFunction) {
        StringBuffer strBuff = new StringBuffer();

        int firstPageNo = paginationInfo.getFirstPageNo();
        int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
        int totalPageCount = paginationInfo.getTotalPageCount();
        int pageSize = paginationInfo.getPageSize();
        int lastPageNoOnPageList = paginationInfo.getLastPageNoOnPageList();
        int currentPageNo = paginationInfo.getCurrentPageNo();
        int lastPageNo = paginationInfo.getLastPageNo();

        // if (totalPageCount > pageSize) {
        if (firstPageNoOnPageList > pageSize) {
            strBuff.append(MessageFormat.format(this.firstPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
            strBuff.append(MessageFormat.format(this.previousPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNoOnPageList - 1) }));
        } else {
            strBuff.append(MessageFormat.format(this.firstPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
            strBuff.append(MessageFormat.format(this.previousPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
        }
        // }

        for (int i = firstPageNoOnPageList; i <= lastPageNoOnPageList; ++i) {
            if (i == currentPageNo) strBuff.append(MessageFormat.format(this.currentPageLabel, new Object[] { Integer.toString(i) }));
            else {
                strBuff.append(MessageFormat.format(this.otherPageLabel, new Object[] { jsFunction, Integer.toString(i), Integer.toString(i) }));
            }
        }

        // if (totalPageCount > pageSize) {
        if (lastPageNoOnPageList < totalPageCount) {
            strBuff.append(MessageFormat.format(this.nextPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNoOnPageList + pageSize) }));
            strBuff.append(MessageFormat.format(this.lastPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
        } else {
            strBuff.append(MessageFormat.format(this.nextPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
            strBuff.append(MessageFormat.format(this.lastPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
        }
        // }

        return strBuff.toString();
    }

}
