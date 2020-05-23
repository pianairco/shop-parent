package ir.piana.business.formcreator.data.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import ir.piana.business.formcreator.data.model.FormModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("FormStructureService")
public class FormStructureService {
    @Autowired
    private ObjectMapper objectMapper;

    public FormModel loadForm(String formStructure) {
        FormModel formModel = null;
        try {
            formModel = objectMapper.readValue(formStructure, FormModel.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return formModel;
    }

}
