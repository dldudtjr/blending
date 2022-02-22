package net.base.code.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "cms/sysm/code")
public class CommCodeController {
//
//    @Resource(name = "commCodeService")
//    private CommCodeService commCodeService;
//
//    @RequestMapping(path = "commCodeMngFrstLst.lp")
//    public String commCodeMngFrstLst(@ModelAttribute("srchFm") SrchCmsmVO srchCmsmVO, ModelMap model) {
//        model.addAttribute("srchLst", commCodeService.getCodeLst(srchCmsmVO));
//        model.addAttribute("pageTyCode", "first"); // 분류관리와 코드관리가 같은 테이블을 사용하므로 pageTyCode으로 구분한다.
//        return tiles(TILES_CMS, "sysm/code/commCodeMngLst");
//    }
//
//    @RequestMapping(path = "commCodeMngLst.lp")
//    public String commCodeMngLst(@ModelAttribute("srchFm") SrchCmsmVO srchCmsmVO, ModelMap model) {
//        model.addAttribute("srchLst", commCodeService.getCodeLst(srchCmsmVO));
//        return tiles(TILES_CMS, "sysm/code/commCodeMngLst");
//    }
//
//    @RequestMapping(path = "commCodeMngSubLst.ax")
//    public String commCodeMngSubLst(SrchCmsmVO srchCmsmVO, ModelMap model) {
//        model.addAttribute("srchLst", commCodeService.getCodeLst(srchCmsmVO));
//        return "tiles/pages/cmsm/sysm/code/commCodeMngSubLst";
//    }
//
//    @RequestMapping(path = "commCodeComboLst.ax")
//    @ResponseBody
//    public List<SrchKeyTxtVO> commCodeComboLstAx(SrchCmsmVO srchCmsmVO) {
//        srchCmsmVO.setSrchCombo("Y");
//        return commCodeService.getCodeComboLst(srchCmsmVO);
//    }
//
//    @RequestMapping(path = "commCodeInsUdtDelDo.ax")
//    @ResponseBody
//    public ModelMap commCodeInsUdtDelDo(@RequestBody List<CommCodeVO> listVO) {
//        String rtn = commCodeService.iudCommCodeDo(listVO);
//        ModelMap modelMap = new ModelMap();
//        modelMap.put("msg", this.egovMessageSource.getMessage("success.common." + ("".equals(rtn) ? "error" : "insert")));
//        commCodeService.setCacheCodeGrpLst(); // code group list cache refresh
//        return modelMap;
//    }
//
//    @RequestMapping(path = "commCodeDelDo.ax")
//    @ResponseBody
//    public ModelMap commCodeDelDo(@RequestBody List<CommCodeVO> listVO) {
//        String rtn = commCodeService.iudCommCodeDo(listVO);
//        ModelMap modelMap = new ModelMap();
//        modelMap.put("msg", this.egovMessageSource.getMessage("success.common." + ("".equals(rtn) ? "error" : "delete")));
//        commCodeService.setCacheCodeGrpLst(); // code group list cache refresh
//        return modelMap;
//    }
}