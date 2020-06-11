package ir.piana.business.vavishkanavbar;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;

import java.io.InputStream;

/**
 * https://bootsnipp.com/snippets/Al0VV
 */
public class VavishkaNavbarLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return VavishkaNavbarLoadable.class.getResourceAsStream(
                "/piana/component/vavishka-navbar.vue.jsp");
    }
}
