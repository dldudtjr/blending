package egov.utl.inno;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class CryptoUtils {

//    private static final Logger LOGGER = LoggerFactory.getLogger(InnoBlockUtils.class);

    public static int PRINT_INDENT = 2;

//    private static long FEE = 1L;

    public static String endPointB;


    protected static final String BASE_JSP_DIR = "/tiles/pages/dev";

    protected static final String TILES_MONITOR = "monitor";

    protected static final String MONITOR_JSP_DIR = BASE_JSP_DIR + TILES_MONITOR + "/";



    public static String createChkKey(String id) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
        UUID uuid = UUID.randomUUID();
        System.out.println(uuid);
        return AES256Util.encrypt(id,(id+UUID.randomUUID().toString().replace("-", ""))+"");
    }
}
