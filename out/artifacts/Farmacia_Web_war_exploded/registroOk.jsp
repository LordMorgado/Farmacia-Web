<%--
  Created by IntelliJ IDEA.
  User: lord_morgado
  Date: 29/05/19
  Time: 04:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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
    <title>ERROR</title>
</head>
<body>
<!-- HEADER -->
<%@include  file="header.jsp" %>
<!-- CONTENEDOR -->
<article id="contenedor" class="container">
    <h1>Ha sido registrado exitosamente con el correo: ${correo}</h1>
    <form name='form1' method='post' action='index.jsp'>
    <input type='submit' name='boton' id='btnR' class="btn btn-success btn-lg" value='Regresar'>
    </form>
</article>
<!-- Footer -->
<%@include  file="footer.html" %>
<!-- Footer -->
</body>
</html>

