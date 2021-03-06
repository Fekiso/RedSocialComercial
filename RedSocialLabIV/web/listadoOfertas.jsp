<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="GBD" class="Controlador.GestorBD" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - Comercio</title>

        <jsp:include page="includes.jsp"></jsp:include>

        </head>
        <body >
        <jsp:include page="header.jsp"></jsp:include>
            
        
            <div class="container">
                <div class="row">
                    <div class="col col-md-12">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Cantidad</th>
                                    <th>Precio Oferta</th>
                                    <th>Fecha Inic. Oferta</th>
                                    <th>Dias Vigencia</th>
                                    <th>Titulo</th>
                                    <th>Estado</th>
                                    <th>Comercio</th>
                                    <th>Modificar</th>
                                    <th>Eliminar</th>

                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="oferta" items="${GBD.obtenerOferta()}">
                                <tr>
                                    <td>${oferta.cantidad}</td>
                                    <td>${oferta.precio}</td>
                                    <td>${oferta.fechaInicioOferta}</td>
                                    <td>${oferta.diasVigencia}</td>
                                    <td>${oferta.titulo}</td>
                                      <td>${oferta.estado}</td>
                                    <td>${oferta.comercio.id}</td>

                                    <td> 
                                        <a href="EditarOferta?estado=3&id=${oferta.id} "class="btn btn-success" role="button">Editar</a>
                                    </td>
                                    <td>                                          
                                        <a href="EditarOferta?estado=5&id=${oferta.id}" class="btn btn-danger" role="button">Eliminar</a>
                                    </td>


                                </tr>
                            </c:forEach>
                        </tbody>
                    </table> 
                    <a class="btn btn-primary" href="registroOferta.jsp" role="button">Volver a Alta de Oferta</a>
                    <a class="btn btn-primary" href="home.jsp" role="button">Volver inicio</a>
                </div>
            </div>


            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
