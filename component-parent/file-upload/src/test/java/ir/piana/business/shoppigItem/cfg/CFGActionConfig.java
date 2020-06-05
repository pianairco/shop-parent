package ir.piana.business.shoppigItem.cfg;

import ir.piana.dev.springvue.core.action.ActionConfig;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource("classpath:application.yaml")
public class CFGActionConfig extends ActionConfig {
}
