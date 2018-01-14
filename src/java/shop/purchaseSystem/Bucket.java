package shop.purchaseSystem;

import shop.productSystem.Product;

import java.util.HashMap;

public class Bucket {
    private int id;
    private HashMap<Product,Integer> lines;
    private int customerId;

    public Bucket() {
        id=0;
        lines=new HashMap<>();
        customerId=0;
    }

    public Bucket(int customerId) {
        id=0;
        lines=new HashMap<>();
        this.customerId=customerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public HashMap<Product, Integer> getLines() {
        return lines;
    }

    public void setLines(HashMap<Product, Integer> lines) {
        this.lines = lines;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
}
