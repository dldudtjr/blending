package net.base.utl.fcc;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import egov.cmm.util.EgovBasicLogger;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class ReflectionChgUtil {

    public static String ObjToMapValue(Object obj, String filedName) {

        String filedNameF = filedName.substring(0, 1);
        String filedNameE = filedName.substring(1, filedName.length());
        String methodName = filedNameF.replace(filedName.substring(0, 1), filedName.substring(0, 1).toUpperCase()) + "" + filedNameE;
        String fieldValue = "";
        try {
            fieldValue = obj.getClass().getDeclaredMethod("get" + methodName).invoke(obj) != null ? obj.getClass().getDeclaredMethod("get" + methodName).invoke(obj) + "" : "";
        } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
            EgovBasicLogger.ignore(" objToJson >> Occurred Exception to close resource is ignored!! error message : " + e);
        }
        return fieldValue;
    }

    public static Map<String, Object> ObjToMap(Object obj) {
        Map<String, Object> map = new HashMap<>();

        Field[] fields = obj.getClass().getDeclaredFields();

        for (Field field : fields) {
            map.put(field.getName(), ObjToMapValue(obj, field.getName()));
        }

        return map;
    }

    public static byte[] hexStringToByteArray(String hex) {
        int l = hex.length();
        byte[] data = new byte[l / 2];
        for (int i = 0; i < l; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
                    + Character.digit(hex.charAt(i + 1), 16));
        }
        return data;
    }
    
    public static Object convertEgovMapToObject(EgovMap map, Object objClass) {
        String keyAttribute = null;
        String setMethodString = "set";
        String methodString = null;
        Iterator<?> itr = map.keySet().iterator();
        while (itr.hasNext()) {
            keyAttribute = (String) itr.next();
            methodString = setMethodString + keyAttribute.substring(0, 1).toUpperCase() + keyAttribute.substring(1);
            try {
                Method[] methods = objClass.getClass().getDeclaredMethods();
                for (int i = 0; i <= methods.length - 1; i++) {
                    if (methodString.equals(methods[i].getName())) {
                        methods[i].invoke(objClass, map.get(keyAttribute));
                    }
                }
            } catch (SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
                EgovBasicLogger.ignore(" convertEgovMapToObject >> Occurred Exception to close resource is ignored!! error message : " + e);
            }
        }
        return objClass;
    }
/*
    public static Object convertEgovMapToLoc(String pointA,String pointB) {
    double x 〓 Double.parseDouble( pointA );//x좌표
    double y 〓 Double.parseDouble( pointB );//y좌표

    CRSFactory factory 〓 new CRSFactory();
    CoordinateReferenceSystem srcCrs 〓 factory.createFromName("EPSG:5179");//현재 좌표
    CoordinateReferenceSystem dstCrs 〓 factory.createFromName("EPSG:4326");//변경할 좌표

    BasicCoordinateTransform transform 〓 new BasicCoordinateTransform(srcCrs, dstCrs);

    ProjCoordinate srcCoord 〓 new ProjCoordinate(x, y);
    ProjCoordinate dstCoord 〓 new ProjCoordinate();

    transform.transform(srcCoord, dstCoord);//좌표변환
    System.out.println(dstCoord.x + "," + dstCoord.y);//변환된 좌표
    roadAccountMngVO.getLatitude()
    }*/
}