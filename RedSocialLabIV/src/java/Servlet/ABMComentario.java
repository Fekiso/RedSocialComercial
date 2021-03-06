package Servlet;

import Controlador.GestorBD;
import Modelo.*;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ABMComentario", urlPatterns = {"/ABMComentario"})
public class ABMComentario extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       if (request.getSession().getAttribute("USER") != null) {
            String modo = request.getParameter("modo");
            if (modo.equals("alta")) {
                request.setAttribute("titulo", "Home - Comentarios");
                RequestDispatcher rd = request.getRequestDispatcher("/homeUsuario.jsp");
                rd.forward(request, response);
            } else if (modo.equals("editar")) {
                //Tomar parámetro idCurso, buscar en BD y devolver objeto Curso
                int idCurso = Integer.parseInt(request.getParameter("idCurso"));
                GestorCursos gestor = new GestorCursos();
                Curso cursoEdit = gestor.getCurso(idCurso);

                //Setear atributos y enviar petición
                request.setAttribute("titulo", "Editar Curso");
                request.setAttribute("curso", cursoEdit);
                RequestDispatcher rd = request.getRequestDispatcher("/datosCurso.jsp");
                rd.forward(request, response);
            } else if (modo.equals("cambiarEstado")) {
                //Tomar parámetro idCurso, buscar en BD y cambiar estado
                int idCurso = Integer.parseInt(request.getParameter("idCurso"));
                // No llegué...
            }
        } else {
            request.getSession().setAttribute("mensajeError", "Error. Sesión no iniciada");
            RequestDispatcher rd = request.getRequestDispatcher("/Login");
            rd.forward(request, response);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         if (request.getSession().getAttribute("usr") != null) {
            //Codificar correctamente los caracteres enviados a la BD
            request.setCharacterEncoding("UTF-8");

            //Tomar parámetros del form y crear objeto Curso
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            float costo = Float.parseFloat(request.getParameter("costo"));            
            String imagenUrl = request.getParameter("imagenUrl");
            boolean activo = Boolean.parseBoolean(request.getParameter("activo"));            
            int idCurso = Integer.parseInt(request.getParameter("idCurso"));

            Curso curso = new Curso(idCurso, nombre, descripcion, costo, imagenUrl, activo);
            GestorCursos gestor = new GestorCursos();

            //Chequear si viene desde la opción Alta o Editar
            if (idCurso == 0) {
                gestor.agregarCurso(curso);
            } else {                
                gestor.modificarCurso(curso);
            }

            //Redirigir al Listado por GET
            response.sendRedirect(getServletContext().getContextPath() + "/ListadoCursos");
        
        } else {            
            //Redirigir al Login por GET
            request.getSession().setAttribute("mensajeError", "Error. Sesión no iniciada");
            response.sendRedirect(getServletContext().getContextPath() + "/Login");
            
        }
    }

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
