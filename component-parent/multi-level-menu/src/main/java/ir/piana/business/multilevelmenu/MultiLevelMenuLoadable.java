package ir.piana.business.multilevelmenu;

import ir.piana.dev.springvue.core.action.VueComponentLoadable;

import java.io.InputStream;

public class MultiLevelMenuLoadable extends VueComponentLoadable {
    @Override
    public InputStream getResource() {
        return MultiLevelMenuLoadable.class.getResourceAsStream(
                "/piana/component/multi-level-menu.vue.jsp");
    }
}
