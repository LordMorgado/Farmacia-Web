<%--
  Created by IntelliJ IDEA.
  User: lord_morgado
  Date: 29/05/19
  Time: 02:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    HttpSession conectado=request.getSession();
    if( conectado.getAttribute("admin")!=null ) {
        %>
        <section class="tarjeta">
            <div class="card">
                <img src="" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"> ${nombre} </h5>
                    <p class="card-text">Marca: ${marca} </p>
                    <p class="card-text">Presentación: ${presentacion}</p>
                    <p class="card-text">Cantidad en existencia: ${cantidad}</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted"> Precio: ${precio}</small>
                    <button class="btn btn-success float-right">Editar</button>
                </div>
            </div>
        </section>
    <%
    }
    else if (conectado.getAttribute("correo")!=null) {
    %>
        <section class="tarjeta">
            <div class="card">
                <img src="" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"> ${nombre} </h5>
                    <p class="card-text">Marca: ${marca} </p>
                    <p class="card-text">Presentación: ${presentacion}</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted"> Precio: ${precio}</small>
                    <button class="btn btn-success float-right">Comprar</button>
                </div>
            </div>
        </section>
    <%
    } else { %>
        <section class="tarjeta">
            <div class="card">
                <img src="" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"> ${nombre} </h5>
                    <p class="card-text">Marca: ${marca} </p>
                    <p class="card-text">Presentación: ${presentacion}</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted"> Precio: ${precio}</small>
                </div>
            </div>
        </section>
    <%
    }%>


