/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pe.Interfaz;


import com.pe.model.entity.Auxiliar;
import java.util.List;
public interface CRUDCliente {
     public List ListadoCliente();
    public Auxiliar list(int id);
    public boolean add(Auxiliar cli);
    public boolean Edit(Auxiliar cli);
    public boolean Eliminar(int id); 
}
