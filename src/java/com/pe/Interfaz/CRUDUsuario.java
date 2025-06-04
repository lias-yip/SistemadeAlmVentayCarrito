/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pe.Interfaz;

import com.pe.model.entity.Usuario;
import java.util.List;



public interface CRUDUsuario {
     public List ListadoUsuario();
    public Usuario list(int id);
    public boolean add(Usuario usu);
    public boolean Edit(Usuario usu);
    public boolean Eliminar(int id);
}
