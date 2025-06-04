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
public class RefNotadeIngresoController extends HttpServlet {

    MovimientoDAO nidao = new MovimientoDAO();
    int id;
    MovimientoDAO niDAO;
    // venta
    String nicomprobante;
    String numnicomprobante;
    // detalle _detalle
    // detalle _detalle
    int Nni;
    Movimiento ni = new Movimiento();
    DetalleMovimiento dni = new DetalleMovimiento();
    DecimalFormat formateadorrefni;

    public RefNotadeIngresoController() {
        niDAO = new MovimientoDAO();
        formateadorrefni = new DecimalFormat("00000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("RegistrarrefNotadeingreso")) {
            this.RegistrarrefNotadeingreso(request, response);
        }
        if (accion.equalsIgnoreCase("procesarCarritorefni")) {
            this.procesarCarritorefni(request, response);
        }
        if (accion.equalsIgnoreCase("refNotai")) {
            DetallerefIngreso(request, response);
        }
        if (accion.equalsIgnoreCase("refNotaIActualizarcantidad")) {
            refNotaIActualizarcantidad(request, response);
        }
        if (accion.equals("AnadirCarritorefni")) {
            this.anadirProductorefni(request, response);
        }
    }

    private void procesarCarritorefni(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> movi;//
        if (sesion.getAttribute("RefNotaIngreso") == null) {
            movi = new ArrayList<DetalleMovimiento>();

        } else {
            movi = (ArrayList<DetalleMovimiento>) sesion.getAttribute("RefNotaIngreso");
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
        response.sendRedirect("RefInsertarNotadeIngreso.jsp");

    }

    private void anadirProductorefni(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carrito;//
        if (sesion.getAttribute("RefNotaIngreso") == null) {
            carrito = new ArrayList<DetalleMovimiento>();

        } else {
            carrito = (ArrayList<DetalleMovimiento>) sesion.getAttribute("RefNotaIngreso");
        }
        String[] selecionar = request.getParameterValues("accion");

        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("txtPro_id")));
        DetalleMovimiento d = new DetalleMovimiento();
        d.setIdproducto(Integer.parseInt(request.getParameter("txtPro_id")));
        d.setProducto(p);
        d.setCantidad(Double.parseDouble(request.getParameter("txtPro_cantidad")));
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
        sesion.setAttribute("RefNotaIngreso", carrito);
        request.getRequestDispatcher("RefInsertarNotadeIngreso.jsp").forward(
                request, response);
    }

    protected void refNotaIActualizarcantidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "RefInsertarNotadeIngreso.jsp";
        MovimientoDAO pdao = new MovimientoDAO();
        List<DetalleMovimiento> listS = ObtenerSesion(request);
        //PROCEDIMIENTO ACTUALIZAR
        double cantidad = Double.parseDouble(request.getParameter("cantniref"));
        int fila = Integer.parseInt(request.getParameter("idproductorefni"));
        DetalleMovimiento det = listS.get(fila);
        det.setCantidad(cantidad);
        listS.set(fila, det);
        //FIN
        GuardarSesion(request, listS);
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    protected void DetallerefIngreso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        if (request.getParameter("id") == null) {
            id = Integer.parseInt(request.getSession().getAttribute("refNotaI").toString());
        } else {
            id = Integer.parseInt(request.getParameter("id"));
        }
        String acceso = "RefInsertarNotadeIngreso.jsp";
        MovimientoDAO pdao = new MovimientoDAO();
        List<DetalleMovimiento> listS = pdao.ticketDetalle(id);
        GuardarSesion(request, listS);
        request.getSession().setAttribute("refNotaI", id);
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    public ArrayList<DetalleMovimiento> ObtenerSesion(HttpServletRequest request) {
        ArrayList<DetalleMovimiento> lista;
        if (request.getSession().getAttribute("RefNotaIngreso") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<DetalleMovimiento>) request.getSession().getAttribute("RefNotaIngreso");
        }
        return lista;
    }

    public void GuardarSesion(HttpServletRequest request, List<DetalleMovimiento> lista) {
        request.getSession().setAttribute("RefNotaIngreso", lista);
    }

    private void RegistrarrefNotadeingreso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtIdcli").toUpperCase()));
        v.setIdusuario(1);
        v.setTipocomprobante(request.getParameter("txtTipodoc").toUpperCase());
        v.setSerie("NI01");
        int Nnipt = niDAO.BuscarNnotaingresomp();
        Nnipt = Nnipt + 1;
        String format = formateadorrefni.format(Nnipt);
        v.setCorrelativo(format);
        v.setFecha(request.getParameter("txtfecha").toUpperCase());
        v.setIdreferencia(Integer.parseInt(request.getParameter("idmov").toUpperCase()));
        v.setReferencia(request.getParameter("txtReferencia").toUpperCase());
        v.setFechaentrega("");
        v.setTienda(request.getParameter("txtTienda").toUpperCase());
        v.setAlmacen(request.getParameter("txtAlmacen").toUpperCase());
        v.setCondicion(request.getParameter("txtCondicion").toUpperCase());
        v.setIdmotivo(Integer.parseInt(request.getParameter("txtMotivo").toUpperCase()));
        v.setIdtrans(1);
        v.setIdvehi(1);
        v.setIdcond(1);
        v.setSubtotal(0.00);
        v.setIgv(0.00);
        v.setTotal(0.00);
        v.setEstado("Pendiente");
        ArrayList<DetalleMovimiento> detalle = ObtenerSesion(request);
        if (niDAO.insertarMov(v, detalle)) {
            response.getWriter().print("oki");
        } else {
            response.getWriter().print("Nose realizo la venta");

        }
        id = Integer.parseInt(request.getParameter("idmov"));
        v.setEstado("Terminado");
        niDAO.editarEstadoref(v, id);
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
