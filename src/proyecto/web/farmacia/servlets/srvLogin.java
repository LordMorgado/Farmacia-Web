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
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 * Librerías para la conexión
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "srvLogin")
public class srvLogin extends HttpServlet {

    private InitialContext ctx;
    private Conecta con;
    private Statement stm;
    private ResultSet rs, rs2;

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
            rs = stm.executeQuery("select tipo, correo from usuarios where correo='"+request.getParameter("Correo")+"' and password='"+request.getParameter("Contrasena")+"'");
            PrintWriter html = response.getWriter();

            if(rs.next()){
                /**
                 * Se guardan parámetros de la sesion, correo del usuario y el número de compras si este no es admnistrador (0 compras)
                 */
                request.getSession().setAttribute("correo", rs.getString("correo"));

                if(rs.getString("tipo").equals("ADMIN")){
                    /**
                     * bandera que indica si es administrador para uso específico
                     */
                    request.getSession().setAttribute("admin", "SI");
                    response.sendRedirect("index.jsp");
                }else{
                    request.getSession().setAttribute("Compras", 0);
//                    rs2 = stm.executeQuery("select Sesion from pedidos where Nombre='"+request.getParameter("Nombre")+"'");
//                    if(rs2.next()){
//                        request.getSession().setAttribute("Sesion", rs2.getInt("Sesion")+1);
//                    }else{
//                        request.getSession().setAttribute("Sesion", 0);
//                    }
//                    response.sendRedirect("HOMEUSER.jsp");
                    response.sendRedirect("index.jsp");
                }

            }else{
                /**
                 * Si el usuario no existe en la base de datos
                 * aquí puedes cambiarl la pantalla a que se vea con el estilo del proyecto
                 */
                html.append("No has iniciado Sesion");
                html.close();
            }} catch (SQLException ex) {
            Logger.getLogger(srvLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
