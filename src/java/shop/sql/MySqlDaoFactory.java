package shop.sql;

import org.apache.log4j.Logger;
import shop.authorizationSystem.beans.Admin;
import shop.authorizationSystem.mySql.AdminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class MySqlDaoFactory {
    private static final Logger log = Logger.getLogger(MySqlDaoFactory.class);
    private static String driverName = "com.mysql.jdbc.Driver";
    private static String URL = "jdbc:mysql://localhost/shop?useSSL=false";
    private static String USERNAME = "root";
    private static String PASSWORD = "";
    private static final Map<Class, GenericDao> allDao;
    static {
        allDao = new HashMap<Class, GenericDao>();
        allDao.put(Admin.class, new AdminDao());
    }

    public static Connection getConnection() throws DaoException {
        Connection connection = null;

        try {
            Class.forName(driverName); // Завантажуємо клас драйвера
        } catch (ClassNotFoundException e) {
            log.error("Driver JDBC has NOT get");
            log.error(e.getMessage());
        }

        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            log.info("The successful connection for DB");
        } catch (SQLException e) {
            log.error("Failed connection for DB");
            log.error(e.getMessage());
        }
        return connection;
    }

    public static GenericDao getDao(Class daoClass) throws DaoException {
        GenericDao dao = allDao.get(daoClass);
        if (dao== null){
            log.error("Dao for "+daoClass+" not found");
        }
        return dao;
    }
}