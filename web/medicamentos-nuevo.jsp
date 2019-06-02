<%--
  Created by IntelliJ IDEA.
  User: lord_morgado
  Date: 1/06/19
  Time: 02:15 AM
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
    if(request.getSession().getAttribute("admin")!=null ) {
%>
<article id="contenedor" class="container">

    <div class="d-flex justify-content-center">
        <div class="card">
            <div class="card-header">
                <h4>Nuevo Medicamento</h4>
            </div>

            <div class="card-body">
                <form name="form1" id="form1" method="post" action="guardaMed">
                    <input type="hidden" name="imagen" value="med1.jpg">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="nombre del medicamento" name="nombre" required>
                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Marca" name="marca" required>
                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Presentación" name="presentacion" required>
                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="$0.00 MXN" name="precio" required>
                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="ingresa la cantidad del producto" name="cantidad" required>
                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <select name="tipo" class="form-control">
                            <option value="analgesico">analgesico</option>
                            <option value="antiinflamatorio">antiinflamatorio</option>
                            <option value="respiratorio">respiratorio</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <input type="submit" value="Guardar" class="btn float-right btn-dark">
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

