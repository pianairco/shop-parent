package ir.piana.business.vavishkanavbar;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;

import java.io.InputStream;

public class ControlImageLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return ControlImageLoadable.class.getResourceAsStream(
                "/piana/component/control-image.vue.jsp");
    }
}
