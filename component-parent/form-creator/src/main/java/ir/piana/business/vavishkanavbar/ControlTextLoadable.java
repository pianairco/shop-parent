package ir.piana.business.vavishkanavbar;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;

import java.io.InputStream;

public class ControlTextLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return ControlTextLoadable.class.getResourceAsStream(
                "/piana/component/control-text.vue.jsp");
    }
}
