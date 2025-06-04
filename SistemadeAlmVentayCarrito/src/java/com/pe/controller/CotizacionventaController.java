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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yenny
 */
public class CotizacionventaController extends HttpServlet {

    MovimientoDAO codao = new MovimientoDAO();
    int id;
    MovimientoDAO coDAO;
    // venta
    String cocomprobante;
    String numcocomprobante;
    // detalle _detalle
    int Nof;
    DecimalFormat formateadorco;
    Movimiento co = new Movimiento();
    DetalleMovimiento dco = new DetalleMovimiento();

    public CotizacionventaController() {
        coDAO = new MovimientoDAO();
        formateadorco = new DecimalFormat("00000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("procesarCarritoco")) {
            this.procesarCarritoco(request, response);
        }
        if (accion.equals("AnadirCarritoco")) {
            this.anadirCarritoco(request, response);
        }
        if (accion.equals("actualizarcantidadco")) {
            this.actualizarcantidadco(request, response);
        }
        if (accion.equals("actualizarcostoco")) {
            this.actualizarcostoco(request, response);
        }
        if (accion.equals("Registrarcotizacion")) {
            this.Registrarcotizacion(request, response);
        }
        if (accion.equals("estadoanularco")) {
            this.estadoanularco(request, response);
        }

        if (accion.equals("Eliminar")) {
            this.Eliminarco(request, response);
        }
        if (accion.equals("Limpiarco")) {
            this.Limpiarco(request, response);
        }
    }

    private void procesarCarritoco(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carco;//
        if (sesion.getAttribute("carco") == null) {
            carco = new ArrayList<DetalleMovimiento>();

        } else {
            carco = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carco");
        }
        if (carco.size() > 0) {
            for (int i = 0; i < carco.size(); i++) {

                DetalleMovimiento det = carco.get(i);
                // subtotal+= det.subtotal();
            }
            //Compra
            //insert into compra values(numero_serie , idProveedor , idTRabjador , fecha , impuesto , subtotal , (subtotal + (subtotal * impuesto)));
            //Detalle
            for (int i = 0; i < carco.size(); i++) {

                DetalleMovimiento det = carco.get(i);
                // insert into DetalleMovimiento values(null , det.getProducto.getIdproducto() , numero_serie ,det.getCantidad(),det.getPrecioCompra , det.getPrecioVenta );
            }
        } else {
            //Validar si esta vacio
        }
        sesion.setAttribute("carco", carco);
        response.sendRedirect("InsertarCotizacionventa.jsp");
    }

    private void anadirCarritoco(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double subtotal;
        HttpSession sesion = request.getSession();//
        ArrayList<DetalleMovimiento> carco;//
        if (sesion.getAttribute("carco") == null) {
            carco = new ArrayList<DetalleMovimiento>();
        } else {
            carco = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carco");
        }
        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("txtPro_id")));
        DetalleMovimiento d = new DetalleMovimiento();
        d.setIdproducto(Integer.parseInt(request.getParameter("txtPro_id")));
        d.setProducto(p);
        d.setCantidad(Double.parseDouble(request.getParameter("txtPro_cantidad")));
        d.setCosto(Double.parseDouble(request.getParameter("txtPro_precio")));
        double subTotal = d.getCosto() * d.getCantidad();
        d.setSubtotal(subTotal);
        boolean indice = false;
        for (int i = 0; i < carco.size(); i++) {
            DetalleMovimiento det = carco.get(i);
            if (det.getIdproducto() == p.getIdproducto()) {
                // det.setCantidad(det.getCantidad()+ d.getCantidad());//auto incrementar cantidad
                // det.setDet_com_descuento(d.getDet_com_descuento()*det.getDet_com_cantidad());
                indice = true;
                break;
            }
        }
        if (!indice) {
            carco.add(d);
        }
        sesion.setAttribute("carco", carco);
        response.sendRedirect("InsertarCotizacionventa.jsp");
    }

    private void actualizarcantidadco(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carco;//
        if (sesion.getAttribute("carco") == null) {
            carco = new ArrayList<DetalleMovimiento>();
        } else {
            carco = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carco");
        }
        Double cantidad = Double.parseDouble(request.getParameter("cantco"));
        int fila = Integer.parseInt(request.getParameter("idproductoco"));
        DetalleMovimiento det = carco.get(fila);
        det.setCantidad(cantidad);
        double subTotal = det.getCosto() * det.getCantidad();
        det.setSubtotal(subTotal);
        carco.set(fila, det);
        sesion.setAttribute("carco", carco);
        response.sendRedirect("InsertarCotizacionventa.jsp");
    }

    private void actualizarcostoco(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carco;//
        if (sesion.getAttribute("carco") == null) {
            carco = new ArrayList<DetalleMovimiento>();
        } else {
            carco = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carco");
        }
        Double Costo = Double.parseDouble(request.getParameter("costco"));
        int fila = Integer.parseInt(request.getParameter("idproductoco"));
        DetalleMovimiento det = carco.get(fila);
        det.setCosto(Costo);
        double subTotal = det.getCosto() * det.getCantidad();
        det.setSubtotal(subTotal);
        carco.set(fila, det);
        sesion.setAttribute("carco", carco);
        response.sendRedirect("InsertarCotizacionventa.jsp");

    }

    private void Registrarcotizacion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtIdcli").toUpperCase()));
        v.setIdusuario(1);
        v.setTipocomprobante(request.getParameter("txtTipodoc").toUpperCase());
        v.setSerie("CT01");
        v.setCorrelativo(request.getParameter("txtCorrelativo").toUpperCase());
        v.setFecha(request.getParameter("txtfecha").toUpperCase());
        v.setFechaentrega(request.getParameter("txtFechaentrega").toUpperCase());
        v.setIdreferencia(1);
        v.setReferencia(request.getParameter("txtReferencia").toUpperCase());
        v.setTienda(request.getParameter("txtTienda").toUpperCase());
        v.setAlmacen(request.getParameter("txtAlmacen").toUpperCase());
        v.setCondicion(request.getParameter("txtCondicion").toUpperCase());
        v.setIdmotivo(1);
        v.setIdtrans(1);
        v.setIdvehi(1);
        v.setIdcond(1);
        v.setSubtotal(Double.parseDouble(request.getParameter("txtSubtotal").toUpperCase()));
        v.setIgv(Double.parseDouble(request.getParameter("txtIgv").toUpperCase()));
        v.setTotal(Double.parseDouble(request.getParameter("txtTotal").toUpperCase()));
        v.setEstado("Pendiente");
        ArrayList<DetalleMovimiento> detalle = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carco");
        if (coDAO.insertarMovimiento(v, detalle)) {
            request.getSession().removeAttribute("clienteCO");
            request.getSession().removeAttribute("carco");
            response.getWriter().print("oki");
        } else {
            request.getSession().removeAttribute("clienteCO");
            request.getSession().removeAttribute("carco");
            response.getWriter().print("Nose realizo la venta");
        }
    }

    private void estadoanularco(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("id"));
        String estado = MovimientoDAO.estado(id);
        if (estado.equalsIgnoreCase("Pendiente")) {
            co.setEstado("Anulado");
            dco.setEstado("Anulado");
        } else {
            co.setEstado("Anulado");
            dco.setEstado("Anulado");
        }
        coDAO.editarEstado(co, id);
        coDAO.editaranulardetalle(dco, id);
    }

    private void Eliminarco(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idMot"));
        System.out.println("[ID] " + id);
        coDAO.EliminarDetalle(id);
        coDAO.Eliminar(id);

    }

    private void Limpiarco(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("clienteCO");
        request.getSession().removeAttribute("carco");
        response.sendRedirect("InsertarCotizacionventa.jsp");
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
