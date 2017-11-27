/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Doacao;

/**
 *
 * @author valen
 */
public class DoacaoDAO extends GenericDAO<Doacao, Integer> {
    
    public DoacaoDAO(){
        super(Doacao.class); 
    }     
    public List<Doacao> listarFiltro(Integer codigo, String tipo){
        List<Doacao> lista;
        try{
            String namedQuery = null;
            if(tipo.equals("C")){
                namedQuery = "findCodCategoria";
            }
            lista = em.createNamedQuery("Doacao." + namedQuery).setParameter("codigo", codigo).getResultList();
        }catch(Exception ex){
            ex.printStackTrace();
            lista = null;
        }
        return lista;
    }
}
