package ir.piana.business.shoppigItem;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;

import java.io.InputStream;

public class FileUploadLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return FileUploadLoadable.class.getResourceAsStream(
                "/piana/component/file-upload.vue.jsp");
    }
}
