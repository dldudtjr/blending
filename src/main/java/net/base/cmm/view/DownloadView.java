package net.base.cmm.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
    public DownloadView() {
        setContentType("applicaiton/download;charset=utf-8");
    }

    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        @SuppressWarnings("unchecked")
        Map<String, Object> map = (Map<String, Object>) model.get("downloadView");
        String path = map.get("path") + "";
        String edtNm = map.get("edtNm") + "";

        File file = new File(path.replaceAll("\\\\", "/") + "" + edtNm);

        response.setContentType(getContentType());
        response.setContentLength((int) file.length());

        String fileName = URLEncoder.encode(map.get("orgNm") + "", "UTF-8");

        response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");

        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fis != null) try {
                fis.close();
            } catch (Exception localException2) {
            }
        }
        out.flush();
    }

    /*
    private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) {
        String browser = getBrowser(request);

        String dispositionPrefix = "attachment; filename=";
        String encodedFilename = null;
        try {
            if (browser.equals("MSIE")) {

                encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

            } else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
                encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
            } else if (browser.equals("Firefox")) {
                encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
            } else if (browser.equals("Opera")) {
                encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
            } else if (browser.equals("Chrome")) {
                StringBuffer sb = new StringBuffer();
                for (int i = 0; i < filename.length(); i++) {
                    char c = filename.charAt(i);
                    if (c > '~') {
                        sb.append(URLEncoder.encode("" + c, "UTF-8"));
                    } else {
                        sb.append(c);
                    }
                }
                encodedFilename = sb.toString();
            }
        } catch (UnsupportedEncodingException e) {
            EgovBasicLogger.ignore(this.getClass() + " excelToArray >> Occurred Exception to close resource is ignored!! message : " + e);
        }

        response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

        if ("Opera".equals(browser)) {
            response.setContentType("application/octet-stream;charset=UTF-8");
        }
    }


    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
            return "Trident";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        return "Firefox";
    }
    */
}