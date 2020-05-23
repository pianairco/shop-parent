package ir.piana.business.formcreator.data.model;

import java.util.List;

public class FormModel {
    private String name;
    private List<ControlModel> controls;
    private List<ButtonModel> buttons;
    private String action;
    private String activity;

    public FormModel() {
    }

    public List<ControlModel> getControls() {
        return controls;
    }

    public FormModel setControls(List<ControlModel> controls) {
        this.controls = controls;
        return this;
    }

    public String getAction() {
        return action;
    }

    public FormModel setAction(String action) {
        this.action = action;
        return this;
    }

    public String getActivity() {
        return activity;
    }

    public FormModel setActivity(String activity) {
        this.activity = activity;
        return this;
    }

    public List<ButtonModel> getButtons() {
        return buttons;
    }

    public FormModel setButtons(List<ButtonModel> buttons) {
        this.buttons = buttons;
        return this;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
