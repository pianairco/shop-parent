package ir.piana.business.formcreator;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class ControlTextLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return ControlTextLoadable.class.getResourceAsStream(
                "/piana/component/control-text.vue.jsp");
    }
}
