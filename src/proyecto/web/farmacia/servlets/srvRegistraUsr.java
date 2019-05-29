package proyecto.web.farmacia.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@WebServlet(name = "srvRegistraUsr")
public class srvRegistraUsr extends HttpServlet {

    private InitialContext ctx;
    private Conecta con;
    private Statement stm;
    private ResultSet rs;
    public void init () throws ServletException {
        try {
            try {
                ctx = new InitialContext();
                con= new Conecta();
                stm = con.getConexion().createStatement();
            } catch (NamingException ex) {
                Logger.getLogger(srvLogin.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        catch (SQLException se) {
            System.out.println("SQLException: "+se.getMessage());
        }
    }

    public void destroy () {
        try {
            if (rs != null)
                rs.close();
            if (stm != null)
                stm.close();
            if (con != null)
                con.getConexion().close();
            if (ctx != null)
                ctx.close();
        }
        catch (SQLException se) {
            System.out.println("SQLException: "+se.getMessage());
        }
        catch (NamingException ne) {
            System.out.println("NamingException: "+ne.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)throws ServletException, IOException
    {
        try {
            response.setContentType("text/html");
            stm.executeUpdate("INSERT INTO usuarios (correo, password, Tipo) VALUES ('"+request.getParameter("correo")+"','"+request.getParameter("contrasena")+"', 'USER' )");
            PrintWriter html = response.getWriter();

            request.getRequestDispatcher("/registroOk.jsp").include(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(srvLogin.class.getName()).log(Level.SEVERE, null, ex);
        }


    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
