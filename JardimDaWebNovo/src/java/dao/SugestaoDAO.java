/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Sugestao;

/**
 *
 * @author valen
 */
public class SugestaoDAO extends GenericDAO<Sugestao, Integer> {
    
    public SugestaoDAO(){
        super(Sugestao.class); 
    }
    
}
