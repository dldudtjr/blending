package net.base.code.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.base.cmm.vo.SrchKeyTxtVO;
import net.base.code.vo.CommCodeVO;
import net.base.code.vo.SrchCmsmVO;

@Repository("commCodeDAO")
public class CommCodeDAO extends EgovComAbstractDAO {

    public List<EgovMap> getCodeLst(SrchCmsmVO srchCmsmVO) {
        return selectList("commCodeDAO.getCodeLst", srchCmsmVO);
    }

    public List<SrchKeyTxtVO> getCodeComboLst(SrchCmsmVO srchCmsmVO) {
        return selectList("commCodeDAO.getCodeComboLst", srchCmsmVO);
    }

    public CommCodeVO getCodeDtl(CommCodeVO commCodeVO) {
        return (CommCodeVO) selectOne("commCodeDAO.getCodeDtl", commCodeVO);
    }

    public String insCodeDo(CommCodeVO commCodeVO) {
        return insert("commCodeDAO.insCodeDo", commCodeVO) + "";
    }

    public String udtCodeDo(CommCodeVO commCodeVO) {
        return update("commCodeDAO.udtCodeDo", commCodeVO) + "";
    }

    public String udtUpperCodeDo(CommCodeVO commCodeVO) {
        return update("commCodeDAO.udtUpperCodeDo", commCodeVO) + "";
    }

    public String delCodeDo(CommCodeVO commCodeVO) {
        return delete("commCodeDAO.delCodeDo", commCodeVO) + "";
    }

    public List<EgovMap> getCommCode(String tmplatSpchcknCode) {
        return selectList("commCodeDAO.getCommCode", tmplatSpchcknCode);
    }

    public String delUpperCodeDo(CommCodeVO commCodeVO) {
        return update("commCodeDAO.delUpperCodeDo", commCodeVO) + "";
    }


}