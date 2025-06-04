package com.pe.DAO;

import com.pe.Interfaz.CRUDProducto;
import com.pe.conection.ConexionBD;
import com.pe.model.entity.Producto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Producto p = new Producto();
    CallableStatement call = null;
    String mensaje = "";

    public Producto BuscarPorId(int idProducto) {
        Producto pro = null;
        String sql = "select * from Producto where Idproducto = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProducto);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new Producto();
                pro.setIdproducto(rs.getInt("Idproducto"));
                pro.setCodigo(rs.getString("Codigo"));
                pro.setDescripcion(rs.getString("Descripcion"));
                pro.setIdclasi(rs.getInt("Idclasi"));
                pro.setIdcategoria(rs.getInt("Idcategoria"));
                pro.setIduventa(rs.getInt("Iduventa"));
                pro.setMoneda(rs.getString("Moneda"));
                pro.setCodigoanexo(rs.getString("Codigoanexo"));
                pro.setPreciocompra(rs.getDouble("Preciocompra"));
                pro.setPrecioVenta(rs.getDouble("Precioventa"));
                pro.setFechaRegistro(rs.getString("Fecharegistro"));
                pro.setObser(rs.getString("Obser"));
                pro.setEstado(rs.getString("Estado"));

            }

        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            cn.desconectar();
        }
        return pro;
    }

    public static String getProducto(int cod) {

        try {
            String sql = "select Descripcion from Producto where Idproducto=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Descripcion");

            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }

    public static String getCodProd(int cod) {

        try {
            String sql = "select Codigo from Producto where Idproducto=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Codigo");

            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }

    public List ListadoStockmaximoyActivo() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from Producto where Stock>=Stockmaximo and Stockmaximo>0";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto pro = new Producto();
                pro.setIdproducto(rs.getInt("Idproducto"));
                pro.setCodigo(rs.getString("Codigo"));
                pro.setDescripcion(rs.getString("Descripcion"));
                pro.setIdclasi(rs.getInt("Idclasi"));
                pro.setIdcategoria(rs.getInt("Idcategoria"));
                pro.setIduventa(rs.getInt("Iduventa"));
                pro.setMoneda(rs.getString("Moneda"));
                pro.setCodigoanexo(rs.getString("Codigoanexo"));
                pro.setPreciocompra(rs.getDouble("Preciocompra"));
                pro.setPrecioVenta(rs.getDouble("Precioventa"));
                pro.setFechaRegistro(rs.getString("Fecharegistro"));
                pro.setObser(rs.getString("Obser"));
                pro.setStock(rs.getDouble("Stock"));
                pro.setStockminimo(rs.getDouble("Stockminimo"));
                pro.setStockmaximo(rs.getDouble("Stockmaximo"));
                pro.setEstado(rs.getString("Estado"));

                list.add(pro);
            }
        } catch (Exception e) {

        }
        return list;
    }
//Listado de producto en JSP Producto

    public List ListadoProducto() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from Producto";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto pro = new Producto();
                pro.setIdproducto(rs.getInt("Idproducto"));
                pro.setCodigo(rs.getString("Codigo"));
                pro.setDescripcion(rs.getString("Descripcion"));
                pro.setIdclasi(rs.getInt("Idclasi"));
                pro.setIdcategoria(rs.getInt("Idcategoria"));
                pro.setIduventa(rs.getInt("Iduventa"));
                pro.setMoneda(rs.getString("Moneda"));
                pro.setCodigoanexo(rs.getString("Codigoanexo"));
                pro.setPreciocompra(rs.getDouble("Preciocompra"));
                pro.setPrecioVenta(rs.getDouble("Precioventa"));
                pro.setFechaRegistro(rs.getString("Fecharegistro"));
                pro.setObser(rs.getString("Obser"));
                pro.setStock(rs.getDouble("Stock"));
                pro.setStockminimo(rs.getDouble("Stockminimo"));
                pro.setStockmaximo(rs.getDouble("Stockmaximo"));
                pro.setEstado(rs.getString("Estado"));
                pro.setFilename1(rs.getString("Filename1"));
                pro.setFilename2(rs.getString("Filename2"));
                pro.setFilename3(rs.getString("Filename3"));
                pro.setFilename4(rs.getString("Filename4"));
                pro.setFilename5(rs.getString("Filename5"));
                pro.setFilename6(rs.getString("Filename6"));

                list.add(pro);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public List ListadoEstadoActivoPT() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from Producto where Estado='Activo' and Idclasi='1'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto prod = new Producto();
                prod.setIdproducto(rs.getInt("Idproducto"));
                prod.setCodigo(rs.getString("Codigo"));
                prod.setDescripcion(rs.getString("Descripcion"));
                prod.setPrecioVenta(rs.getDouble("PrecioVenta"));
                prod.setStock(rs.getDouble("Stock"));
                prod.setEstado(rs.getString("Estado"));

                list.add(prod);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public List ListadoEstadoActivo() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from Producto where Estado='Activo'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto prod = new Producto();
                prod.setIdproducto(rs.getInt("Idproducto"));
                prod.setCodigo(rs.getString("Codigo"));
                prod.setDescripcion(rs.getString("Descripcion"));
                prod.setPrecioVenta(rs.getDouble("PrecioVenta"));
                prod.setStock(rs.getDouble("Stock"));
                prod.setEstado(rs.getString("Estado"));

                list.add(prod);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public Producto list(int id) {

        String sql = "select * from Producto where Idproducto=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                p.setIdproducto(rs.getInt("Idproducto"));
                p.setCodigo(rs.getString("Codigo"));
                p.setDescripcion(rs.getString("Descripcion"));
                p.setIdclasi(rs.getInt("Idclasi"));
                p.setIdcategoria(rs.getInt("Idcategoria"));
                p.setIduventa(rs.getInt("Iduventa"));
                p.setMoneda(rs.getString("Moneda"));
                p.setCodigoanexo(rs.getString("Codigoanexo"));
                p.setPreciocompra(rs.getDouble("Preciocompra"));
                p.setPrecioVenta(rs.getDouble("Precioventa"));
                p.setFechaRegistro(rs.getString("Fecharegistro"));
                p.setObser(rs.getString("Obser"));
                p.setStock(rs.getDouble("Stock"));
                p.setFilename1(rs.getString("Filename1"));
                p.setFilename2(rs.getString("Filename2"));
                p.setFilename3(rs.getString("Filename3"));
                p.setFilename4(rs.getString("Filename4"));
                p.setFilename5(rs.getString("Filename5"));
                p.setFilename6(rs.getString("Filename6"));

            }

        } catch (Exception e) {

        }
        return p;
    }

    public boolean addimg(Producto i) {
        boolean rpt = false;
        try {

            con = cn.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into producto values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setInt(1, i.getIdproducto());
            pst.setString(2, i.getCodigo());
            pst.setString(3, i.getDescripcion());
            pst.setInt(4, i.getIdclasi());
            pst.setInt(5, i.getIdcategoria());
            pst.setInt(6, i.getIduventa());
            pst.setString(7, i.getMoneda());
            pst.setString(8, i.getCodigoanexo());
            pst.setDouble(9, i.getPreciocompra());
            pst.setDouble(10, i.getPrecioVenta());
            pst.setString(11, i.getFechaRegistro());
            pst.setString(12, i.getObser());
            pst.setDouble(13, i.getStock());
            pst.setDouble(14, i.getStockminimo());
            pst.setDouble(15, i.getStockmaximo());
            pst.setString(16, i.getEstado());
            pst.setString(17, i.getFilename1());
            pst.setString(18, i.getPath1());
            pst.setString(19, i.getFilename2());
            pst.setString(20, i.getPath2());
            pst.setString(21, i.getFilename3());
            pst.setString(22, i.getPath3());
            pst.setString(23, i.getFilename4());
            pst.setString(24, i.getPath4());
            pst.setString(25, i.getFilename5());
            pst.setString(26, i.getPath5());
            pst.setString(27, i.getFilename6());
            pst.setString(28, i.getPath6());

            if (pst.executeUpdate() == 1) {
                rpt = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rpt;
    }

    public boolean add(Producto prod) {
        boolean flag = false;
        String sql = "insert into producto(Codigo,Descripcion,Idclasi,Idcategoria,Iduventa,Moneda,Codigoanexo,Preciocompra,Precioventa,Fecharegistro,Obser,Stock,Stockminimo,Stockmaximo,Estado)"
                + "values('" + prod.getCodigo() + "','" + prod.getDescripcion() + "','" + prod.getIdclasi() + "','" + prod.getIdcategoria() +  "','" + prod.getIduventa() + "','" + prod.getMoneda() + "','" + prod.getCodigoanexo() + "','" + prod.getPreciocompra() + "','" + prod.getPrecioVenta() + "','" + prod.getFechaRegistro() + "','" + prod.getObser() + "','" + prod.getStock() + "','" + prod.getStockminimo() + "','" + prod.getStockmaximo() + "','" + prod.getEstado() + "')";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    public boolean validacion(String cl) {
        boolean flag = false;
        String sql = "select Codigoanexo from Producto where Codigoanexo=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl);
            rs = ps.executeQuery();
            while (rs.next()) {
                flag = true;
            }
        } catch (Exception e) {

        }
        return flag;
    }

    public boolean Editimgxx(Producto p) {
        boolean flag = false;
        String sql = "UPDATE Producto set Codigo='" + p.getCodigo() + "',Descripcion='" + p.getDescripcion() + "',Idclasi='" + p.getIdclasi() + "',Idcategoria='" + p.getIdcategoria() + "',Iduventa='" + p.getIduventa() + "',Moneda='" + p.getMoneda() + "',Codigoanexo='" + p.getCodigoanexo() + "',Preciocompra='" + p.getPreciocompra() + "',Precioventa='" + p.getPrecioVenta() + "',Fecharegistro='" + p.getFechaRegistro() + "',Obser='" + p.getObser() + "'WHERE Idproducto=" + p.getIdproducto();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    //Metodo parar actualiza información específica de un producto,
    public boolean Editimg(Producto i) {
        boolean rpt = false;
        try {
            con = cn.getConnection();
            String sql = "UPDATE producto SET Codigo=?,Descripcion=?,Idclasi=?,Idcategoria=?,Iduventa=?,Moneda=?,Codigoanexo=?,Preciocompra=?,Precioventa=?,Fecharegistro=?,Obser=?,filename1=?,path1=?,filename2=?,path2=?,filename3=?,path3=?,filename4=?,path4=?,filename5=?,path5=?,filename6=?,path6=? WHERE Idproducto=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, i.getCodigo());
            pst.setString(2, i.getDescripcion());
            pst.setInt(3, i.getIdclasi());
            pst.setInt(4, i.getIdcategoria());
            pst.setInt(5, i.getIduventa());
            pst.setString(6, i.getMoneda());
            pst.setString(7, i.getCodigoanexo());
            pst.setDouble(8, i.getPreciocompra());
            pst.setDouble(9, i.getPrecioVenta());
            pst.setString(10, i.getFechaRegistro());
            pst.setString(11, i.getObser());
            pst.setString(12, i.getFilename1());
            pst.setString(13, i.getPath1());
            pst.setString(14, i.getFilename2());
            pst.setString(15, i.getPath2());
            pst.setString(16, i.getFilename3());
            pst.setString(17, i.getPath3());
            pst.setString(18, i.getFilename4());
            pst.setString(19, i.getPath4());
            pst.setString(20, i.getFilename5());
            pst.setString(21, i.getPath5());
            pst.setString(22, i.getFilename6());
            pst.setString(23, i.getPath6());
            pst.setInt(24, i.getIdproducto());

            if (pst.executeUpdate() == 1) {
                rpt = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rpt;
    }

    public boolean Editstockminmax(Producto p) {
        boolean flag = false;
        String sql = "UPDATE Producto set Codigo='" + p.getCodigo() + "',Descripcion='" + p.getDescripcion() + "',Stockminimo='" + p.getStockminimo() + "',Stockmaximo='" + p.getStockmaximo() + "'WHERE Idproducto=" + p.getIdproducto();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    public boolean editEstado(Producto prod, int id) {
        String sql = "update Producto set Estado='" + prod.getEstado() + "' where Idproducto=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public static String estado(int cod) {

        try {
            String sql = "select Estado from Producto where Idproducto=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("estado");

            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }

    public static String estadoalmacenp(int cod) {

        try {
            String sql = "select Estado from Almacenxproducto where Idproducto=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("estado");

            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }

    public boolean Eliminar(int id) {
        String sql = "delete from Producto where Idproducto=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean Yatienemovimiento(int id) {
        boolean flag = false;
        String sql = "select * from DetalleMovimiento where Idproducto=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    public static Producto obtenerProducto(int Id) {
        Producto pro = null;
        try {
            CallableStatement cl = ConexionBD.Conectar().prepareCall("{CALL sp_listaporid(?)}");
            cl.setInt(1, Id);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                pro = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6),rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getDouble(10), rs.getString(11), rs.getString(12), rs.getDouble(13), rs.getDouble(14), rs.getDouble(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22));
            }
        } catch (Exception e) {
        }
        return pro;
    }

    public static ArrayList<Producto> obtenerProductop(int num) {
        ArrayList<Producto> lista = new ArrayList<Producto>();
        try {
            CallableStatement cl = ConexionBD.ConectarDB().prepareCall("{CALL sp_Consultarproductoporproveedor(?)}");
            cl.setInt(1, num);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6),rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getDouble(10), rs.getString(11), rs.getString(12), rs.getDouble(13), rs.getDouble(14), rs.getDouble(15), rs.getString(16));
                lista.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lista;
    }

    public String Numserie() {
        String sql = "{call sp_generar_codigoproducto()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;

    }

    //Mostrar nombre de categoria en Producto.jsp
    public static String getNombreprovedor(int cod) {
        try {
            String sql = "select Razonsocial from Proveedor where Idproveedor=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Razonsocial");

            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }

    public static double getProductoprecio(double cod) {
        double mensaje = 0.00;
        try {
            String sql = "select Precioventa from Producto where Idproducto=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getDouble("Precioventa");
            }
            return mensaje;
        } catch (Exception e) {
            return mensaje;
        }
    }

    public static double getProductocosto(double cod) {
        double mensaje = 0.00;
        try {
            String sql = "select Preciocompra from Producto where Idproducto=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getDouble("Preciocompra");
            }
            return mensaje;
        } catch (Exception e) {
            return mensaje;
        }
    }

    public static int getValidarstock(int cod) {
        int mensaje = 0;
        try {
            String sql = "Select Stock from Producto where Idproducto=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("Stock");

            }
            return mensaje;

        } catch (Exception e) {
            return mensaje;
        }
    }

    public List ListadoStockminimo() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "SELECT * From Producto where Stock<=stockminimo and stockminimo>0";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto pro = new Producto();
                pro.setIdproducto(rs.getInt("Idproducto"));
                pro.setCodigo(rs.getString("Codigo"));
                pro.setDescripcion(rs.getString("Descripcion"));
                pro.setIdclasi(rs.getInt("Idclasi"));
                pro.setIdcategoria(rs.getInt("Idcategoria"));
                pro.setIduventa(rs.getInt("Iduventa"));
                pro.setMoneda(rs.getString("Moneda"));
                pro.setCodigoanexo(rs.getString("Codigoanexo"));
                pro.setPreciocompra(rs.getDouble("Preciocompra"));
                pro.setPrecioVenta(rs.getDouble("Precioventa"));
                pro.setFechaRegistro(rs.getString("Fecharegistro"));
                pro.setObser(rs.getString("Obser"));
                pro.setStock(rs.getDouble("Stock"));
                pro.setStockminimo(rs.getDouble("Stockminimo"));
                pro.setStockmaximo(rs.getDouble("Stockmaximo"));
                pro.setEstado(rs.getString("Estado"));

                list.add(pro);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public static void main(String[] args) {
        ProductoDAO mp = new ProductoDAO();
        System.out.println(mp.addimg(new Producto(0, "22222", "ffff", 1, 1, 1, "22222", "22222", 1, 1, "2015-11-05", "activo", 1, 1, 1, "activo")));

    }
}
