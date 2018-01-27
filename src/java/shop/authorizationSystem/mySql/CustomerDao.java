package shop.authorizationSystem.mySql;

import shop.authorizationSystem.beans.Account;
import shop.authorizationSystem.beans.Customer;
import shop.sql.AbstractDao;
import shop.sql.DaoException;
import shop.sql.MySqlDaoFactory;

import java.sql.*;
import java.util.Collection;

public class CustomerDao extends AbstractDao<Customer,Integer> {
    @Override
    public String getCreateQuery() {
        return "INSERT INTO Customers (person_id, account_id) VALUES (SELECT_LAST_INSERT_ID()),?);";
    }

    @Override
    public String getSelectQuery() {
        return "SELECT * FROM Customers c JOIN Accounts a USING(account_id) " +
                "JOIN Persons p ON(c.person_id=p.person_id) JOIN Person_states USING(state_id) " +
                "JOIN Favorite_lists f ON(c.customer_id=f.customer_id) " +
                "LEFT JOIN Lists_to_products ltp USING(list_id) " +
                "LEFT JOIN Products pr USING(product_id) WHERE c.customer_id=";
    }

    @Override
    public String getSelectAllQuery() {
        return "SELECT * FROM Customers c JOIN Accounts a USING(account_id) " +
                "JOIN Persons p ON(c.person_id=p.person_id) JOIN Person_states USING(state_id) " +
                "JOIN Favorite_lists f ON(c.customer_id=f.customer_id) " +
                "LEFT JOIN Lists_to_products ltp USING(list_id) " +
                "LEFT JOIN Products pr USING(product_id);";
    }

    @Override
    public String getUpdateQuery() {
        return "UPDATE Persons SET person_name=?,person_surname=?,person_born_date=?," +
                "state_id=(SELECT state_id FROM Person_states WHERE state LIKE '?') " +
                "WHERE person_id=(SELECT person_id FROM Customers WHERE customer_id=?);";
    }

    @Override
    public String getDeleteQuery() {
        return "DELETE FROM Customers WHERE customer_id=?;";
    }

    @Override
    public Collection<Customer> parseResultSet(ResultSet resultSet) throws DaoException {
        return null;
    }

    @Override
    public void statementUpdate(PreparedStatement statement, Customer obj) throws DaoException {
        try {
            statement.setString(1,obj.getName());
            statement.setString(2,obj.getSurname());
            statement.setDate(3, Date.valueOf(obj.getBornDate()));
            statement.setString(4,obj.getState().toString());
            statement.setInt(5,obj.getId());
        } catch (SQLException e) {
            throw new DaoException();
        }
    }

    @Override
    public void statementInsert(PreparedStatement statement, Customer obj) throws DaoException {
        try {
            statement.setString(1,obj.getName());
            statement.setString(2,obj.getSurname());
            statement.setDate(3, Date.valueOf(obj.getBornDate()));
            statement.setString(4,obj.getState().toString());
        } catch (SQLException e) {
            throw new DaoException();
        }
    }

    @Override
    public Customer create(Customer object) throws DaoException {
        Connection connection = MySqlDaoFactory.getConnection();
        Customer created;

        AbstractDao dao = (AbstractDao) MySqlDaoFactory.getDao(Account.class);
        Account account = (Account) dao.create(object.getAccount());
        object.setAccount(account);

        String query = "CREATE INTO Persons(person_name,person_surname,person_born_date,state_id) " +
                "VALUES (?,?,?,(SELECT state_id FROM Person_states WHERE state LIKE '?'));";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statementInsert(statement, object);
            statement.executeUpdate();
        } catch (Exception e) {
            throw new DaoException();
        }

        query = getCreateQuery();
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1,object.getAccount().getId());
            statement.executeUpdate();
        } catch (Exception e) {
            throw new DaoException();
        }

        try (PreparedStatement statement = connection.prepareStatement(getSelectQuery())) {
            ResultSet resultSet = statement.executeQuery();
            Collection<Customer> someList = parseResultSet(resultSet);
            created = someList.iterator().next();
        } catch (Exception e) {
            throw new DaoException();
        }

        return created;
    }
}
