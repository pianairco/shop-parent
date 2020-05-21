package ir.piana.business.formcreator.data.model;

public class ControlModel {
    private String type;
    private String label;
    private String name;
    private String action;
    private String activity;
    private MaskModel maskModel;

    public ControlModel() {
    }

    public String getType() {
        return type;
    }

    public ControlModel setType(String type) {
        this.type = type;
        return this;
    }

    public String getLabel() {
        return label;
    }

    public ControlModel setLabel(String label) {
        this.label = label;
        return this;
    }

    public String getName() {
        return name;
    }

    public ControlModel setName(String name) {
        this.name = name;
        return this;
    }

    public String getAction() {
        return action;
    }

    public ControlModel setAction(String action) {
        this.action = action;
        return this;
    }

    public String getActivity() {
        return activity;
    }

    public ControlModel setActivity(String activity) {
        this.activity = activity;
        return this;
    }

    public MaskModel getMaskModel() {
        return maskModel;
    }

    public ControlModel setMaskModel(MaskModel maskModel) {
        this.maskModel = maskModel;
        return this;
    }
}
