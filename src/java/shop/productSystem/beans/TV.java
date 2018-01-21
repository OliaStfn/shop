package shop.productSystem.beans;

public class TV extends Product {
    private String model;
    private String battery;
    private double screenSize;
    private String colour;
    private String completeSet;
    private String dimensions;

    public TV() {
        super();
        this.model = "none";
        this.battery = "none";
        this.screenSize = 15.6;
        this.colour = "none";
        this.completeSet = "none";
        this.dimensions = "none";
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public double getScreenSize() {
        return screenSize;
    }

    public void setScreenSize(double screenSize) {
        this.screenSize = screenSize;
    }

    public String getColour() {
        return colour;
    }

    public void setColour(String colour) {
        this.colour = colour;
    }

    public String getCompleteSet() {
        return completeSet;
    }

    public void setCompleteSet(String completeSet) {
        this.completeSet = completeSet;
    }

    public String getDimensions() {
        return dimensions;
    }

    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }
}
