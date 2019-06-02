package proyecto.web.farmacia.servlets;

import javax.naming.InitialContext;
import javax.naming.NamingException;
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

@WebServlet(name = "srvRegistraMed")
public class srvRegistraMed extends HttpServlet {
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
            stm.executeUpdate("INSERT INTO medicamentos (nombre, marca, presentacion, precio, cantidad, tipo, imagen ) VALUES ('"+request.getParameter("nombre")+"','"+request.getParameter("marca")+"', '" + request.getParameter("presentacion") + "', " + request.getParameter("precio") +", "+ request.getParameter("cantidad") +", '"+ request.getParameter("tipo") +"', '"+request.getParameter("imagen")+"')");
            PrintWriter html = response.getWriter();

            request.getRequestDispatcher("/index.jsp").include(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(srvRegistraMed.class.getName()).log(Level.SEVERE, null, ex);
        }


    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
