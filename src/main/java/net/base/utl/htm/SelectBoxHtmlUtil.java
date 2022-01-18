package net.base.utl.htm;

import java.util.HashMap;
import java.util.List;

import egov.utl.fcc.service.EgovStringUtil;
import net.base.cmm.vo.SelectBoxVO;

public class SelectBoxHtmlUtil {

	public static String makeHtml(String id, String name, String css, String style, String attr, String selectKey, List<HashMap<String, String>> sltLst) {

		StringBuffer sltBox = new StringBuffer();

		sltBox.append("<select ");
		if (!EgovStringUtil.isEmpty(id)) {
            sltBox.append(" id= \"" + id + "\"");
        }
		if (!EgovStringUtil.isEmpty(name)) {
            sltBox.append(" name= \"" + name + "\"");
        }
		if (!EgovStringUtil.isEmpty(css)) {
            sltBox.append(" class= \"" + css + "\"");
        }
		if (!EgovStringUtil.isEmpty(style)) {
            sltBox.append(" style= \"" + style + "\"");
        }
		if (!EgovStringUtil.isEmpty(attr)) {
            sltBox.append(" " + attr);
        }
		sltBox.append("> ");
		sltBox.append("<option value=\"\">선택</option>");
		for (HashMap<String, String> map : sltLst) {
			sltBox.append("<option");
			sltBox.append(map.get("value").equals(selectKey) ? " selected=\"selected\"" : "");
			sltBox.append(" value=\"" + map.get("value") + "\">");
			sltBox.append(map.get("name"));
			sltBox.append("</option>");
		}
		sltBox.append("</select> ");

		return sltBox.toString();
	}

	public static String makeHtml(SelectBoxVO selectBoxVO, List<HashMap<String, String>> sltLst) {
		return makeHtml(selectBoxVO.getId(), selectBoxVO.getName(), selectBoxVO.getCss(), selectBoxVO.getStyle(), selectBoxVO.getAttr(), selectBoxVO.getSelectKey(), sltLst);
	}

}