package shop.purchaseSystem.mySql;

import shop.purchaseSystem.beans.Warranty;
import shop.sql.AbstractDao;
import shop.sql.DaoException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collection;

public class WarrantyDao extends AbstractDao<Warranty, Integer> {
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
    public Collection<Warranty> parseResultSet(ResultSet resultSet) throws DaoException {
        return null;
    }

    @Override
    public void statementUpdate(PreparedStatement statement, Warranty obj) throws DaoException {

    }

    @Override
    public void statementInsert(PreparedStatement statement, Warranty obj) throws DaoException {

    }
}
