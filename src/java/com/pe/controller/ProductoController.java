/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.controller;

import com.pe.DAO.ProductoDAO;
import com.pe.model.entity.Producto;
import java.io.IOException;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author yenny
 */
@MultipartConfig(
        //Este parámetro establece el umbral de tamaño para el manejo de archivos en memoria antes de almacenarlos en disco.
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        //Este parámetro establece el tamaño máximo permitido para un archivo individual.
        maxFileSize = 1024 * 1024 * 10, // 10MB
        //Este parámetro establece el tamaño máximo total permitido para la solicitud multipartes.
        maxRequestSize = 1024 * 1024 * 50)

public class ProductoController extends HttpServlet {

    int id;
    Producto p = new Producto();
    ProductoDAO pdao = new ProductoDAO();
    //Una constante que especifica el directorio donde se guardarán las imágenes.
    public static final String UPLOAD_DIR = "images";
    //Una variable de cadena que se utiliza para almacenar el nombre del archivo de la primera imagen asociada a un usuario.
    public String dbFileName1 = "";
    public String dbFileName2 = "";
    public String dbFileName3 = "";
    public String dbFileName4 = "";
    public String dbFileName5 = "";
    public String dbFileName6 = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("add")) {
            this.add(request, response);
        }
        if (accion.equals("addimg")) {
            this.addimg(request, response);
        }
        if (accion.equals("editar")) {
            this.Editar(request, response);
        }
        if (accion.equals("actualizarimg")) {
            this.Editimg(request, response);
        }
        if (accion.equals("detalle")) {
            this.Detalle(request, response);
        }
        if (accion.equals("Editarstockminmax")) {
            this.Editarstockminmax(request, response);
        }
        if (accion.equals("eliminar")) {
            this.eliminar(request, response);
        }
        if (accion.equals("estado")) {
            this.estado(request, response);
        }
    }
//Este método es responsable de procesar la solicitud de agregar un nuevo usuario.

    private void addimg(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p = new Producto();
        String codigo = request.getParameter("Txtcodigo");
        String descripcion = request.getParameter("Txtdescripcion");
        int clasi = Integer.parseInt(request.getParameter("Txtmarca"));
        int categoria = Integer.parseInt(request.getParameter("Txtcategoria"));
        int unidadv = Integer.parseInt(request.getParameter("Txtunidadv"));
        String Codanexo = request.getParameter("Txtcodanexo");
        double pventa = Double.parseDouble(request.getParameter("Txtpventa"));
        String fecha = request.getParameter("Txtfechaderegistro");
        String obser = request.getParameter("Txtobser");

        //manejo de la subida de archivos
        Part part1 = request.getPart("file1");
        String fileName1 = extractFileName(part1);//file name
        Part part2 = request.getPart("file2");
        String fileName2 = extractFileName(part2);//file name
        Part part3 = request.getPart("file3");
        String fileName3 = extractFileName(part3);//file name
        Part part4 = request.getPart("file4");
        String fileName4 = extractFileName(part4);//file name
        Part part5 = request.getPart("file5");
        String fileName5 = extractFileName(part5);//file name
        Part part6 = request.getPart("file6");
        String fileName6 = extractFileName(part6);//file name

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
            String sRootPath1 = new File(savePath1).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath1);
            part1.write(savePath1 + File.separator);
            File fileSaveDir1 = new File(savePath1);
            dbFileName1 = UPLOAD_DIR + File.separator + fileName1;
            part1.write(savePath1 + File.separator);
            // Guardar en el objeto Usuario
            p.setFilename1(dbFileName1);
            p.setPath1(savePath1);
        } else {
            // Manejar el caso donde no se subió ningún archivo
            p.setFilename1(""); // O podrías asignar un valor predeterminado si es necesario
            p.setPath1("");
        }

        if (fileName2 != null && !fileName2.isEmpty()) {
            // Procesar el archivo subido
            String savePath2 = uploadPath + File.separator + fileName2;
            String dbFileName2 = UPLOAD_DIR + File.separator + fileName2;
            //Imagen2
            System.out.println("savePath: " + savePath2);
            String sRootPath2 = new File(savePath2).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath2);
            part2.write(savePath2 + File.separator);
            File fileSaveDir2 = new File(savePath2);
            dbFileName2 = UPLOAD_DIR + File.separator + fileName2;
            part2.write(savePath2 + File.separator);

            p.setFilename2(dbFileName2);
            p.setPath2(savePath2);

        } else {
            p.setFilename2(""); // O podrías asignar un valor predeterminado si es necesario
            p.setPath2("");
        }

        if (fileName3 != null && !fileName3.isEmpty()) {
            // Procesar el archivo subido
            String savePath3 = uploadPath + File.separator + fileName3;
            String dbFileName3 = UPLOAD_DIR + File.separator + fileName3;

            //Imagen3
            System.out.println("savePath: " + savePath3);
            String sRootPath3 = new File(savePath3).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath3);
            part3.write(savePath3 + File.separator);
            File fileSaveDir3 = new File(savePath3);
            dbFileName3 = UPLOAD_DIR + File.separator + fileName3;
            part3.write(savePath3 + File.separator);

            p.setFilename3(dbFileName3);
            p.setPath3(savePath3);
        } else {
            p.setFilename3(""); // O podrías asignar un valor predeterminado si es necesario
            p.setPath3("");
        }

        if (fileName4 != null && !fileName4.isEmpty()) {
            // Procesar el archivo subido
            String savePath4 = uploadPath + File.separator + fileName4;
            String dbFileName4 = UPLOAD_DIR + File.separator + fileName4;
            //Imagen4
            System.out.println("savePath: " + savePath4);
            String sRootPath4 = new File(savePath4).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath4);
            part4.write(savePath4 + File.separator);
            File fileSaveDir4 = new File(savePath4);
            dbFileName4 = UPLOAD_DIR + File.separator + fileName4;
            part4.write(savePath4 + File.separator);
            // Guardar en el objeto Usuario
            p.setFilename4(dbFileName4);
            p.setPath4(savePath4);
        } else {
            p.setFilename4(""); // O podrías asignar un valor predeterminado si es necesario
            p.setPath4("");
        }

        if (fileName5 != null && !fileName5.isEmpty()) {
            // Procesar el archivo subido
            String savePath5 = uploadPath + File.separator + fileName5;
            String dbFileName5 = UPLOAD_DIR + File.separator + fileName5;

            //Imagen5
            System.out.println("savePath: " + savePath5);
            String sRootPath5 = new File(savePath5).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath5);
            part5.write(savePath5 + File.separator);
            File fileSaveDir5 = new File(savePath5);
            dbFileName5 = UPLOAD_DIR + File.separator + fileName5;
            part5.write(savePath5 + File.separator);

            p.setFilename5(dbFileName5);
            p.setPath5(savePath5);
        } else {
            p.setFilename5(""); // O podrías asignar un valor predeterminado si es necesario
            p.setPath5("");
        }

        if (fileName6 != null && !fileName6.isEmpty()) {
            String savePath6 = uploadPath + File.separator + fileName6;
            String dbFileName6 = UPLOAD_DIR + File.separator + fileName6;

            //Imagen6
            System.out.println("savePath: " + savePath6);
            String sRootPath6 = new File(savePath6).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath6);
            part6.write(savePath6 + File.separator);
            File fileSaveDir6 = new File(savePath6);
            dbFileName6 = UPLOAD_DIR + File.separator + fileName6;
            part6.write(savePath6 + File.separator);
            // Guardar en el objeto Usuario
            p.setFilename6(dbFileName6);
            p.setPath6(savePath6);
        } else {
            p.setFilename6(""); // O podrías asignar un valor predeterminado si es necesario
            p.setPath6("");
        }

        p.setCodigo(codigo);
        p.setDescripcion(descripcion);
        p.setIdclasi(clasi);
        p.setIdcategoria(categoria);
        p.setIduventa(unidadv);
        p.setMoneda("Soles");
        p.setCodigoanexo(Codanexo);
        p.setPreciocompra(0);
        p.setPrecioVenta(pventa);
        p.setFechaRegistro(fecha);
        p.setObser(obser);
        p.setStock(0.00);
        p.setStockminimo(0.00);
        p.setStockmaximo(0.00);
        p.setEstado("Activo");
        ProductoDAO prodao = new ProductoDAO();
        boolean validacion = false;
        validacion = prodao.validacion(Codanexo);
        if (validacion == true) {
            response.getWriter().print("yaexiste");
        } else {
            if (prodao.addimg(p)) {
                response.getWriter().print("ok");
            } else {
                response.getWriter().print("no ha sido registrado correctamente");
            }
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto p = new Producto();
        String codigo = request.getParameter("Txtcodigo");
        String descripcion = request.getParameter("Txtdescripcion");
        int clasi = Integer.parseInt(request.getParameter("Txtmarca"));
        int categoria = Integer.parseInt(request.getParameter("Txtcategoria"));
        int unidadv = Integer.parseInt(request.getParameter("Txtunidadv"));
        String Codanexo = request.getParameter("Txtcodanexo");
        double pcompra = Double.parseDouble(request.getParameter("Txtpcompra"));
        double pventa = Double.parseDouble(request.getParameter("Txtpventa"));
        String fecha = request.getParameter("Txtfechaderegistro");
        String obser = request.getParameter("Txtobser");

        p.setCodigo(codigo);
        p.setDescripcion(descripcion);
        p.setIdclasi(clasi);
        p.setIdcategoria(categoria);
        p.setIduventa(unidadv);
        p.setMoneda("Soles");
        p.setCodigoanexo(Codanexo);
        p.setPreciocompra(pcompra);
        p.setPrecioVenta(pventa);
        p.setFechaRegistro(fecha);
        p.setObser(obser);
        p.setStock(0.00);
        p.setStockminimo(0.00);
        p.setStockmaximo(0.00);
        p.setEstado("Activo");
        ProductoDAO prodao = new ProductoDAO();
        boolean validacion = false;
        validacion = prodao.validacion(Codanexo);
        if (validacion == true) {
            response.getWriter().print("yaexiste");
        } else {
            if (prodao.add(p)) {
                response.getWriter().print("ok");

            } else {
                response.getWriter().print("no ha sido registrado correctamente");

            }
        }
    }

    private void Editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idpro", request.getParameter("id"));
        request.getRequestDispatcher("EditarProducto.jsp").forward(
                request, response);
    }

    private void Detalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idpro", request.getParameter("id"));
        request.getRequestDispatcher("DetalleProducto.jsp").forward(
                request, response);
    }

    private void Editimg(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        String codigo = request.getParameter("Txtcodigo");
        String descripcion = request.getParameter("Txtdescripcion");
        int clasi = Integer.parseInt(request.getParameter("Txtmarca"));
        int categoria = Integer.parseInt(request.getParameter("Txtcategoria"));
        int unidadv = Integer.parseInt(request.getParameter("Txtunidadv"));
        String Codanexo = request.getParameter("Txtcodanexo");
        String pventa = request.getParameter("Txtpventa");
        String fecha = request.getParameter("Txtfechaderegistro");
        String observ = request.getParameter("Txtobser");

        String imgactual1 = request.getParameter("txtImagen1");
        Part part1 = request.getPart("txtModificarImagen1");//
        String imgactual2 = request.getParameter("txtImagen2");
        Part part2 = request.getPart("txtModificarImagen2");//
        String imgactual3 = request.getParameter("txtImagen3");
        Part part3 = request.getPart("txtModificarImagen3");//
        String imgactual4 = request.getParameter("txtImagen4");
        Part part4 = request.getPart("txtModificarImagen4");//
        String imgactual5 = request.getParameter("txtImagen5");
        Part part5 = request.getPart("txtModificarImagen5");//
        String imgactual6 = request.getParameter("txtImagen6");
        Part part6 = request.getPart("txtModificarImagen6");//

        String imagen = request.getParameter("selected1");
        if (imagen.equals("SelectImagenActual1")) {
            p.setFilename1(imgactual1);
            p.setPath1(imgactual1);
        } else {
            String fileName1 = extractFileName(part1);//file name
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
            part1.write(savePath1 + File.separator);
            File fileSaveDir1 = new File(savePath1);
            dbFileName1 = UPLOAD_DIR + File.separator + fileName1;
            part1.write(savePath1 + File.separator);
            p.setFilename1(dbFileName1);
            p.setPath1(savePath1);
        }

        String imagen2 = request.getParameter("selected2");
        if (imagen2.equals("SelectImagenActual2")) {
            p.setFilename2(imgactual2);
            p.setPath2(imgactual2);
        } else {
            String fileName2 = extractFileName(part2);//file name
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println("applicationPath:" + applicationPath);
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath2 = uploadPath + File.separator + fileName2;
            //Imagen2
            System.out.println("savePath: " + savePath2);
            String sRootPath = new File(savePath2).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part2.write(savePath2 + File.separator);
            File fileSaveDir1 = new File(savePath2);
            dbFileName2 = UPLOAD_DIR + File.separator + fileName2;
            part2.write(savePath2 + File.separator);
            p.setFilename2(dbFileName2);
            p.setPath2(savePath2);
        }

        String imagen3 = request.getParameter("selected3");
        if (imagen3.equals("SelectImagenActual3")) {
            p.setFilename3(imgactual3);
            p.setPath3(imgactual3);
        } else {
            String fileName3 = extractFileName(part3);//file name
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println("applicationPath:" + applicationPath);
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath3 = uploadPath + File.separator + fileName3;
            //Imagen3
            System.out.println("savePath: " + savePath3);
            String sRootPath = new File(savePath3).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part3.write(savePath3 + File.separator);
            File fileSaveDir3 = new File(savePath3);
            dbFileName3 = UPLOAD_DIR + File.separator + fileName3;
            part3.write(savePath3 + File.separator);
            p.setFilename3(dbFileName3);
            p.setPath3(savePath3);
        }

        String imagen4 = request.getParameter("selected4");
        if (imagen4.equals("SelectImagenActual4")) {
            p.setFilename4(imgactual4);
            p.setPath4(imgactual4);
        } else {
            String fileName4 = extractFileName(part4);//file name
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println("applicationPath:" + applicationPath);
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath4 = uploadPath + File.separator + fileName4;
            //Imagen4
            System.out.println("savePath: " + savePath4);
            String sRootPath = new File(savePath4).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part4.write(savePath4 + File.separator);
            File fileSaveDir1 = new File(savePath4);
            dbFileName4 = UPLOAD_DIR + File.separator + fileName4;
            part4.write(savePath4 + File.separator);
            p.setFilename4(dbFileName4);
            p.setPath4(savePath4);
        }

        String imagen5 = request.getParameter("selected5");
        if (imagen5.equals("SelectImagenActual5")) {
            p.setFilename5(imgactual5);
            p.setPath5(imgactual5);
        } else {
            String fileName5 = extractFileName(part5);//file name
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println("applicationPath:" + applicationPath);
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath5 = uploadPath + File.separator + fileName5;
            //Imagen4
            System.out.println("savePath: " + savePath5);
            String sRootPath = new File(savePath5).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part5.write(savePath5 + File.separator);
            File fileSaveDir1 = new File(savePath5);
            dbFileName5 = UPLOAD_DIR + File.separator + fileName5;
            part5.write(savePath5 + File.separator);
            p.setFilename5(dbFileName5);
            p.setPath5(savePath5);
        }

        String imagen6 = request.getParameter("selected6");
        if (imagen6.equals("SelectImagenActual6")) {
            p.setFilename6(imgactual6);
            p.setPath6(imgactual6);
        } else {
            String fileName6 = extractFileName(part6);//file name
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            System.out.println("applicationPath:" + applicationPath);
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath6 = uploadPath + File.separator + fileName6;
            //Imagen4
            System.out.println("savePath: " + savePath6);
            String sRootPath = new File(savePath6).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part6.write(savePath6 + File.separator);
            File fileSaveDir1 = new File(savePath6);
            dbFileName6 = UPLOAD_DIR + File.separator + fileName6;
            part6.write(savePath6 + File.separator);
            p.setFilename6(dbFileName6);
            p.setPath6(savePath6);
        }

        p.setIdproducto(id);
        p.setCodigo(codigo);
        p.setDescripcion(descripcion);
        p.setIdclasi(clasi);
        p.setIdcategoria(categoria);
        p.setIduventa(unidadv);
        p.setMoneda("Soles");
        p.setCodigoanexo(Codanexo);
        p.setPreciocompra(0);
        p.setPrecioVenta(Float.parseFloat(pventa));
        p.setFechaRegistro(fecha);
        p.setObser(observ);
        if (pdao.Editimg(p)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("El producto no ha sido registrado correctamente");
        }
    }

    private void Editarstockminmax(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        String codigo = request.getParameter("Txtcodigo");
        String descripcion = request.getParameter("Txtdescripcion");
        String pcompra = request.getParameter("Txtpcompra");
        String pventa = request.getParameter("Txtpventa");
        p.setIdproducto(id);
        p.setCodigo(codigo);
        p.setDescripcion(descripcion);
        p.setStockminimo(Float.parseFloat(pcompra));
        p.setStockmaximo(Float.parseFloat(pventa));
        if (pdao.Editstockminmax(p)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("El producto no ha sido registrado correctamente");
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idPro"));
        pdao.Eliminar(id);
        ProductoDAO clidao = new ProductoDAO();

        boolean validacion = false;
        validacion = clidao.Yatienemovimiento(id);
        if (validacion == true) {
            response.getWriter().print("tienemovi");
        }
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

    private void estado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("id"));
        p.setIdproducto(id);

        String estado = ProductoDAO.estado(id);
        String estadoo = ProductoDAO.estadoalmacenp(id);
        if (estado.equalsIgnoreCase("Activo")) {
            p.setEstado("Desactivado");
        } else {
            p.setEstado("Activo");
        }
        pdao.editEstado(p, id);
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
