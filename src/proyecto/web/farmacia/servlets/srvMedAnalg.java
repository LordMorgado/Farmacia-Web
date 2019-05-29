package proyecto.web.farmacia.servlets;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
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

@WebServlet(name = "Medicamentos_analgesicos")
public class srvMedAnalg extends HttpServlet {

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            /**
             * extraFileLocation hace referencia al lugar donde están almacenados los archivos del directorio 'web'
             * dentro del servidor
             */
            String extraFileLocation = request.getContextPath() + "/";

            out.println(""
            +
                    "<html>\n" +
                    "<head><!-- JavaScript -->\n" +
                    "    <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n" +
                    "    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n" +
                    "    <script src='"+ extraFileLocation +"js/bootstrap.bundle.min.js'></script>\n" +
                    "    <script src='"+ extraFileLocation +"js/bootstrap.min.js'></script>\n" +
                    "    <!-- Bootstrap CSS -->\n" +
                    "    <link rel=\"stylesheet\" href='"+ extraFileLocation +"css/bootstrap.min.css'>\n" +
                    "    <link rel=\"stylesheet\" href='"+ extraFileLocation +"css/bootstrap-grid.min.css'>\n" +
                    "    <link rel=\"stylesheet\" href='"+ extraFileLocation +"css/bootstrap-reboot.min.css'>\n" +
                    "    <!-- Required meta tags -->\n" +
                    "    <meta charset=\"utf-8\">\n" +
                    "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n" +
                    "\n" +
                    "    <!--CSS del proyecto -->\n" +
                    "    <link rel=\"stylesheet\" href='"+ extraFileLocation +"css/home.css'>\n" +
                    "    <link rel=\"stylesheet\" href='"+ extraFileLocation +"css/footer.css'>\n" +
                    "    <title>Analgésicos</title>\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "\n" +
                    "<!-- HEADER -->\n");
            request.getRequestDispatcher("/header.jsp").include(request, response);

            // CONTENEDOR
            out.println("<!-- CONTENEDOR -->\n" +
                    "<article id=\"contenedor\" class=\"container\">");

            if(request.getSession().getAttribute("correo")!=null) {

                rs = stm.executeQuery("select nombre, marca, presentacion, precio, cantidad from medicamentos where tipo = 'analgesico'");

                while(rs.next()){
                    /**
                     * Se envían los registros que son el resultado del query al archivo jsp para que sean presentdos
                     * mediante tarjetas
                     */
                    request.setAttribute("nombre", rs.getString("nombre"));
                    request.setAttribute("marca", rs.getString("marca"));
                    request.setAttribute("presentacion", rs.getString("presentacion"));
                    request.setAttribute("precio", rs.getDouble("precio"));
                    request.setAttribute("cantidad", rs.getInt("cantidad"));
                    request.getRequestDispatcher("/medicamentos-analgesicos.jsp").include(request, response);
                }

            }
            else{

                rs = stm.executeQuery("select nombre, marca, presentacion, precio from medicamentos where tipo = 'analgesico'");

                while(rs.next()){
                    /**
                     * Se envían los registros que son el resultado del query al archivo jsp para que sean presentdos
                     * mediante tarjetas
                     */
                    request.setAttribute("nombre", rs.getString("nombre"));
                    request.setAttribute("marca", rs.getString("marca"));
                    request.setAttribute("presentacion", rs.getString("presentacion"));
                    request.setAttribute("precio", rs.getDouble("precio"));
                    request.getRequestDispatcher("/medicamentos-analgesicos.jsp").include(request, response);
                }
            }

            out.println("" +
                    "</article>\n" +
                    "<!-- Footer -->\n");
            request.getRequestDispatcher("/footer.html").include(request, response);
                    out.println("<!-- Footer -->\n" +
                    "\n" +
                    "</body>\n" +
                    "</html>\n");

        } catch (SQLException ex) {
            Logger.getLogger(srvLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
