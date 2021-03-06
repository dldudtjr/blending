package net.app.file.vo;

import lombok.Data;
import net.app.lgn.util.CmsSessionUtils;

@Data
public class FileVO {

    private String saveFilePath;
    private String changeFileNm;
    private String uploadFileNm;

    private String nttId;
    private String bbsId;

    private String fileId;
    private String fileSz;
    private String parntsDtaId;
    private String[] parntsDtaIdArr;
    private String realFileNm;
    private String useYn ="Y";
    // private String path; // 호출하는 화면의 패스 content일경우

    private String regtId = CmsSessionUtils.getUserId();
    private String regtDt;
    private String updtId     = CmsSessionUtils.getUserId();
    private String updtDt;

}