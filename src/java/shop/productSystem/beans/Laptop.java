package shop.productSystem.beans;

public class Laptop extends Product{
    private String model;
    private String CPU;
    private String RAM;
    private String ROM;
    private String battery;
    private OperationSystem system;
    private double screenSize;
    private String colour;
    private String videoAdapter;
    private String completeSet;
    private String dimensions;

    public Laptop() {
        super();
        this.model = "none";
        this.CPU = "none";
        this.RAM = "none";
        this.ROM = "none";
        this.battery = "none";
        this.system = OperationSystem.NONE;
        this.screenSize = 15.6;
        this.colour = "none";
        this.videoAdapter = "none";
        this.completeSet = "none";
        this.dimensions = "none";
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getROM() {
        return ROM;
    }

    public void setROM(String ROM) {
        this.ROM = ROM;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public OperationSystem getSystem() {
        return system;
    }

    public void setSystem(OperationSystem system) {
        this.system = system;
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

    public String getVideoAdapter() {
        return videoAdapter;
    }

    public void setVideoAdapter(String videoAdapter) {
        this.videoAdapter = videoAdapter;
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
