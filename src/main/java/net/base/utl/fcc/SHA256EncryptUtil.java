package net.base.utl.fcc;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import egov.cmm.util.EgovBasicLogger;

public class SHA256EncryptUtil {
    
    private final static String saltKey = "rda123";
    
    public static String getSHA256(String orgStr) {
        
        String sha256 = "";
        try {
            int ITERATION_COUNT = 5;
            
            Decoder decoder = Base64.getDecoder();
            byte[] salt = decoder.decode(saltKey);
            
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            digest.reset();
            digest.update(salt);
            
            byte[] btPass = digest.digest(orgStr.getBytes("UTF-8"));
            
            for (int i = 0; i < ITERATION_COUNT; ++i) {
                digest.reset();
                btPass = digest.digest(btPass);
            }
            Encoder encoder = Base64.getEncoder();
            sha256 = encoder.encodeToString(btPass);
            
        } catch (NoSuchAlgorithmException | IOException ignore) {
            EgovBasicLogger.ignore("JsonObjConvertUtil objToJsonObj >> Occurred Exception to close resource is ignored!! message : " + ignore);
        }
        System.out.println(">>>>>>>sha256=" + sha256);
        return sha256;
        
    }
    
    public static String getInitPwd(String orgStr) {
        return getSHA256("p" + orgStr);
    }
    
}
