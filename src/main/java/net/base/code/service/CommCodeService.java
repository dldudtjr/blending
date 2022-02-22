package net.base.code.service;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.base.cmm.vo.SrchKeyTxtVO;
import net.base.code.vo.CommCodeVO;
import net.base.code.vo.SrchCmsmVO;

public interface CommCodeService {

    List<EgovMap> getCodeLst(SrchCmsmVO srchCmsmVO);

    List<SrchKeyTxtVO> getCodeComboLst(SrchCmsmVO srchCmsmVO);

    List<SrchKeyTxtVO> getCacheCodeGrpLst(String codeGrp);

    HashMap<String,List<SrchKeyTxtVO>> getCacheCodeGrpAllLst(String codeGrp);

    void setCacheCodeGrpLst();

    String getCodeComboLst(String code);

    String iudCommCodeDo(List<CommCodeVO> listVO);


}