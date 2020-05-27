package ir.piana.business.formcreator;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class FormCreatorLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return FormCreatorLoadable.class.getResourceAsStream(
                "/piana/component/form-creator.vue.jsp");
    }
}
