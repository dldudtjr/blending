package net.app.file.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.cmm.EgovMessageSource;
import egov.cmm.service.EgovProperties;
import egov.cmm.util.EgovBasicLogger;
import egov.cmm.util.EgovResourceCloseHelper;
import net.app.file.service.FileService;
import net.app.file.vo.FileVO;
import net.app.lgn.annotation.PassAuth;

@Controller
@PassAuth
@RequestMapping(path = "/util/")
public class FileController {

    @Resource(name = "fileService")
    private FileService fileService;

    @Resource(name = "egovMessageSource")
    protected EgovMessageSource egovMessageSource;

    @RequestMapping(value = "/fileUploadIns.ax")
    public String fileUploadIns(FileVO fileVO, ModelMap model) throws Exception {
        model.addAttribute("fileLst", this.fileService.getFileLst(fileVO));
        return "tiles/pages/cmsm/help/fileUploadIns";

    }

    @RequestMapping(value = "/contFileUploadIns.ax")
    public String contFileUploadIns() throws Exception {
        /* 파일 업로드폼 호출 */
        return "tiles/pages/cmsm/help/contFileUploadIns";

    }

    @RequestMapping(value = "/fileDownload.ax")
    public void fileDownDo(FileVO fileVO, HttpServletRequest request, HttpServletResponse response) {

        List<FileVO> list = this.fileService.getFileLst(fileVO);
        FileVO vo = list.get(0);
        InputStream in = null;
        OutputStream out = null;
        String mimeType = "application/x-msdownload";

        try {
            String filePath = vo.getSaveFilePath() + "" + vo.getChangeFileNm();
            String cngNmExtension = vo.getChangeFileNm().substring(vo.getChangeFileNm().lastIndexOf(".") + 1, vo.getChangeFileNm().length()).toUpperCase();
            String realNmExtension = vo.getRealFileNm().substring(vo.getRealFileNm().lastIndexOf(".") + 1, vo.getRealFileNm().length()).toUpperCase();

            String extensionAry = EgovProperties.getProperty("upload.file.extension");
            boolean extChk = false;
            for (String ext : extensionAry.split(",")) {
                if (ext.equals(cngNmExtension) && ext.equals(realNmExtension)) {
                    extChk = true;
                }
            }
            if (!extChk) {
                response.setCharacterEncoding("UTF-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter printwriter = response.getWriter();
                printwriter.println("<script>alert('파일을 다운로드 할 수 없습니다.'); history.go(-1);</script>");
                printwriter.flush();
                printwriter.close();
            }

            File uFile = new File(filePath);
            int fSize = (int) uFile.length();
            if (uFile.exists()) {
                response.setContentType(mimeType);
                this.setDisposition(vo.getRealFileNm(), request, response);
                response.setContentLength(fSize);
                in = new BufferedInputStream(new FileInputStream(uFile));
                out = new BufferedOutputStream(response.getOutputStream());
                FileCopyUtils.copy(in, out);
                out.flush();
            } else {
                response.setCharacterEncoding("UTF-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter printwriter = response.getWriter();
                printwriter.println("<script>alert('파일을 다운로드 할 수 없습니다.'); history.go(-1);</script>");
                printwriter.flush();
                printwriter.close();
            }

        } catch (IOException ignored) {
            EgovBasicLogger.ignore(this.getClass() + " fileDownDo >> Occurred Exception to close resource is ignored!! : " + ignored);
        } finally {
            EgovResourceCloseHelper.close(in, out);
        }
    }




    @RequestMapping(value = "/fileDownloadView.ax")
    public void fileDownloadView(FileVO fileVO, HttpServletRequest request, HttpServletResponse response) {

        List<FileVO> list = this.fileService.getFileLst(fileVO);
        FileVO vo = list.get(0);
        InputStream in = null;
        OutputStream out = null;
        String mimeType = "application/x-msdownload";

        try {
            String filePath = vo.getSaveFilePath() + "" + vo.getChangeFileNm();
            String cngNmExtension = vo.getChangeFileNm().substring(vo.getChangeFileNm().lastIndexOf(".") + 1, vo.getChangeFileNm().length()).toUpperCase();
            String realNmExtension = vo.getRealFileNm().substring(vo.getRealFileNm().lastIndexOf(".") + 1, vo.getRealFileNm().length()).toUpperCase();

            String extensionAry = EgovProperties.getProperty("upload.file.extension");
            boolean extChk = false;
            for (String ext : extensionAry.split(",")) {
                if (ext.equals(cngNmExtension) && ext.equals(realNmExtension)) {
                    extChk = true;
                }
            }
            if (!extChk) {
                response.setCharacterEncoding("UTF-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter printwriter = response.getWriter();
                printwriter.println("<script>alert('파일을 다운로드 할 수 없습니다.'); history.go(-1);</script>");
                printwriter.flush();
                printwriter.close();
            }

            File uFile = new File(filePath);
            int fSize = (int) uFile.length();
            if (uFile.exists()) {
                response.setContentType(mimeType);
                this.setDisposition(vo.getRealFileNm(), request, response);
                response.setContentLength(fSize);
                in = new BufferedInputStream(new FileInputStream(uFile));
                out = new BufferedOutputStream(response.getOutputStream());
                FileCopyUtils.copy(in, out);
                out.flush();
            }
        } catch (IOException ignored) {
            EgovBasicLogger.ignore(this.getClass() + " fileDownDo >> Occurred Exception to close resource is ignored!! : " + ignored);
        } finally {
            EgovResourceCloseHelper.close(in, out);
        }
    }


    @RequestMapping(value = "/fileDelete.ax")
    @ResponseBody
    public String fileDelete(FileVO fileVO) throws Exception {
        /* 파일 삭제 호출 */
        int cnt = this.fileService.delFileDo(fileVO);
        if (cnt > 0) {
            return EgovProperties.getProperty("success.common.delete");
        } else {
            return EgovProperties.getProperty("fail.common.delete");
        }
    }

    @RequestMapping(value = "/fileDeletes.ax")
    @ResponseBody
    public ModelMap fileDeletes(FileVO fileVO) throws Exception {
        /* 파일 삭제 호출 */
        String cnt = this.fileService.delFileDo(fileVO) + "";
        ModelMap modelMap = new ModelMap();
        modelMap.put("msg", this.egovMessageSource.getMessage("success.common." + (!"".equals(cnt) ? "delete" : "error")));
        return modelMap;
    }

    private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) {
        String browser = this.getBrowser(request);

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

}