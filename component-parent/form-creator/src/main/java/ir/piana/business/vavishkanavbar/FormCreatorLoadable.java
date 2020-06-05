package ir.piana.business.vavishkanavbar;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;

import java.io.InputStream;

public class FormCreatorLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return FormCreatorLoadable.class.getResourceAsStream(
                "/piana/component/form-creator.vue.jsp");
    }
}
