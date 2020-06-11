package ir.piana.business.vavishkanavbar.data.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component()
public class FormStructureService {
    @Autowired
    private ObjectMapper objectMapper;
}
