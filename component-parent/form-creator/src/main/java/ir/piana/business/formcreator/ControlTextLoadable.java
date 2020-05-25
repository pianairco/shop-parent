package ir.piana.business.formcreator;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class ControlTextLoadable implements VueComponentLoadable {
//    @Override
    public String getComponentString() {
        InputStream inputStream = ControlTextLoadable.class.getResourceAsStream(
                "/piana/component/control-text.vue.jsp");
        String s = null;
        try {
            s = IOUtils.toString(inputStream, "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return s;
    }
}
