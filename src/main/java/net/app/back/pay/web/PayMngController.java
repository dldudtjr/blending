package net.app.back.pay.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.cmm.EgovMessageSource;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.back.pay.service.PayMngService;
import net.app.file.service.FileService;
import net.app.front.mypage.vo.PayVO;
import net.app.vo.SrchVO;
import net.base.web.CommUtils;

@Controller
@RequestMapping(path = "back/pay/")
public class PayMngController {

	@Resource(name = "sessionContextFactory")
	private ObjectFactory<?> sessionContextFactory;

	@Resource(name = "commUtils")
	private CommUtils commUtils;

	@Resource(name = "egovMessageSource")
	private EgovMessageSource egovMessageSource;

	@Resource(name = "fileService")
	private FileService fileService;

	@Resource(name = "payMngService")
	private PayMngService payMngService;


	String path = "tiles/pages/frnt/mypage";


	@RequestMapping(path = "payList.bt")
	public String payList(@ModelAttribute("srchFm") SrchVO srchVO, ModelMap model) {

		List<EgovMap> eMap = this.payMngService.getPayPageLst(srchVO);
		srchVO.setTotalRecordCount(eMap.size() > 0 ? Integer.parseInt(eMap.get(0).get("totCnt") + "") : 0);
		model.addAttribute("srchLst", eMap);
		return commUtils.tiles(commUtils.TILES_BACK, "pay/payList");
	}


	@RequestMapping(path = "cancelPayDo.ax")
	@ResponseBody
	public ModelMap payPasswdChg(PayVO payVO) {
		ModelMap modelMap = new ModelMap();
		String rtn = payMngService.cancelPayDo(payVO);

		if ("1".equals(rtn)) {
			modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
		} else {
			modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
		}

		return modelMap;
	}




}
