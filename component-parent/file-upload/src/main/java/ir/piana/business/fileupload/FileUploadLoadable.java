package ir.piana.business.fileupload;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class FileUploadLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return FileUploadLoadable.class.getResourceAsStream(
                "/piana/component/file-upload.vue.jsp");
    }
}
