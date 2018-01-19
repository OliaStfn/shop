package shop.purchaseSystem.beans;

import shop.sql.Identificator;

import java.time.LocalDate;
import java.time.Period;

public class Warranty implements Identificator<Integer> {
    private int id;
    private LocalDate start;
    private LocalDate expiry;

    public Warranty() {
        id = 0;
        start = LocalDate.now();
        expiry = LocalDate.now();
    }

    public Warranty(Period warranty) {
        id = 0;
        start = LocalDate.now();
        expiry = start.plus(warranty);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getStart() {
        return start;
    }

    public void setStart(LocalDate start) {
        this.start = start;
    }

    public LocalDate getExpiry() {
        return expiry;
    }

    public void setExpiry(LocalDate expiry) {
        this.expiry = expiry;
    }
}
