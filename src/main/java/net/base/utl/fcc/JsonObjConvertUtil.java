package net.base.utl.fcc;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import egov.cmm.util.EgovBasicLogger;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class JsonObjConvertUtil {

    /**
     * egov map to json obj
     *
     * @param egovMap
     * @return
     */
    @SuppressWarnings("unchecked")
    public static JSONObject egovMapToJsonObj(EgovMap egovMap) {
        JSONObject jsonObj = new JSONObject();
        for (Object key : egovMap.keySet()) {
            jsonObj.put(key + "", egovMap.get(key) + "");
        }
        return jsonObj;
    }

    /**
     * vo to json obj
     *
     * @param vo
     * @return
     */
    @SuppressWarnings("unchecked")
    public static JSONObject objToJsonObj(Object vo) {
        JSONObject jsonObj = new JSONObject();
        Field[] fields = vo.getClass().getDeclaredFields();
        Map<String, Object> result = new HashMap<String, Object>();
        for (Field f : fields) {
            if (!f.isAccessible()) f.setAccessible(true);
            try {
                if (f.get(vo) != null && !"".equals(f.get(vo))) result.put(f.getName(), f.get(vo));
            } catch (IllegalArgumentException | IllegalAccessException e) {
                EgovBasicLogger.ignore("JsonObjConvertUtil objToJsonObj >> Occurred Exception to close resource is ignored!!");
                return jsonObj;
            }
        }
        jsonObj.putAll(result);
        return jsonObj;
    }

    /**
     * list egovmap to json arrary
     *
     * @param egovList
     * @return
     */
    @SuppressWarnings("unchecked")
    public static JSONArray listEgovToJsonAry(List<EgovMap> egovList) {
        JSONArray jsonArr = new JSONArray();
        if (!egovList.isEmpty()) {
            for (EgovMap lists : egovList) {
                jsonArr.add(egovMapToJsonObj(lists));
            }
        }
        return jsonArr;
    }

    /**
     * list vo to json arrary
     *
     * @param list
     * @return
     */
    @SuppressWarnings("unchecked")
    public static String listObjToJsonAry(List<?> list) {
        JSONArray jsonArr = new JSONArray();
        for (Object obj : list) {
            jsonArr.add(objToJsonObj(obj));
        }
        return jsonArr.toJSONString();
    }

    @SuppressWarnings("unchecked")
    public static JSONArray egovChg(List<EgovMap> egovList) {
        JSONArray jsonArr = new JSONArray();
        if (!egovList.isEmpty()) {
            for (EgovMap lists : egovList) {
                JSONObject jsonObj = new JSONObject();
                Iterator<String> iterator = lists.keySet().iterator();
                while (iterator.hasNext()) {
                    String eKey = iterator.next() + "";
                    String eValues = lists.get(eKey) + "";
                    jsonObj.put(eKey, eValues);
                }
                jsonArr.add(jsonObj);
            }
        }
        return jsonArr;
    }

}