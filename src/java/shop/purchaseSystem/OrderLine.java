package shop.purchaseSystem;

import shop.productSystem.Product;

public class OrderLine {
    private int id;
    private Product product;
    private int count;
    private double price;
    private int orderId;

    public OrderLine() {
        id = 0;
        product = new Product();
        count = 0;
        price = 0;
        orderId = 0;
    }

    public OrderLine(int orderId) {
        id = 0;
        product = new Product();
        count = 0;
        price = 0;
        this.orderId = orderId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean setPrice() {
        if (product.getPrice() != 0 && count != 0) {
            price = product.getPrice() * count;
            return true;
        } else return false;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
