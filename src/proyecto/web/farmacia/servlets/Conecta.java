package proyecto.web.farmacia.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Conecta {

    private String url="jdbc:mysql://localhost:3306/farmacia?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private String usuario="username";
    private String contra="password";

    private Connection cnx;
    static PreparedStatement stm;
    static ResultSet rs;

    public Conecta() throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cnx=DriverManager.getConnection(url,usuario,contra);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conecta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConexion(){
        return cnx;
    }
}

