package ir.piana.business.formcreator.cfg;

import ir.piana.dev.springvue.core.action.Action;
import net.sf.jmimemagic.*;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.activation.MimetypesFileTypeMap;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.util.Map;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service("FormSaver")
public class FormSaver extends Action {
    private static MimetypesFileTypeMap mimeTypesMap = null;

    static {
        mimeTypesMap = new MimetypesFileTypeMap(
                FormSaver.class.getResourceAsStream("/mime.types")
        );
    }

    String getContentType(String base64) {
        String substring = base64.substring(5, base64.indexOf(";base64,"));
        return substring.split("/")[1];
    }

    public Function<RequestEntity, ResponseEntity> save = (r) -> {
        Map<String, String> m = (Map<String, String>) r.getBody();
        String extension = getContentType(m.get("profileImage"));

        Object body = r.getBody();
        return ResponseEntity.ok("success");
    };
}
