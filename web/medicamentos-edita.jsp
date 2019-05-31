<%--
  Created by IntelliJ IDEA.
  User: lord_morgado
  Date: 30/05/19
  Time: 12:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--CSS del proyecto -->
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/footer.css">
    <title>Edita medicamento</title>
</head>
<body>
<!-- HEADER -->
<%@include  file="header.jsp" %>
<!-- CONTENEDOR -->
<%
    // && request.getSession().getAttribute("admin")!=null
    if(request.getParameter("nombre")!=null ) {
        request.setAttribute("name", request.getParameter("nombre"));
        %>
        <article id="contenedor" class="container">

    <div class="d-flex justify-content-center">
        <div class="card">
            <div class="card-header">
                <h4><% out.print(request.getParameter("nombre")); %></h4>
                <div class="card-body">
                    <p class="card-text">Marca: <% out.print(request.getParameter("marca")); %></p>
                    <p class="card-text">Presentación: <% out.print(request.getParameter("presentacion")); %></p>
                </div>
            </div>
            <div class="card-body">
                <form name="form1" id="form1" method="post" action="editarMed">
                    <input type="hidden" name="name" value="<% out.print(request.getParameter("nombre")); %>">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" value="<% out.print(request.getParameter("cantidad")); %>" placeholder="ingresa la cantidad del producto" name="cantidad" required>
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="text" class="form-control" value="<% out.print(request.getParameter("precio")); %>" placeholder="$0.00 MXN" name="precio" required>
                    </div>

                    <div class="form-group">
                        <input type="submit" onclick="form.action='srvDelete';" value="Elimina" class="btn float-left btn-danger">
                        <input type="submit" value="Actualiza" class="btn float-right btn-dark">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center links">
                    Farmacia Marranitos
                </div>
            </div>
        </div>
    </div>

</article>
<%
    }else {
        response.sendRedirect("notFound.jsp");
    }
%>

<!-- Footer -->
<%@include  file="footer.html" %>
<!-- Footer -->
</body>
</html>
