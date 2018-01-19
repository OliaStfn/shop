package shop.purchaseSystem.beans;

import shop.productSystem.beans.Product;

public class OrderLine {
    private int id;
    private Product product;
    private int quantity;
    private double price;
    private int orderId;

    public OrderLine() {
        id = 0;
        product = new Product();
        quantity = 0;
        price = 0;
        orderId = 0;
    }

    public OrderLine(int orderId) {
        this();
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean setPrice() {
        if (product.getPrice() != 0 && quantity != 0) {
            price = product.getPrice() * quantity;
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
