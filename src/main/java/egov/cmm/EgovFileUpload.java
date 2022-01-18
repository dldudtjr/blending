package egov.cmm;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.api.client.util.Base64;
import com.ibm.icu.text.SimpleDateFormat;

import egov.cmm.service.EgovProperties;
import egov.cmm.util.EgovBasicLogger;
import net.app.file.vo.FileVO;

public class EgovFileUpload {

    @Resource(name = "egovMessageSource")
    protected static EgovMessageSource egovMessageSource;

    public static List<FileVO> fileUploads(HttpServletRequest requestX, String path) {
        MultipartHttpServletRequest request = (MultipartHttpServletRequest) requestX;
        List<FileVO> list = new ArrayList<FileVO>();
        if (request != null) {
            Iterator<String> iter = request.getFileNames();

            String extensionProp = "upload.file.extension";
            String uploadPathProp = "real.upload.file.path";

            if (requestX.getRequestURL().indexOf("localhost") > -1 || requestX.getRequestURL().indexOf("127.0.0.1") > -1 || requestX.getRequestURL().indexOf("192.168") > -1) {
                uploadPathProp = "dev.upload.file.path";
            }

            if ("bbs".equals(path)) {
                if ((requestX.getParameter("bbsTyCode") != null) && "photo".equals(requestX.getParameter("bbsTyCode"))) {
                    extensionProp = "upload.file.extension.img";
                    if (requestX.getRequestURL().indexOf("localhost") > -1 || requestX.getRequestURL().indexOf("127.0.0.1") > -1 || requestX.getRequestURL().indexOf("192.168") > -1) {
                        uploadPathProp = "dev.upload.img.path";
                    }

                }
            }

            while (iter.hasNext()) {

                FileVO fileVO = new FileVO();
                String uploadFileName = iter.next();

                MultipartFile mFile = request.getFile(uploadFileName);

                String originalFileName = mFile.getOriginalFilename();

                String orgNm = originalFileName;
                if ((orgNm != null) && (orgNm.trim().length() > 0)) {
                    try {
                        String fileSizeChk = EgovProperties.getProperty("upload.file.size");
                        if (Integer.parseInt(fileSizeChk) < mFile.getSize()) {
                            return list;
                        }

                        String fileName = "";
                        if (mFile.getOriginalFilename() != null) {
                            fileName = new String(mFile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
                        } else {
                            return list;
                        }

                        String extension = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toUpperCase();
                        String extensionAry = EgovProperties.getProperty(extensionProp);
                        boolean extChk = false;
                        for (String ext : extensionAry.split(",")) {
                            if (ext.equals(extension)) {
                                extChk = true;
                                break;
                            }
                        }
                        if (!extChk) {
                            return list;
                        }

                        Date today = new Date();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                        String strToday = sdf.format(today);
                        String[] strTodays = strToday.split("\\/");

                        String realEndPath = EgovProperties.getProperty(uploadPathProp) + path + "/" + strTodays[0] + "/" + strTodays[1] + "/" + strTodays[2] + "/";
                        String edtTime = System.currentTimeMillis() + "";
                        String edtNm = edtTime + "." + extension;

                        fileVO.setChangeFileNm(edtNm);
                        fileVO.setRealFileNm(orgNm);
                        fileVO.setSaveFilePath(realEndPath);
                        fileVO.setUploadFileNm(uploadFileName);

                        System.out.println("uploadFileName >>> " + uploadFileName);

                        // fileVO.setUpdtId(uploadFileName);
                        File desti = new File(realEndPath);
                        if (!desti.exists()) {
                            desti.mkdirs();
                        }

                        File destFile = new File(realEndPath + edtNm);
                        mFile.transferTo(destFile);

                    } catch (IOException | IllegalStateException ignored) {
                        EgovBasicLogger.ignore(" fileMultiUploadDo >> Occurred Exception to close resource is ignored!! : " + ignored);
                    }
                    list.add(fileVO);
                } else {
                    fileVO = new FileVO();
                    fileVO.setUploadFileNm("noFile");
                    list.add(fileVO);
                }

            } // if
        }
        return list;
    }

    public static String fileToBinary(File file) {
        String out = new String();
        FileInputStream fis = null;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        try {
            fis = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            System.out.println("Exception position : FileUtil - fileToString(File file)");
        }

        int len = 0;
        byte[] buf = new byte[1024];
        try {
            while ((len = fis.read(buf)) != -1) {
                baos.write(buf, 0, len);
            }

            byte[] fileArray = baos.toByteArray();
            out = new String(base64Enc(fileArray));

            fis.close();
            baos.close();
        } catch (IOException e) {
            System.out.println("Exception position : FileUtil - fileToString(File file)");
        }

        return out;
    }

    public static byte[] base64Enc(byte[] buffer) {
        return Base64.encodeBase64(buffer);
    }


}