package ir.piana.business.formcreator.cfg;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

@SpringBootApplication(scanBasePackages = {
        "ir.piana.business",
        "ir.piana.dev.springvue.core"})
public class FormCreatorTestApp {
    public static void main(String[] args) {
        SpringApplication.run(FormCreatorTestApp.class, args);
    }

    @EventListener(ApplicationReadyEvent.class)
    public void doSomethingAfterStartup() {
        System.out.println("hello world, I have just started up");
    }
}
