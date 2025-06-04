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
public class PedidoventaController extends HttpServlet {

    MovimientoDAO pedidao = new MovimientoDAO();
    int id;
    int idref;
    MovimientoDAO pediDAO;
    // venta
    String pedicomprobante;
    String numpedicomprobante;
    // detalle _detalle
    int Nof;
    DecimalFormat formateadorpedi;
    Movimiento pedi = new Movimiento();
    DetalleMovimiento dpedi = new DetalleMovimiento();

    public PedidoventaController() {
        pediDAO = new MovimientoDAO();
        formateadorpedi = new DecimalFormat("00000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("procesarCarritopedi")) {
            this.procesarCarritopedi(request, response);
        }
        if (accion.equals("AnadirCarritopedi")) {
            this.anadirCarritopedi(request, response);
        }
        if (accion.equals("actualizarcantidadpedi")) {
            this.actualizarcantidadpedi(request, response);
        }
        if (accion.equals("actualizarcostopedi")) {
            this.actualizarcostopedi(request, response);
        }
        if (accion.equals("Registrarpedido")) {
            this.Registrarpedido(request, response);
        }
        if (accion.equals("estadoanularpedi")) {
            this.estadoanularpedi(request, response);
        }

        if (accion.equals("Eliminar")) {
            this.Eliminarpedi(request, response);
        }
        if (accion.equals("Limpiarpedi")) {
            this.Limpiarpedi(request, response);
        }
        if (accion.equals("Anular")) {
            this.Anular(request, response);
        }
    }

    private void procesarCarritopedi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carpedi;//
        if (sesion.getAttribute("carpedi") == null) {
            carpedi = new ArrayList<DetalleMovimiento>();

        } else {
            carpedi = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carpedi");
        }
        if (carpedi.size() > 0) {
            for (int i = 0; i < carpedi.size(); i++) {

                DetalleMovimiento det = carpedi.get(i);
                // subtotal+= det.subtotal();
            }
            //Compra
            //insert into compra values(numero_serie , idProveedor , idTRabjador , fecha , impuesto , subtotal , (subtotal + (subtotal * impuesto)));
            //Detalle
            for (int i = 0; i < carpedi.size(); i++) {

                DetalleMovimiento det = carpedi.get(i);
                // insert into DetalleMovimiento values(null , det.getProducto.getIdproducto() , numero_serie ,det.getCantidad(),det.getPrecioCompra , det.getPrecioVenta );
            }
        } else {
            //Validar si esta vacio
        }
        sesion.setAttribute("carpedi", carpedi);
        response.sendRedirect("InsertarPedidoventa.jsp");
    }

    private void anadirCarritopedi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double subtotal;
        HttpSession sesion = request.getSession();//
        ArrayList<DetalleMovimiento> carpedi;//
        if (sesion.getAttribute("carpedi") == null) {
            carpedi = new ArrayList<DetalleMovimiento>();
        } else {
            carpedi = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carpedi");
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
        for (int i = 0; i < carpedi.size(); i++) {
            DetalleMovimiento det = carpedi.get(i);
            if (det.getIdproducto() == p.getIdproducto()) {
                // det.setCantidad(det.getCantidad()+ d.getCantidad());//auto incrementar cantidad
                // det.setDet_com_descuento(d.getDet_com_descuento()*det.getDet_com_cantidad());
                indice = true;
                break;
            }
        }
        if (!indice) {
            carpedi.add(d);
        }
        sesion.setAttribute("carpedi", carpedi);
        response.sendRedirect("InsertarPedidoventa.jsp");
    }

    private void actualizarcantidadpedi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carpedi;//
        if (sesion.getAttribute("carpedi") == null) {
            carpedi = new ArrayList<DetalleMovimiento>();
        } else {
            carpedi = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carpedi");
        }
        Double cantidad = Double.parseDouble(request.getParameter("cantpedi"));
        int fila = Integer.parseInt(request.getParameter("idproductopedi"));
        DetalleMovimiento det = carpedi.get(fila);
        det.setCantidad(cantidad);
        double subTotal = det.getCosto() * det.getCantidad();
        det.setSubtotal(subTotal);
        carpedi.set(fila, det);
        sesion.setAttribute("carpedi", carpedi);
        response.sendRedirect("InsertarPedidoventa.jsp");
    }

    private void actualizarcostopedi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carpedi;//
        if (sesion.getAttribute("carpedi") == null) {
            carpedi = new ArrayList<DetalleMovimiento>();
        } else {
            carpedi = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carpedi");
        }
        Double Costo = Double.parseDouble(request.getParameter("costpedi"));
        int fila = Integer.parseInt(request.getParameter("idproductopedi"));
        DetalleMovimiento det = carpedi.get(fila);
        det.setCosto(Costo);
        double subTotal = det.getCosto() * det.getCantidad();
        det.setSubtotal(subTotal);
        carpedi.set(fila, det);
        sesion.setAttribute("carpedi", carpedi);
        response.sendRedirect("InsertarPedidoventa.jsp");

    }

    private void Registrarpedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtIdcli").toUpperCase()));
        v.setIdusuario(1);
        v.setTipocomprobante(request.getParameter("txtTipodoc").toUpperCase());
        v.setSerie("P001");
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
        ArrayList<DetalleMovimiento> detalle = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carpedi");
        if (pediDAO.insertarMovimiento(v, detalle)) {
            request.getSession().removeAttribute("clientePEDI");
            request.getSession().removeAttribute("carpedi");
            response.getWriter().print("oki");
        } else {
            request.getSession().removeAttribute("clientePEDI");
            request.getSession().removeAttribute("carpedi");
            response.getWriter().print("Nose realizo el pedido");
        }
    }

    private void estadoanularpedi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("id"));
        String estado = MovimientoDAO.estado(id);
        if (estado.equalsIgnoreCase("Pendiente")) {
            pedi.setEstado("Anulado");
            dpedi.setEstado("Anulado");
        } else {
            pedi.setEstado("Anulado");
            dpedi.setEstado("Anulado");
        }
        pediDAO.editarEstado(pedi, id);
        pediDAO.editaranulardetalle(dpedi, id);
    }

    private void Anular(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        pedi.setIdmovimiento(id);
        pedi.setEstado("Anulado");
        dpedi.setEstado("Anulado");
        if (pediDAO.Edit(pedi)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("no se anulo error");
        }
        pediDAO.editaranulardetalle(dpedi, id);
        idref = Integer.parseInt(request.getParameter("Txtidref"));
        pedi.setEstado("Pendiente");
        pediDAO.editarEstadoref(pedi, idref);
          response.sendRedirect("DetallePDFController?accion=Mipedido&id=" + id);
    }

    private void Eliminarpedi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idMot"));
        System.out.println("[ID] " + id);
        pediDAO.EliminarDetalle(id);
        pediDAO.Eliminar(id);

    }

    private void Limpiarpedi(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("clientePEDI");
        request.getSession().removeAttribute("carpedi");
        response.sendRedirect("InsertarPedidoventa.jsp");
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
