package ir.piana.business.fileupload;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class ShoppingItemLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return ShoppingItemLoadable.class.getResourceAsStream(
                    "/piana/component/shopping-item.vue.jsp");
    }
}
