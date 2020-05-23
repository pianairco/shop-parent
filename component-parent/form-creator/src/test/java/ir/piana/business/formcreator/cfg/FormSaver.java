package ir.piana.business.formcreator.cfg;

import ir.piana.business.formcreator.data.model.FormModel;
import ir.piana.business.formcreator.data.service.FormStructureService;
import ir.piana.dev.springvue.core.action.Action;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.activation.MimetypesFileTypeMap;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.function.Function;

@Service("FormSaver")
public class FormSaver extends Action {
    private static MimetypesFileTypeMap mimeTypesMap = null;

    static {
        mimeTypesMap = new MimetypesFileTypeMap(
                FormSaver.class.getResourceAsStream("/mime.types")
        );
    }

    @Autowired
    private FormStructureService formStructureService;

    public Function<RequestEntity, ResponseEntity> loadForm = (r) -> {
        InputStream resourceAsStream = FormSaver.class.getResourceAsStream("/form.json");
        String s = null;
        try {
            s = IOUtils.toString(resourceAsStream, "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
        FormModel formModel = formStructureService.loadForm(s);
        return ResponseEntity.ok(formModel);
    };

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
