package net.base.cmm.pageRenderer;

import java.text.MessageFormat;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class LpsPaginationRenderer extends AbstractPaginationRenderer {

    public LpsPaginationRenderer() {

        this.firstPageLabel = "\t\t<a href=\"javascript:void(0);\" onclick=\"{0}({1});return false;\" class=\"page_arrow\"><<</a>\n";
        this.previousPageLabel = "\t\t<a href=\"javascript:void(0);\" onclick=\"{0}({1});return false;\" class=\"page_arrow\"><</a>\n";
        this.currentPageLabel = "\t\t<a href=\"javascript:void(0);\" class=\"acitve\">{0}</a>\n";
        this.otherPageLabel = "\t\t<a href=\"javascript:void(0);\" onclick=\"{0}({1});return false;\">{1}</a>\n";
        this.nextPageLabel = "\t\t<a href=\"javascript:void(0);\" onclick=\"{0}({1});return false;\" class=\"page_arrow\">></a>\n";
        this.lastPageLabel = "\t\t<a href=\"javascript:void(0);\" onclick=\"{0}({1});return false;\" class=\"page_arrow\">>></a>\n";
    }

    @Override
    public String renderPagination(PaginationInfo paginationInfo, String jsFunction) {

        StringBuffer outStr = new StringBuffer();

        int firstPageNo = paginationInfo.getFirstPageNo();
        int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
        int totalPageCount = paginationInfo.getTotalPageCount();
        int pageSize = paginationInfo.getPageSize();
        int lastPageNoOnPageList = paginationInfo.getLastPageNoOnPageList();
        int currentPageNo = paginationInfo.getCurrentPageNo();
        int lastPageNo = paginationInfo.getLastPageNo();

        outStr.append("<div class=\"page\">\n");
        // outStr.append("\t<ul>\n");

        // if (totalPageCount > pageSize) {
        if (firstPageNoOnPageList > pageSize) {
            outStr.append(MessageFormat.format(this.firstPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
            outStr.append(MessageFormat.format(this.previousPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNoOnPageList - 1) }));
        } else {
            outStr.append(MessageFormat.format(this.firstPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
            outStr.append(MessageFormat.format(this.previousPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
        }
        // }

        for (int i = firstPageNoOnPageList; i <= lastPageNoOnPageList; ++i) {
            if (i == currentPageNo) {
                outStr.append(MessageFormat.format(this.currentPageLabel, new Object[] { Integer.toString(i) }));
            } else {
                outStr.append(MessageFormat.format(this.otherPageLabel, new Object[] { jsFunction, Integer.toString(i), Integer.toString(i) }));
            }
        }

        // if (totalPageCount > pageSize) {
        if (lastPageNoOnPageList < totalPageCount) {
            outStr.append(MessageFormat.format(this.nextPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNoOnPageList + pageSize) }));
            outStr.append(MessageFormat.format(this.lastPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
        } else {
            outStr.append(MessageFormat.format(this.nextPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
            outStr.append(MessageFormat.format(this.lastPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
        }
        // }

        // outStr.append("\t</ul>\n");
        outStr.append("</div>\n");
        return outStr.toString();

    }

}
