/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Planta;

/**
 *
 * @author valen
 */
public class PlantaDAO extends GenericDAO<Planta, Integer> {
    
    public PlantaDAO(){
        super(Planta.class); 
    }    
}
