package shop.purchaseSystem.mySql;

import shop.purchaseSystem.beans.Sale;
import shop.sql.AbstractDao;
import shop.sql.DaoException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collection;

public class SaleDao  extends AbstractDao<Sale,Integer> {
    @Override
    public String getCreateQuery() {
        return null;
    }

    @Override
    public String getSelectQuery() {
        return null;
    }

    @Override
    public String getSelectAllQuery() {
        return null;
    }

    @Override
    public String getUpdateQuery() {
        return null;
    }

    @Override
    public String getDeleteQuery() {
        return null;
    }

    @Override
    public Collection<Sale> parseResultSet(ResultSet resultSet) throws DaoException {
        return null;
    }

    @Override
    public void statementUpdate(PreparedStatement statement, Sale obj) throws DaoException {

    }

    @Override
    public void statementInsert(PreparedStatement statement, Sale obj) throws DaoException {

    }
}
