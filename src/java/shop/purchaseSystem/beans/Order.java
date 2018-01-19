package shop.purchaseSystem.beans;

import shop.productSystem.beans.Product;
import shop.sql.Identificator;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

public class Order implements Identificator<Integer> {
    private int id;
    private HashSet<OrderLine> lines;
    private double price;

    public Order() {
        id=0;
        lines=new HashSet<>();
        price=0;
    }

    public Order(Bucket bucket) {
       this();
       Iterator<Map.Entry<Product,Integer>> it = bucket.getLines().entrySet().iterator();
       while (it.hasNext()){
           addLine(it.next().getKey(),it.next().getValue());
       }
    }

    private void addLine(Product product, int quantity){
        OrderLine line = new OrderLine(id);
        line.setProduct(product);
        line.setQuantity(quantity);
        line.setPrice();
        lines.add(line);
        price+=line.getPrice();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public HashSet<OrderLine> getLines() {
        return lines;
    }

    public void setLines(HashSet<OrderLine> lines) {
        this.lines = lines;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
