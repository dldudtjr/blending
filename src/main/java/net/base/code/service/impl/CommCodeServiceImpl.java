package net.base.code.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.base.cmm.vo.SrchKeyTxtVO;
import net.base.code.service.CommCodeService;
import net.base.code.vo.CommCodeVO;
import net.base.code.vo.SrchCmsmVO;
import net.base.utl.fcc.JsonObjConvertUtil;

@Service("commCodeService")
public class CommCodeServiceImpl extends EgovAbstractServiceImpl implements CommCodeService {

    @Resource(name = "commCodeDAO")
    private CommCodeDAO commCodeDAO;

    private static final Logger LOGGER = LoggerFactory.getLogger(CommCodeServiceImpl.class);

    @Override
    public List<EgovMap> getCodeLst(SrchCmsmVO srchCmsmVO) {
        return commCodeDAO.getCodeLst(srchCmsmVO);
    }

    @Override
    public List<SrchKeyTxtVO> getCodeComboLst(SrchCmsmVO srchCmsmVO) {
        return commCodeDAO.getCodeComboLst(srchCmsmVO);
    }

    @Override
    @Cacheable(value = "codeGrpCache", key = "#codeGrp")
    public List<SrchKeyTxtVO> getCacheCodeGrpLst(String codeGrp) {
        SrchCmsmVO srchCmsmVO = new SrchCmsmVO();
        srchCmsmVO.setSrchCmmnGroupCode(codeGrp);
        return commCodeDAO.getCodeComboLst(srchCmsmVO);
    };

    @Override
    @Cacheable(value = "codeGrpCache", key = "#codeGrp")
    public HashMap<String, List<SrchKeyTxtVO>> getCacheCodeGrpAllLst(String codeGrp) {
        HashMap<String, List<SrchKeyTxtVO>> newMap = new HashMap<String, List<SrchKeyTxtVO>>();
        SrchCmsmVO srchCmsmVO = new SrchCmsmVO();
        srchCmsmVO.setSrchCmmnGroupCode(codeGrp);
        newMap.put("none", commCodeDAO.getCodeComboLst(srchCmsmVO));

        srchCmsmVO.setSrchCombo("Y");
        newMap.put("Y", commCodeDAO.getCodeComboLst(srchCmsmVO));

        srchCmsmVO.setSrchCombo("S");
        newMap.put("S", commCodeDAO.getCodeComboLst(srchCmsmVO));

        return newMap;
    };

    @Override
    @CacheEvict(value = "codeGrpCache", allEntries = true)
    public void setCacheCodeGrpLst() {
        LOGGER.info("codeGrpCache cache refresh success!");
    };

    @Override
    public String getCodeComboLst(String code) {
        SrchCmsmVO srchCmsmVO = new SrchCmsmVO();
        srchCmsmVO.setSrchCombo("Y");
        srchCmsmVO.setSrchCmmnGroupCode(code);
        return JsonObjConvertUtil.listObjToJsonAry(commCodeDAO.getCodeComboLst(srchCmsmVO));
    }

    @Override
    public String iudCommCodeDo(List<CommCodeVO> listVO) {
        String rtn = "";
        for (CommCodeVO commCodevo : listVO) {
            if ("ins".equals(commCodevo.getRowStatus())) {
                commCodeDAO.insCodeDo(commCodevo);
                rtn = "success";
            } else if ("udt".equals(commCodevo.getRowStatus())) {
                // 코드그룹이 변경이 일어나면 자식 코드그룹도 바꿔준다.
                if ("*".equals(commCodevo.getCmmnGroupCode()) && !commCodevo.getCommCode().equals(commCodevo.getTmpCommCode())) {
                    rtn = commCodeDAO.udtUpperCodeDo(commCodevo);
                }
                rtn = commCodeDAO.udtCodeDo(commCodevo);
            } else if ("del".equals(commCodevo.getRowStatus())) {
                // 코드그룹이 삭제되면 자식 코드그룹도 삭제한다.
                if ("*".equals(commCodevo.getCmmnGroupCode())) {
                    rtn = commCodeDAO.delUpperCodeDo(commCodevo);
                }
                rtn = commCodeDAO.delCodeDo(commCodevo);
            }
        }
        return rtn;
    }


}