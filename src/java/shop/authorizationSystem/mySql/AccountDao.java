package shop.authorizationSystem.mySql;

import shop.authorizationSystem.beans.Account;
import shop.sql.AbstractDao;
import shop.sql.DaoException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class AccountDao extends AbstractDao<Account, Integer> {
    @Override
    public String getCreateQuery() {
        return "INSERT INTO Accounts (account_login,account_password,account_email," +
                "account_country,account_created) VALUES(?,?,?,?,NOW());";
    }

    @Override
    public String getSelectQuery() {
        return "SELECT * FROM Accounts WHERE account_id=";
    }

    @Override
    public String getSelectAllQuery() {
        return "SELECT * FROM Accounts;";
    }

    @Override
    public String getUpdateQuery() {
        return "UPDATE Accounts SET account_login=?,account_password=?," +
                "account_email=?,account_country=? WHERE account_id=?;";
    }

    @Override
    public String getDeleteQuery() {
        return "DELETE FROM Accounts WHERE account_id=?;";
    }

    @Override
    public Collection<Account> parseResultSet(ResultSet resultSet) throws DaoException {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            while (resultSet.next()){
                Account temp = new Account();

                temp.setId(resultSet.getInt("account_id"));
                temp.setLogin(resultSet.getString("account_login"));
                temp.setPassword(resultSet.getString("account_password"));
                temp.setEmail(resultSet.getString("account_email"));
                temp.setCountry(resultSet.getString("account_country"));
                temp.setCreated(resultSet.getTimestamp("account_created").toLocalDateTime());

                accounts.add(temp);
            }
        } catch (SQLException e) {
            throw new DaoException();
        }
        return accounts;
    }

    @Override
    public void statementUpdate(PreparedStatement statement, Account obj) throws DaoException {
        try {
            statement.setString(1, obj.getLogin());
            statement.setString(2, obj.getPassword());
            statement.setString(3, obj.getEmail());
            statement.setString(4, obj.getCountry());
            statement.setInt(5, obj.getId());
        } catch (SQLException e) {
            throw new DaoException();
        }
    }

    @Override
    public void statementInsert(PreparedStatement statement, Account obj) throws DaoException {
        try {
            statement.setString(1, obj.getLogin());
            statement.setString(2, obj.getPassword());
            statement.setString(3, obj.getEmail());
            statement.setString(4, obj.getCountry());
        } catch (SQLException e) {
            throw new DaoException();
        }
    }
}
