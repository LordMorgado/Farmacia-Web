<%--
  Created by IntelliJ IDEA.
  User: lord_morgado
  Date: 28/05/19
  Time: 09:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    HttpSession conectado=request.getSession();
    if(conectado.getAttribute("correo")!=null) { %>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="">FARMACIA</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sucursales</a>
                </li>
                <%--Medicamentos--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Medicamentos
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="Medicamentos_analgesicos">Analgésicos</a>
                        <a class="dropdown-item" href="">Antiinflamatorios</a>
                        <a class="dropdown-item" href="">Antiácidos</a>
                    </div>
                </li>
                <%--Medicamentos--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <% out.print(request.getSession().getAttribute("correo")); %>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="srvLogout">Cerrar Sesion</a>
                        <a class="dropdown-item" href="#">Editar perfil</a>
                    </div></li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
            </form>
        </div>
    </nav>
</header>
    <%}
    else{
        out.println("" +
                "<header>\n" +
                "    <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\n" +
                "        <a class=\"navbar-brand\" href='' >FARMACIA</a>\n" +
                "        <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n" +
                "            <span class=\"navbar-toggler-icon\"></span>\n" +
                "        </button>\n" +
                "\n" +
                "        <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n" +
                "            <ul class=\"navbar-nav mr-auto\">\n" +
                "                <li class=\"nav-item active\">\n" +
                "                    <a class=\"nav-link\" href=\"index.jsp\">Home <span class=\"sr-only\">(current)</span></a>\n" +
                "                </li>\n" +
                "                <li class=\"nav-item\">\n" +
                "                    <a class=\"nav-link\" href=\"#\">Sucursales</a>\n" +
                "                </li>\n" +
                //
                "                <li class=\"nav-item dropdown\">\n" +
                "                    <a class='nav-link dropdown-toggle' href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
                "                        Medicamentos\n" +
                "                    </a>\n" +
                "                    <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n" +
                "                        <a class=\"dropdown-item\" href='Medicamentos_analgesicos'>Analgésicos</a>\n" +
                "                        <a class=\"dropdown-item\" href=''>Antiinflamatorios</a>\n" +
                "                        <a class=\"dropdown-item\" href=''>Antiácidos</a>\n" +
                "                    </div>\n" +
                "                </li>\n" +
                // Medicamentos
                // Login
                "                <li class=\"nav-item\">\n" +
                "                    <a class=\"nav-link\" href=\"login.jsp\">Login</a>\n" +
                "                </li>\n" +
                // Login
                "            </ul>\n" +
                "            <form class=\"form-inline my-2 my-lg-0\">\n" +
                "                <input class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n" +
                "                <button class=\"btn btn-outline-success my-2 my-sm-0\" type=\"submit\">Buscar</button>\n" +
                "            </form>\n" +
                "        </div>\n" +
                "    </nav>\n" +
                "</header>");
    }%>



