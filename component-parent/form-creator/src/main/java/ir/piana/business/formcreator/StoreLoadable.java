package ir.piana.business.formcreator;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class StoreLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return StoreLoadable.class.getResourceAsStream(
                "/piana/component/store.vue.jsp");
    }
}
