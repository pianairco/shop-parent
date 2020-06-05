package ir.piana.business.shoppigItem.model;

public class ItemModel {
    private String measurementUnit;
    private int measurement;
    private String priceUnit;
    private int discountPercent;
    private int price;
    private String imageSrc;
    private String title;
    private String code;
    private int id;

    public ItemModel() {
    }

    public String getMeasurementUnit() {
        return measurementUnit;
    }

    public int getMeasurement() {
        return measurement;
    }

    public String getPriceUnit() {
        return priceUnit;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public int getPrice() {
        return price;
    }

    public String getImageSrc() {
        return imageSrc;
    }

    public String getTitle() {
        return title;
    }

    public String getCode() {
        return code;
    }

    public int getId() {
        return id;
    }

    public ItemModel setId(int id) {
        this.id = id;
        return this;
    }
    public ItemModel setCode(String code) {
        this.code = code;
        return this;
    }
    public ItemModel setTitle(String title) {
        this.title = title;
        return this;
    }
    public ItemModel setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
        return this;
    }
    public ItemModel setPrice(int price) {
        this.price = price;
        return this;
    }
    public ItemModel setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
        return this;
    }
    public ItemModel setPriceUnit(String priceUnit) {
        this.priceUnit = priceUnit;
        return this;
    }
    public ItemModel setMeasurement(int measurement) {
        this.measurement = measurement;
        return this;
    }
    public ItemModel setMeasurementUnit(String measurementUnit) {
        this.measurementUnit = measurementUnit;
        return this;
    }
}
