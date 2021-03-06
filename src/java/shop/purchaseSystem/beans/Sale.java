package shop.purchaseSystem.beans;

import shop.sql.Identificator;

import java.time.LocalDateTime;
import java.util.HashSet;

public class Sale implements Identificator<Integer> {
    private int id;
    private HashSet<SaleLine> lines;
    private double price;
    private LocalDateTime createDate;
    private int orderId;
    private int customerId;

    public Sale() {
        id = 0;
        lines = new HashSet<>();
        price=0;
        createDate =LocalDateTime.now();
        orderId=0;
        customerId=0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public HashSet<SaleLine> getLines() {
        return lines;
    }

    public void setLines(HashSet<SaleLine> lines) {
        this.lines = lines;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
}
