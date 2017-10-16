/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Planta;

/**
 *
 * @author valen
 */
public class PlantaDAO extends GenericDAO<Planta, Integer> {
    
    public PlantaDAO(){
        super(Planta.class); 
    } 
    public List<Planta> listarFiltro(Integer codigo, String tipo){
        List<Planta> lista;
        try{
            String namedQuery = null;
            if(tipo.equals("C")){
                namedQuery = "findCodCategoria";
            }
            lista = em.createNamedQuery("Planta." + namedQuery).setParameter("codigo", codigo).getResultList();
        }catch(Exception ex){
            ex.printStackTrace();
            lista = null;
        }
        return lista;
    }
}
