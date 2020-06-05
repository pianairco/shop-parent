package ir.piana.business.shoppigItem;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;

import java.io.InputStream;

public class ShoppingItemLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return ShoppingItemLoadable.class.getResourceAsStream(
                    "/piana/component/shopping-item.vue.jsp");
    }
}
