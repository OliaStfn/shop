package shop.sql;

import java.io.Serializable;

public interface Identificator<PK extends Serializable> {
    int getId();
}
