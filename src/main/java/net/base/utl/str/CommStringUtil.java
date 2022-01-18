package net.base.utl.str;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import egov.cmm.util.EgovBasicLogger;

public class CommStringUtil {

    public static String urlEncoder(String inputStr) {
        String outputStr = "";
        if (inputStr != null && !"".equals(inputStr)) {
            try {
                outputStr = URLEncoder.encode(inputStr, "UTF-8");
            } catch (UnsupportedEncodingException ignore) {
                EgovBasicLogger.ignore("EncodeUtil urlEncoder >> Occurred Exception to close resource is ignored!! message : " + ignore);
            }
        }
        return outputStr;
    }

    public static String[] stringToIntAry(String str, String rex) {
        if (str == null || "".equals(str)) {
            return null;
        } else {
            str = str.replaceAll("\\p{Space}", "");
            String[] tmpStrAry = str.substring(0, str.length()).split(rex);
            String[] intAry = new String[tmpStrAry.length];
            for (int i = 0; i < tmpStrAry.length; i++)
                intAry[i] = tmpStrAry[i];
            return intAry;
        }
    }

}