package ir.piana.business.vavishkashop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.annotation.Bean;
import org.springframework.context.event.EventListener;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication(scanBasePackages = {
        "ir.piana.business.vavishkashop",
		"ir.piana.dev.springvue.core"})
public class SimpleShopApplication {

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	public static void main(String[] args) {
//		SpringVueResource springVueResource = ActionInstaller.getSpringVueResource();
//				getInstance(SimpleShopApplication.class.getResourceAsStream("/piana/spring-vue.properties"))
//				.component("/piana/component/menu.vue.jsp")
//				.component("/piana/component/one.vue.jsp")
//				.component("/piana/component/two.vue.jsp")
//				.component("/piana/component/three.vue.jsp")
//				.component("/piana/page/root.vue.jsp")
//				.component("/piana/page/login.vue.jsp")
//				.component("/piana/page/book.vue.jsp")
//				.component("/piana/page/box.vue.jsp")
//				.route("/piana/route.yaml")
//				.component(SimpleShopApplication.class.getResourceAsStream("/piana/component/menu.vue.jsp"))
//				.component(SimpleShopApplication.class.getResourceAsStream("/piana/component/one.vue.jsp"))
//				.component(SimpleShopApplication.class.getResourceAsStream("/piana/component/two.vue.jsp"))
//				.component(SimpleShopApplication.class.getResourceAsStream("/piana/component/three.vue.jsp"))
//				.component(SimpleShopApplication.class.getResourceAsStream("/piana/page/root.vue.jsp"))
//				.component(SimpleShopApplication.class.getResourceAsStream("/piana/page/login.vue.jsp"))
//				.component(SimpleShopApplication.class.getResourceAsStream("/piana/page/book.vue.jsp"))
//				.component(SimpleShopApplication.class.getResourceAsStream("/piana/page/box.vue.jsp"))
//				.route(SimpleShopApplication.class.getResourceAsStream("/piana/route.yaml"))
//				.install();
		SpringApplication.run(SimpleShopApplication.class, args);
	}

	@EventListener(ApplicationReadyEvent.class)
	public void doSomethingAfterStartup() {
		System.out.println("hello world, I have just started up");
	}
}
