package com.groupnine.travelbuddy.TBBase;

import org.apache.commons.configuration2.Configuration;
import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.commons.configuration2.builder.FileBasedConfigurationBuilder;
import org.apache.commons.configuration2.builder.fluent.Parameters;
import org.apache.commons.configuration2.ex.ConfigurationException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TBBaseConnection {
    private final String host;
    private final String userName;
    private final String userPass;
    private Connection connection;

    public TBBaseConnection() throws ConfigurationException {
        Configuration configuration = loadConfiguration();
        this.host = configuration.getString("db.host");
        this.userName = configuration.getString("db.username");
        this.userPass = configuration.getString("db.password");
    }

    private PropertiesConfiguration loadConfiguration() throws ConfigurationException {
        FileBasedConfigurationBuilder<PropertiesConfiguration> builder =
                new FileBasedConfigurationBuilder<>(PropertiesConfiguration.class)
                        .configure(new Parameters().properties().setFileName("config.properties"));
        return builder.getConfiguration();
    }

    private void initializeConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(host, userName, userPass);
    }

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        if (connection == null || connection.isClosed()) {
            initializeConnection();
        }
        return connection;
    }

    public void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}