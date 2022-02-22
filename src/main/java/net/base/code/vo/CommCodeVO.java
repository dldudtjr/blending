package net.base.code.vo;

import lombok.Data;

@Data
public class CommCodeVO  {

    private String commCode;
    private String cmmnGroupCode;
    private String cmpyNo;
    private String commCodeNm;
    private String commCodeNmEn;
    private String cropsSpchcknCode;
    private String sysSpchcknCode;

    private String sortSn;
    private String rm;
    private String useYn;
    private String tmpCommCode;
    private String tmpCmmnGroupCode;

    private String[] commCodeArr;
    private String[] cmmnGroupCodeArr;
    private String[] commCodeNmArr;
    private String[] sortSnArr;
    private String[] rmArr;
    private String[] useYnArr;

    private String rowStatus;

}