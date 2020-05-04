package ir.piana.business.fileupload;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class ShoppingItemLoadable implements VueComponentLoadable {
    @Override
    public String getComponentString() {
        InputStream inputStream = ShoppingItemLoadable.class.getResourceAsStream(
                "/piana/component/shopping-items.vue.jsp");
        String s = null;
        try {
            s = IOUtils.toString(inputStream, "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return s;
    }
}
