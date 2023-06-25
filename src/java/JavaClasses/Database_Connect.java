/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaClasses;

import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.jdbc.pool.PoolProperties;

public class Database_Connect {

    private static String driver_name;
    private static String jdbc_url;
    private static String user_name;
    private static String pass;
    private static Connection con;

    static {
        try {
            Properties p = new Properties();
            InputStream is = Database_Connect.class.getResourceAsStream("db.properties");
            p.load(is);
            driver_name = p.getProperty("driver_class_name");
            jdbc_url = p.getProperty("jdbc_url");
            user_name = p.getProperty("user_name");
            pass = p.getProperty("password");

            PoolProperties pp =new PoolProperties();
            pp.setDriverClassName(driver_name);
            pp.setUrl(jdbc_url);
            pp.setUsername(user_name);
            pp.setPassword(pass);

            DataSource ds = new DataSource();
            ds.setPoolProperties(pp);
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return con;
    }
}
