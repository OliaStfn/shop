package shop.authorizationSystem.mySql;

import shop.authorizationSystem.beans.Admin;
import shop.sql.AbstractDao;
import shop.sql.DaoException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collection;

public class AdminDao extends AbstractDao<Admin,Integer>{
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
    public Collection<Admin> parseResultSet(ResultSet resultSet) throws DaoException {
        return null;
    }

    @Override
    public void statementUpdate(PreparedStatement statement, Admin obj) throws DaoException {

    }

    @Override
    public void statementInsert(PreparedStatement statement, Admin obj) throws DaoException {

    }
}
