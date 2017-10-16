/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.text.DateFormat;
import java.util.Date;

/**
 *
 * @author Rodrigo_Buroni
 */
public class Data {
    Date d = new Date();//Pega a data do sistema sem formatacao.
    DateFormat sdf = DateFormat.getDateInstance(DateFormat.MEDIUM);//Cria a formatacao .FULL=('SEMANA', 'Dia' de 'mes' de '2017')-- .LONG=('Dia' de 'mes' de '2017')-- .MEDIUM =(DD/MM/AAAA)-- .SHORT = (DD/MM/AA).
        
        public String getData(){
            return sdf.format(d);//formata e retorna data.
        }
}
