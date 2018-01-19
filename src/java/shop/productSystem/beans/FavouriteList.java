package shop.productSystem.beans;

import java.util.HashSet;

public class FavouriteList {
    private int id;
    private HashSet<Product> products;
    private int customerId;

    public FavouriteList() {
        id=0;
        products=new HashSet<>();
        customerId=0;
    }

    public FavouriteList(int customerId) {
        id=0;
        products=new HashSet<>();
        this.customerId=customerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public HashSet<Product> getProducts() {
        return products;
    }

    public void setProducts(HashSet<Product> products) {
        this.products = products;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
}
