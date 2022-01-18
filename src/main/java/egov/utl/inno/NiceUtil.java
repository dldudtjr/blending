package egov.utl.inno;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class NiceUtil {

    private static final String alg = "AES/CBC/PKCS5Padding";

    /**
     * AES256 암호화
     * @param plain 암호화 할 문자열 (평문)
     * @param secretKey 암호화 키
     * @return 암호화 된 문자열 (base64)
     */
    public String encrypt(String plain, String secretKey) {

        String iv = secretKey.substring(9,25);

        try {
            Cipher cipher = Cipher.getInstance(alg);
            SecretKeySpec keySpec = new SecretKeySpec(iv.getBytes(), "AES");
            IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes());
            cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivParameterSpec);

            byte[] encrypted = cipher.doFinal(plain.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(encrypted);

        } catch (Exception e) {
            log.error("[Nice Response 암호화] : 암호화에 실패 하였습니다. Error Code : {}", e.getMessage());
            return null;
        }

    }

    /**
     * AES256 복호화
     * @param plain 암호화 문자열 (base64)
     * @param secretKey 암호화 키
     * @return 복호화 된 문자열
     */
    public String decrypt(String plain, String secretKey) {

        String iv = secretKey.substring(9,25);

        try {
            Cipher cipher = Cipher.getInstance(alg);
            SecretKeySpec keySpec = new SecretKeySpec(iv.getBytes(), "AES");
            IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes());
            cipher.init(Cipher.DECRYPT_MODE, keySpec, ivParameterSpec);

            byte[] decodedBytes =  Base64.getDecoder().decode(plain);
            byte[] decrypted = cipher.doFinal(decodedBytes);
            return new String(decrypted, StandardCharsets.UTF_8);

        } catch (Exception e) {
            log.error("[Nice Response 복호화] : 복호화에 실패 하였습니다. Error Code : {}", e.getMessage());
            return null;
        }

    }

}
