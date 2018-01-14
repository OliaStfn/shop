package shop.productSystem;

import java.time.Period;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private Category category;
    private String country;
    private String vendor;
    private Period warranty;

    public Product() {
        this.id = 0;
        this.name = "none";
        this.description = "none";
        this.price = 0;
        this.category = Category.NONE;
        this.country = "none";
        this.vendor = "none";
        this.warranty = Period.ZERO;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public Period getWarranty() {
        return warranty;
    }

    public void setWarranty(Period warranty) {
        this.warranty = warranty;
    }
}
