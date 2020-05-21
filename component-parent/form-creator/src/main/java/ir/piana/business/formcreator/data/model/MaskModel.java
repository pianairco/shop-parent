package ir.piana.business.formcreator.data.model;

public class MaskModel {
    private String mask;
    private String min;
    private String max;
    private String pattern;
    private String thousandsSeparator;
    private boolean lazy;

    public MaskModel() {
    }

    public MaskModel(String mask) {
        this.mask = mask;
    }

    public String getMask() {
        return mask;
    }

    public MaskModel setMask(String mask) {
        this.mask = mask;
        return this;
    }

    public String getMin() {
        return min;
    }

    public MaskModel setMin(String min) {
        this.min = min;
        return this;
    }

    public String getMax() {
        return max;
    }

    public MaskModel setMax(String max) {
        this.max = max;
        return this;
    }

    public String getThousandsSeparator() {
        return thousandsSeparator;
    }

    public MaskModel setThousandsSeparator(String thousandsSeparator) {
        this.thousandsSeparator = thousandsSeparator;
        return this;
    }

    public boolean isLazy() {
        return lazy;
    }

    public MaskModel setLazy(boolean lazy) {
        this.lazy = lazy;
        return this;
    }

    public String getPattern() {
        return pattern;
    }

    public MaskModel setPattern(String pattern) {
        this.pattern = pattern;
        return this;
    }
}
