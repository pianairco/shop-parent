package ir.piana.business.fileupload;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class ShoppingItemLoadable implements VueComponentLoadable {
    @Override
    public String getComponentString() {
        try {
            InputStream inputStream = ShoppingItemLoadable.class.getResourceAsStream(
                    "/piana/component/shopping-item.vue.jsp");
            String s = IOUtils.toString(inputStream, "UTF-8");
            return s;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
