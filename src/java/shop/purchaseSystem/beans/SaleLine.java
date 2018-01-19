package shop.purchaseSystem.beans;

import shop.productSystem.beans.Product;

public class SaleLine {
    private int id;
    private Product product;
    private int quantity;
    private double price;
    private Warranty warranty;
    private int saleId;

    public SaleLine() {
        id=0;
        product= new Product();
        quantity=0;
        price=0;
        warranty=new Warranty();
        saleId=0;
    }

    public SaleLine(int saleId) {
        this();
        this.saleId = saleId;
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

    public Warranty getWarranty() {
        return warranty;
    }

    public void setWarranty(Warranty warranty) {
        this.warranty = warranty;
    }

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }
}
