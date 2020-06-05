package ir.piana.business.shoppigItem;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;

import java.io.InputStream;

public class ShoppingItemsLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return ShoppingItemsLoadable.class.getResourceAsStream(
                    "/piana/component/shopping-items.vue.jsp");
    }
}
