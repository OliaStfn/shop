package shop.sql;

import java.io.Serializable;
import java.util.Collection;

public interface GenericDao<T, PK extends Serializable> {
    public T create(T object) throws DaoException;
    public T read(PK key)throws DaoException;
    public void update(T obj)throws DaoException;
    public void delete(T obj)throws DaoException;
    public Collection<T> readAll()throws DaoException;
}
