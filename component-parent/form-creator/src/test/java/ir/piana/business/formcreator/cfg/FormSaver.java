package ir.piana.business.formcreator.cfg;

import ir.piana.dev.springvue.core.action.Action;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.function.Function;

@Service("FormSaver")
public class FormSaver extends Action {
    public Function<RequestEntity, ResponseEntity> save = (r) -> {
        return ResponseEntity.ok("success");
    };
}
