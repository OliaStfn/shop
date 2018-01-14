package shop.purchaseSystem;

import shop.productSystem.Product;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

public class Order {
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

    private void addLine(Product product, int count){
        OrderLine line = new OrderLine(id);
        line.setProduct(product);
        line.setCount(count);
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
