package ir.piana.business.vavishkashop;

import ir.piana.dev.springvue.core.action.ActionConfig;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource("classpath:application.yaml")
public class BusinessActionConfig extends ActionConfig {
//    @Value("${app.mode.debug}")
//    private String debugs;

//    @Bean
//    public GroupProvider getGroupProvider() {
//        GroupFromYamlService groupFromYamlService = new GroupFromYamlService();
//        groupFromYamlService.init();
//        return groupFromYamlService;
//    }
}
