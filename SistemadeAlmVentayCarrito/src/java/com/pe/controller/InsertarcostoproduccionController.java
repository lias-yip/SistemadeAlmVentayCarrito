/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.controller;

import com.pe.DAO.MovimientoDAO;
import com.pe.DAO.ProductoDAO;
import com.pe.model.entity.DetalleMovimiento;
import com.pe.model.entity.Movimiento;
import com.pe.model.entity.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yenny
 */
public class InsertarcostoproduccionController extends HttpServlet {

       MovimientoDAO refcpdao = new MovimientoDAO();
    int id;
    int idref;
    MovimientoDAO refcpDAO;
    // venta
    String refcpcomprobante;
    String numcpcomprobante;
    // detalle _detalle
    // detalle _detalle
    int Ncp;
    Movimiento cp = new Movimiento();
    DetalleMovimiento dcp = new DetalleMovimiento();
    DecimalFormat formateadorrefcp;

    public InsertarcostoproduccionController() {
        refcpDAO = new MovimientoDAO();
        formateadorrefcp = new DecimalFormat("00000000");
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("refprocesarCarritocp")) {
            this.refprocesarCarritocp(request, response);
        }
        if (accion.equalsIgnoreCase("refCp")) {
            Detallecpref(request, response);
        }
        if (accion.equalsIgnoreCase("refcpActualizarcantidad")) {
            refcpActualizarcantidad(request, response);
        }
        if (accion.equals("refactualizarcostocp")) {
            this.refactualizarcostocp(request, response);
        }
        if (accion.equals("refAnadirCarritocp")) {
            this.refanadirProductocp(request, response);
        }
        if (accion.equals("refRegistrarCostoproduccion")) {
            this.refRegistrarCostoproduccion(request, response);
        }
        if (accion.equals("Anular")) {
            this.Anular(request, response);
        }
        if (accion.equals("Eliminar")) {
            this.Eliminar(request, response);
        }
    }
    private void refprocesarCarritocp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> movi;//
        if (sesion.getAttribute("Costoproduccion") == null) {
            movi = new ArrayList<DetalleMovimiento>();

        } else {
            movi = (ArrayList<DetalleMovimiento>) sesion.getAttribute("Costoproduccion");
        }

        if (movi.size() > 0) {
            double subtotal = 0;
            for (int i = 0; i < movi.size(); i++) {

                DetalleMovimiento det = movi.get(i);
                // subtotal+= det.subtotal();
            }
            //Compra
            //insert into compra values(numero_serie , idProveedor , idTRabjador , fecha , impuesto , subtotal , (subtotal + (subtotal * impuesto)));
            //Detalle
            for (int i = 0; i < movi.size(); i++) {

                DetalleMovimiento det = movi.get(i);
                // insert into detallecompra values(null , det.getProducto.getIdproducto() , numero_serie ,det.getCantidad(),det.getPrecioCompra , det.getPrecioVenta );
            }
        } else {
            //Validar si esta vacio
        }

        sesion.setAttribute("movi", movi);
        response.sendRedirect("InsertarCostoproduccion.jsp");

    }

    private void refanadirProductocp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carrito;//
        if (sesion.getAttribute("Costoproduccion") == null) {
            carrito = new ArrayList<DetalleMovimiento>();

        } else {
            carrito = (ArrayList<DetalleMovimiento>) sesion.getAttribute("Costoproduccion");
        }
        String[] selecionar = request.getParameterValues("accion");

        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("Id")));
        DetalleMovimiento d = new DetalleMovimiento();
        d.setIdproducto(Integer.parseInt(request.getParameter("Id")));
        d.setProducto(p);

        boolean indice = false;
        for (int i = 0; i < carrito.size(); i++) {

            DetalleMovimiento det = carrito.get(i);

            if (det.getIdproducto() == p.getIdproducto()) {
                indice = true;
                break;
            }

        }
        if (!indice) {
            carrito.add(d);
        }
        sesion.setAttribute("Costoproduccion", carrito);
        request.getRequestDispatcher("InsertarCostoproduccion.jsp").forward(
                request, response);
    }

    protected void refcpActualizarcantidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "InsertarCostoproduccion.jsp";
        MovimientoDAO pdao = new MovimientoDAO();
        List<DetalleMovimiento> listS = ObtenerSesion(request);
        //PROCEDIMIENTO ACTUALIZAR
        int cantidad = Integer.parseInt(request.getParameter("cantrefcp"));
        int fila = Integer.parseInt(request.getParameter("idproductorefcp"));
        DetalleMovimiento det = listS.get(fila);
        det.setCantidad(cantidad);
        listS.set(fila, det);
        //FIN
        GuardarSesion(request, listS);
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    private void refactualizarcostocp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> caroc;//
        if (sesion.getAttribute("Costoproduccion") == null) {
            caroc = new ArrayList<DetalleMovimiento>();
        } else {
            caroc = (ArrayList<DetalleMovimiento>) sesion.getAttribute("Costoproduccion");
        }
        Double Costo = Double.parseDouble(request.getParameter("costocp"));
        int fila = Integer.parseInt(request.getParameter("idproductocp"));
        DetalleMovimiento det = caroc.get(fila);
        det.setCosto(Costo);
        caroc.set(fila, det);
        sesion.setAttribute("Costoproduccion", caroc);
        response.sendRedirect("InsertarCostoproduccion.jsp");

    }

    protected void Detallecpref(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        if (request.getParameter("id") == null) {
            id = Integer.parseInt(request.getSession().getAttribute("Costop").toString());
        } else {
            id = Integer.parseInt(request.getParameter("id"));
        }
        String acceso = "InsertarCostoproduccion.jsp";
        MovimientoDAO pdao = new MovimientoDAO();
        List<DetalleMovimiento> listS = pdao.ticketDetalle(id);
        GuardarSesion(request, listS);
        request.getSession().setAttribute("Costop", id);
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    public ArrayList<DetalleMovimiento> ObtenerSesion(HttpServletRequest request) {
        ArrayList<DetalleMovimiento> lista;
        if (request.getSession().getAttribute("Costoproduccion") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<DetalleMovimiento>) request.getSession().getAttribute("Costoproduccion");
        }
        return lista;
    }

    public void GuardarSesion(HttpServletRequest request, List<DetalleMovimiento> lista) {
        request.getSession().setAttribute("Costoproduccion", lista);
    }

    private void refRegistrarCostoproduccion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtIdcli").toUpperCase()));
        v.setIdusuario(1);
        v.setTipocomprobante("COSTO PRODUCCION");
        v.setIdreferencia(Integer.parseInt(request.getParameter("idmov").toUpperCase()));
        v.setReferencia(request.getParameter("txtReferencia").toUpperCase());
        v.setFechaentrega("");
        v.setSerie("");
        v.setCorrelativo(request.getParameter("txtCorrelativo").toUpperCase());
        v.setFecha(request.getParameter("txtfecha").toUpperCase());
        v.setTienda(request.getParameter("txtTienda").toUpperCase());
        v.setAlmacen(request.getParameter("txtAlmacen").toUpperCase());
        v.setCondicion("");
        v.setIdmotivo(Integer.parseInt(request.getParameter("txtIdmotivo").toUpperCase()));
        v.setIdtrans(1);
        v.setIdvehi(1);
        v.setIdcond(1);
        v.setSubtotal(0.00);
        v.setIgv(0.00);
        v.setTotal(0.00);
        v.setEstado("Terminado");
        ArrayList<DetalleMovimiento> detalle = ObtenerSesion(request);
        if (refcpDAO.insertarMovimiento(v, detalle)) {
            response.getWriter().print("oki");
        } else {
            response.getWriter().print("Nose realizo la venta");

        }
        id = Integer.parseInt(request.getParameter("idmov"));
        v.setEstado("Terminado");
        refcpDAO.editarEstadoref(v, id);
    }
        private void Anular(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        cp.setIdmovimiento(id);
        cp.setEstado("Anulado");
        dcp.setEstado("Anulado");
        if (refcpDAO.Edit(cp)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("El proveedor no");
        }
        refcpDAO.editaranulardetalle(dcp, id);
        idref = Integer.parseInt(request.getParameter("Txtidref"));
        cp.setEstado("Pendiente");
        refcpDAO.editarEstadoref(cp, idref);

    }
        private void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idcp"));
        System.out.println("[ID] " + id);
        refcpDAO.EliminarDetalle(id);
        refcpDAO.Eliminar(id);

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
