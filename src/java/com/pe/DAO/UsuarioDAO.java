package com.pe.DAO;

import com.pe.Interfaz.CRUDUsuario;
import com.pe.conection.ConexionBD;
import com.pe.model.entity.Usuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class UsuarioDAO {
//Atributos

    ConexionBD cn = new ConexionBD();//cn: Objeto de la clase ConexionBD que se utiliza para establecer la conexión con la base de datos.
    int mensaje = 0;//Variable entera que se utiliza para almacenar algún tipo de mensaje.
    PreparedStatement ps = null;//ps: Objeto de tipo PreparedStatement utilizado para ejecutar consultas 
    ResultSet rs = null;//rs: Objeto de tipo ResultSet utilizado para almacenar el resultado de consultas SQL.
    Connection con = null;//con: Objeto de tipo Connection utilizado para representar la conexión con la base de datos.
    String mensaj = "";//mensaj: Cadena de texto que almacena algún mensaje.
    Usuario U = new Usuario();//U: Objeto de la clase Usuario utilizado para manipular datos relacionados con usuarios.
    CallableStatement call = null;

    //Metodo que obtiene un listado de usuarios desde la base de datos
    public List ListadoUsuario() {
        // Se crea una nueva lista de usuarios utilizando la clase ArrayList
        ArrayList<Usuario> list = new ArrayList<>();
        // Consulta SQL para seleccionar todos los registros de la tabla "usuario"
        String sql = "select * from usuario";

        try {
            // Se establece la conexión a la base de datos
            con = cn.getConnection();
            // Se prepara la declaración SQL
            ps = con.prepareStatement(sql);
            // Se ejecuta la consulta y se obtiene un conjunto de resultados
            rs = ps.executeQuery();
            // Se recorre el conjunto de resultados
            while (rs.next()) {
                // Se crea un nuevo objeto de la clase Usuario
                Usuario usu = new Usuario();
                // Se establecen los atributos del objeto con los valores obtenidos de la base de datos
                usu.setId(rs.getInt("id"));
                usu.setNombre(rs.getString("nombre"));
                usu.setUsu(rs.getString("usu"));
                usu.setPassword(rs.getString("password"));
                usu.setRol(rs.getString("rol"));
                usu.setFilename1(rs.getString("filename1"));
                // Se añade el objeto Usuario a la lista
                list.add(usu);
            }
        } catch (Exception e) {

        }
        // Se retorna la lista de usuarios obtenida de la base de datos
        return list;

    }

    //Metodo que obtiene información de un usuario específico basado en su identificador (id) 
    public Usuario list(int id) {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "select * from usuario where id=" + id;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                U.setId(rs.getInt("id"));
                U.setNombre(rs.getString("nombre"));
                U.setUsu(rs.getString("usu"));
                U.setPassword(rs.getString("password"));
                U.setRol(rs.getString("rol"));
                U.setFilename1(rs.getString("filename1"));
                list.add(U);
            }

        } catch (Exception e) {

        }
        return U;
    }

    //Metodo para agrega un nuevo usuario a la base de datos con información detallada
    public boolean addimg(Usuario i) {
        boolean rpt = false;
        try {

            con = cn.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into usuario values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setInt(1, i.getId());
            pst.setString(2, i.getCodigo());
            pst.setString(3, i.getNombre());
            pst.setInt(4, i.getIdTipodocumento());
            pst.setString(5, i.getNrodocumento());
            pst.setDouble(6, i.getSueldo());
            pst.setString(7, i.getTelefono());
            pst.setString(8, i.getDireccion());
            pst.setString(9, i.getEmail());
            pst.setString(10, i.getFechaderegistro());
            pst.setString(11, i.getFilename1());
            pst.setString(12, i.getPath1());
            pst.setString(13, i.getUsu());
            pst.setString(14, i.getPassword());
            pst.setString(15, i.getRol());
            pst.setInt(16, i.getIdcliente());
            pst.setString(17, i.getEstado());

            if (pst.executeUpdate() == 1) {
                rpt = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rpt;
    }

    //Metodo parar actualiza información específica de un usuario,
    public boolean Editimgg(Usuario i) {
        boolean rpt = false;
        try {
            con = cn.getConnection();
            String sql = "UPDATE usuario SET nombre=?, usu=?, password=?, rol=?, filename1=?, path1=? WHERE id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, i.getNombre());
            pst.setString(2, i.getUsu());
            pst.setString(3, i.getPassword());
            pst.setString(4, i.getRol());
            pst.setString(5, i.getFilename1());
            pst.setString(6, i.getPath1());
            pst.setInt(7, i.getId());

            if (pst.executeUpdate() == 1) {
                rpt = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rpt;
    }

    //Metodo para elimina un usuario de la base de datos según su identificador (id).
    public boolean Eliminar(int id) {
        boolean flag = false;
        String sql = "delete from usuario where id=" + id;
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

    //Metodo para realiza una consulta SQL para autenticar a un usuario basado en el nombre de usuario (usu) y la contraseña (password).
    public int usu(String usu, String pass) {
        String sql = "SELECT id FROM usuario WHERE usu ='" + usu + "' AND password='" + pass + "'";

        try {
            int Nfactura = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Nfactura = rs.getInt("id");
            }

            return Nfactura;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }

    //Metodo para busca un usuario por su identificador (idUsuario)
    public Usuario BuscarPorId(int idUsuario) {
        Usuario u = null;
        String sql = "select * from usuario where idempleado = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setNombre(rs.getString("nombre"));
                u.setUsu(rs.getString("usu"));
                u.setPassword(rs.getString("password"));
                u.setRol(rs.getString("rol"));
            }
        } catch (SQLException e) {
            mensaj = e.getMessage();
        } finally {
            cn.desconectar();
        }
        return u;
    }

    //Verifica la existencia de un usuario en la base de datos basado en su nombre de usuario (usu).
    public boolean validacion(String cl) {
        boolean flag = false;
        String sql = "select usu from Usuario where usu=?";
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

    public boolean vali(Usuario cli) {
        boolean flag = false;
        String sql = "select * from Usuario where idempleado=" + cli.getNombre();
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
//Metdodo para Obtiene la cantidad total de usuarios registrados en la base de datos.

    public int BuscarNusuarios() {
        String sSQL = "SELECT COUNT(*) as Nusuarios FROM usuario";

        try {
            int Nusuarios = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sSQL);
            while (rs.next()) {
                Nusuarios = rs.getInt("Nusuarios");
            }
            return Nusuarios;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }
    //Metodo Obtiene el nombre de usuario basado en su identificador (id).

    public static String getNombre(int cod) {
        try {
            String sql = "Select Usu from Usuario where id=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Usu");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        }
    }

    //Metodo para Obtiene información específica de un usuario basado en su código
    public static Usuario listimg(String codigo) {
        Usuario U = new Usuario();
        Connection cn;
        ConexionBD con = new ConexionBD();
        cn = con.Conectar();

        try {
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_USUARIO_POR_CODIGO (?)");
            cs.setString(1, codigo);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                U.setId(rs.getInt("id"));
                U.setNombre(rs.getString("nombre"));
                U.setUsu(rs.getString("usu"));
                U.setPassword(rs.getString("password"));
                U.setRol(rs.getString("rol"));
                U.setIdcliente(rs.getInt("idcliente"));
                U.setNrodocumento(rs.getString("dni"));
                U.setTelefono(rs.getString("telefono"));
                U.setFilename1(rs.getString("filename1"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return U;
    }

//    -----------------------------------------------------------------------------
    //
//    @Override
//    public boolean add(Usuario usu) {
//        boolean flag = false;
//        String sql = "INSERT INTO usuario(Codigo,idempleado,usu,password,rol)"
//                + "VALUES('" + usu.getCodigo() + "','" + usu.getNombre() + "','" + usu.getUsu() + "','" + usu.getPassword() + "','" + usu.getRol() + "')";
//
//        try {
//            con = cn.getConnection();
//            ps = con.prepareStatement(sql);
//            if (ps.executeUpdate() == 1) {
//                flag = true;
//            }
//        } catch (Exception e) {
//            System.err.println(e.getMessage());
//        }
//        return flag;
//    }
//    @Override
//    public boolean Edit(Usuario usu) {
//        boolean flag = false;
//        String sql = "update usuario set idempleado='" + usu.getNombre() + "',usu='" + usu.getUsu() + "',password='" + usu.getPassword() + "',rol='" + usu.getRol() + "',filename1='" + usu.getFilename1() + "',path1='" + usu.getPath1() + "' where id=" + usu.getId();
//        try {
//            con = cn.getConnection();
//            ps = con.prepareStatement(sql);
//            if (ps.executeUpdate() == 1) {
//                flag = true;
//            }
//        } catch (Exception e) {
//            System.err.println(e.getMessage());
//        }
//        return flag;
//    }
    //Codigo para cliente us en InsertarCliente.jsp
    public String Numserieusuario() {
        String sql = "{call sp_generar_codigousuario()}";
        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaj = rs.getString(1);
            }
        } catch (SQLException e) {
        }
        return mensaj;
    }

    public static void main(String[] args) {
        UsuarioDAO mp = new UsuarioDAO();

    }

}
