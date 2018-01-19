package shop.purchaseSystem.beans;

import shop.productSystem.beans.Product;

import java.util.HashMap;

public class Bucket {
    private int id;
    private HashMap<Product,Integer> lines;

    public Bucket() {
        id=0;
        lines=new HashMap<>();
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
}
