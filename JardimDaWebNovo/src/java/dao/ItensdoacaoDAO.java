/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Itensdoacao;

/**
 *
 * @author valen
 */
public class ItensdoacaoDAO extends GenericDAO<Itensdoacao, Integer> {
    
    public ItensdoacaoDAO(){
        super(Itensdoacao.class); 
    }
}