package ir.piana.business.fileupload;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class ShoppingItemsLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return ShoppingItemsLoadable.class.getResourceAsStream(
                    "/piana/component/shopping-items.vue.jsp");
    }
}
