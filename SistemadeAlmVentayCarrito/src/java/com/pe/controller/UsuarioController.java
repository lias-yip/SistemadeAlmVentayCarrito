/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.controller;

import com.pe.DAO.UsuarioDAO;
import com.pe.model.entity.Usuario;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

//Esta anotación @MultipartConfig se utiliza para especificar la configuración relacionada con el manejo de solicitudes multipartes. 
//Este tipo de solicitudes se utiliza comúnmente cuando se espera la carga de archivos a través de formularios HTML.
@MultipartConfig(
        //Este parámetro establece el umbral de tamaño para el manejo de archivos en memoria antes de almacenarlos en disco.
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        //Este parámetro establece el tamaño máximo permitido para un archivo individual.
        maxFileSize = 1024 * 1024 * 10, // 10MB
        //Este parámetro establece el tamaño máximo total permitido para la solicitud multipartes.
        maxRequestSize = 1024 * 1024 * 50)

public class UsuarioController extends HttpServlet {

    int id; //Un atributo entero
    // Instancia de la clase UsuarioDAO que se utilizará para interactuar con la base de datos en relación con la entidad Usuario.
    UsuarioDAO usuarioDao = new UsuarioDAO();
    //Instancia de la clase Usuario
    Usuario usuario = new Usuario();
    UsuarioDAO usuDAO;
    DecimalFormat dfusu;

    //Una constante que especifica el directorio donde se guardarán las imágenes.
    public static final String UPLOAD_DIR = "images";
    //Una variable de cadena que se utiliza para almacenar el nombre del archivo de la primera imagen asociada a un usuario.
    public String dbFileName1 = "";

    public UsuarioController() {
        usuDAO = new UsuarioDAO();
        //Un objeto DecimalFormat llamado dfusu, que se utiliza para formatear números como cadenas con un patrón específico "000000";
        dfusu = new DecimalFormat("000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("add")) {
            this.add(request, response);
        }
        if (accion.equals("Actualizar")) {
            this.Edit(request, response);
        }
        if (accion.equals("editar")) {
            this.Editar(request, response);
        }
        if (accion.equals("detalle")) {
            this.Detalle(request, response);
        }
        if (accion.equals("eliminar")) {
            this.eliminar(request, response);
        }
        if (accion.equals("Limpiar")) {
            this.Limpiar(request, response);
        }
    }
//Este método es responsable de procesar la solicitud de agregar un nuevo usuario.

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Se instancia un nuevo objeto Usuario llamado usu.
        Usuario usu = new Usuario();
        //Se obtienen los parámetros de la solicitud que contienen la información del nuevo usuario, como nombre, sueldo, etc.
        String nombre = request.getParameter("txtNombre");
        String numDoc = request.getParameter("Txtdni");
        String sueldo = request.getParameter("Txtsueldo");
        String telefono = request.getParameter("Txttelefono");
        String direccion = request.getParameter("Txtdireccion");
        String email = request.getParameter("Txtemail");
        String fechaderegistro = request.getParameter("Txtfechaderegistro");
        String Usua = request.getParameter("txtusu");
        String pass = request.getParameter("txtpassword");
        String rol = request.getParameter("txtrol");
        //Se genera un código para el usuario
        int Nusuarios = usuDAO.BuscarNusuarios();
        Nusuarios = Nusuarios + 1;
        String format = dfusu.format(Nusuarios);
        //manejo de la subida de archivos
        Part part = request.getPart("file1");
        String fileName1 = extractFileName(part);//file name
        //Se configuran las rutas para guardar el archivo de imagen y se almacena en el sistema.
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        if (fileName1 != null && !fileName1.isEmpty()) {
            // Procesar el archivo subido
            String savePath1 = uploadPath + File.separator + fileName1;
            String dbFileName1 = UPLOAD_DIR + File.separator + fileName1;

            //Imagen1
            System.out.println("savePath: " + savePath1);
            String sRootPath = new File(savePath1).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part.write(savePath1 + File.separator);
            File fileSaveDir1 = new File(savePath1);
            dbFileName1 = UPLOAD_DIR + File.separator + fileName1;
            part.write(savePath1 + File.separator);

            // Verificar si se ha subido algún archivo
            // Guardar en el objeto Usuario
            usu.setFilename1(dbFileName1);
            usu.setPath1(savePath1);
        } else {
            // Manejar el caso donde no se subió ningún archivo
            usu.setFilename1(""); // O podrías asignar un valor predeterminado si es necesario
            usu.setPath1("");
        }

// Resto del código...
        //Se configuran los atributos del objeto Usuario con los valores obtenidos de los parámetros de la solicitud 
        //y del manejo de archivos.
        usu.setCodigo(format);
        usu.setNombre(nombre);
        usu.setIdTipodocumento(1);
        usu.setNrodocumento(numDoc);
        usu.setSueldo(Double.parseDouble(sueldo));
        usu.setTelefono(telefono);
        usu.setDireccion(direccion);
        usu.setEmail(email);
        usu.setFechaderegistro(fechaderegistro);
        usu.setUsu(Usua);
        usu.setPassword(pass);
        usu.setRol(rol);;
        usu.setIdcliente(0);
        usu.setEstado("Activo");

        UsuarioDAO usudao = new UsuarioDAO();
        boolean validacion = false;
        validacion = usudao.vali(usu);
        if (validacion == true) {
            response.getWriter().print("yaexiste");
        } else {
            if (usudao.addimg(usu)) {
                response.getWriter().print("ok");
            } else {
                response.getWriter().print("no ha sido registrado correctamente");
            }
        }
    }

    private void Editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idusu", request.getParameter("id"));
        request.getRequestDispatcher("EditarUsuario.jsp").forward(
                request, response);
    }

    private void Detalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idusu", request.getParameter("id"));
        request.getRequestDispatcher("DetalleUsuario.jsp").forward(
                request, response);
    }

    private void Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
//        int idempleados = Integer.parseInt(request.getParameter("txtidempleado"));
        String nombre = request.getParameter("Txtnombre");
        String usuarios = request.getParameter("Txtnomusu");
        String pass = request.getParameter("Txtpass");
        String rol = request.getParameter("Txtrol");
        String imgactual = request.getParameter("txtImagen");
        Part part = request.getPart("txtModificarImagen");//

        usuario.setId(id);
        usuario.setNombre(nombre);
        usuario.setUsu(usuarios);
        usuario.setPassword(pass);
        usuario.setRol(rol);

        String imagen = request.getParameter("selected");

        if (imagen.equals("SelectImagenActual")) {
            usuario.setFilename1(imgactual);
            usuario.setPath1(imgactual);

        } else {
            String fileName1 = extractFileName(part);//file name
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println("applicationPath:" + applicationPath);
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath1 = uploadPath + File.separator + fileName1;

            //Imagen1
            System.out.println("savePath: " + savePath1);
            String sRootPath = new File(savePath1).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part.write(savePath1 + File.separator);
            File fileSaveDir1 = new File(savePath1);
            dbFileName1 = UPLOAD_DIR + File.separator + fileName1;
            part.write(savePath1 + File.separator);
            usuario.setFilename1(dbFileName1);
            usuario.setPath1(savePath1);
        }

        
        
        
        if (usuDAO.Editimgg(usuario)) {
            response.getWriter().print("ok");

        } else {
            response.getWriter().print("El cliente no ha sido registrado");

        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idUsu"));
        System.out.println("[ID] " + id);
        usuDAO.Eliminar(id);
    }

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    private void Limpiar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("usuario");
        request.getSession().removeAttribute("tipo");
        response.sendRedirect("login.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
