<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Modelo.Oferta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:useBean id="GestorBD" class="Controlador.GestorBD" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - Comercio</title>

        <jsp:include page="includes.jsp"></jsp:include>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#fechaInicio").datepicker({
                        dateFormat: "dd-mm-yy"
                    });
                    $("#fechaInicio").val(getToday());
                });
            </script>  

        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <div class="col col-md-12">
                        <div class="form form-horizontal jumbotron col-md-6 col-md-push-3" >
                            <h3>Editar Oferta:</h3>
                            <br/> 
                            <form action="EditarOferta?estado=4&id=${oferta.id}" method="post">
                            <input type="hidden" name="idOferta" value="${oferta.id}"/>
                                <div class="form-group col-md-12">
                                </div>
                                <div class="form-group col-md-7">
                                    <label>Cantidad:</label>
                                    <input type="number" min="0" id="cantidad"  class="form-control" name="txtCantidad" value="${oferta.cantidad}"/>
                                </div>

                                <div class="form-group col-md-12">
                                </div>
                                <div class="form-group col-md-7">
                                    <label>Ingrese precio ($):</label>
                                    <input type="text" name="txtPrecio" id="precio" class="form-control" value="${oferta.precio}"/>
                                </div>

                                <div class="form-group col-md-12">
                                </div>
                                <div class="form-group col-md-7">
                                    <label>Fecha </label>
                                    <input type="text" name="txtFechaInicioOferta" class="form-control" id="fechaInicioOferta" value="${oferta.fechaInicioOferta}"/>
                                </div>


                                <div class="form-group col-md-12">
                                </div>
                                <div class="form-group col-md-7">
                                    <label>Dias Vigencia:</label>
                                    <input type="number" min="0" id="diasVigencia" data-min="0" class="form-control" name="txtDiasVigencia" value="${oferta.diasVigencia}"/>

                                    <div class="form-group col-md-12">
                                    </div>
                                    <div class="form-group col-md-7">
                                        <label>Titulo:</label>
                                        <input type="text" id="titulo" class="form-control" name="txtTitulo" value="${oferta.titulo}"/>
                                    </div>


                                    <div class="form-group col-md-12">
                                    </div>
                                    <div class="form-group col-md-7">
                                        <label>Comercio: </label>
                                        <select id="comercio" name="cboComercio" class="form-control">
                                            <option>-- Seleccione --</option>

                                        <c:forEach var="item" items="${GestorBD.obtenerComercios()}">
                                            
                                            <option value="${item.getId()}"<c:if test="${item.getId() == oferta.comercio.getId()}">selected</c:if>> ${item} </option>
                                        </c:forEach>   

                                    </select>
                                </div>




                                <div class="form-group col-md-12">
                                </div>
                                <div class="form-group pull-right">
                                    <input type="submit" name="estado" value="Actualizar"> <br>

                                </div>

                                <a href="home.jsp" class="btn btn-primary form-control" role="button">Volver al Menu</a>

                        </form>
                    </div>
                </div>
            </div>
        </div>   

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
