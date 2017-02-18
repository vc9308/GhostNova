package com.ghostNova.db;

import com.mysql.fabric.xmlrpc.base.Data;

import java.sql.*;

/**
 * Created by victor on 6/5/16.
 */

public class DatabaseConnection {
    private final String DBDRIVER = "com.mysql.jdbc.Driver";
    private final String DBURL = "jdbc:mysql://localhost/Ghost_Nova?useUnicode=true&characterEncoding=UTF-8";
    private final String USERNAME = "root";
    private final String PASSWORD = "ipupodZ1";

    private Connection cn = null;

    public DatabaseConnection() {
        try {
            Class.forName(DBDRIVER);
            this.cn = DriverManager.getConnection(DBURL, USERNAME, PASSWORD);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public Connection getConnection() {
        return cn;
    }

    public void close() {
        try {
            cn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
