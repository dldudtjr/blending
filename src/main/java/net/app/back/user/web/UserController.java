package net.app.back.user.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egov.cmm.EgovFileUpload;
import egov.cmm.EgovMessageSource;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.app.back.user.service.UserService;
import net.app.file.service.FileService;
import net.app.file.vo.FileVO;
import net.app.front.mypage.vo.CmpyVO;
import net.app.front.mypage.vo.UserVO;
import net.app.lgn.service.LgnService;
import net.app.lgn.util.CmsSessionUtils;
import net.app.vo.SrchVO;
import net.base.web.CommUtils;

@Controller
@RequestMapping(path = "back/user/")
public class UserController {

	@Resource(name = "sessionContextFactory")
	private ObjectFactory<?> sessionContextFactory;

	@Resource(name = "commUtils")
	private CommUtils commUtils;

	@Resource(name = "egovMessageSource")
	private EgovMessageSource egovMessageSource;

	@Resource(name = "fileService")
	private FileService fileService;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "lgnService")
	private LgnService lgnService;

	String path = "tiles/pages/frnt/mypage";


	@RequestMapping(path = "userList.bt")
	public String userList(@ModelAttribute("srchFm") SrchVO srchVO, ModelMap model) {

		List<EgovMap> eMap = this.userService.getUserPageLst(srchVO);
		srchVO.setTotalRecordCount(eMap.size() > 0 ? Integer.parseInt(eMap.get(0).get("totCnt") + "") : 0);
		model.addAttribute("srchLst", eMap);
		return commUtils.tiles(commUtils.TILES_BACK, "user/userList");
	}


	@RequestMapping(path = "userPasswdChg.ax")
	@ResponseBody
	public ModelMap userPasswdChg(UserVO userVO) {
		ModelMap modelMap = new ModelMap();

		String rtn = userService.insUserInfoDo(userVO);

		if ("1".equals(rtn)) {
			modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
		} else {
			modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
		}

		return modelMap;
	}

	@RequestMapping(path = "userInfo.bt")
	public String userInfo(SrchVO srchVO, @ModelAttribute("saveFm") UserVO userVO,CmpyVO cmpyVO, ModelMap model) {

		if (CmsSessionUtils.getUserId() != null && !"".equals(CmsSessionUtils.getUserId())) {
			userVO.setUserId(CmsSessionUtils.getUserId());
			model.addAttribute("saveFm", userService.getUserDtl(userVO));

			cmpyVO.setUserId(CmsSessionUtils.getUserId());
			cmpyVO.setCmpyId(CmsSessionUtils.getUserInfo().getCmpyId());
		}

		return commUtils.tiles(commUtils.TILES_BACK, "user/userInfo");
	}

	@RequestMapping(path = "insUserInfoDo.ax")
	public ModelMap insUserInfoDo(MultipartHttpServletRequest request ,UserVO UserVO, ModelMap model) {
		ModelMap modelMap = new ModelMap();

		String rtn = userService.insUserInfoDo(UserVO);

		List<FileVO> list;
		try {
			list = EgovFileUpload.fileUploads(request, this.path); // 파일 업로드
			if (list.size() > 0) {
				this.fileService.insFileDo(list, UserVO.getUserId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if ("1".equals(rtn)) {
			modelMap.put("msg", this.egovMessageSource.getMessage("success.common.update"));
		} else {
			modelMap.put("msg", this.egovMessageSource.getMessage("success.common.error"));
		}

		return modelMap;
	}


	@RequestMapping(path = "historyList.bt")
	public String historyList(@ModelAttribute("srchFm") SrchVO srchVO, ModelMap model) {
		List<EgovMap> eMap = this.lgnService.getLoginHistPageLst(srchVO);
		srchVO.setTotalRecordCount(eMap.size() > 0 ? Integer.parseInt(eMap.get(0).get("totCnt") + "") : 0);
		model.addAttribute("srchLst", eMap);

		return commUtils.tiles(commUtils.TILES_BACK, "user/historyList");
	}




}
