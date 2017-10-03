/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author valen
 */
@Entity
@Table(name = "itensdoacao")
@NamedQueries({
    @NamedQuery(name = "Itensdoacao.findAll", query = "SELECT i FROM Itensdoacao i")
    , @NamedQuery(name = "Itensdoacao.findByCodigo", query = "SELECT i FROM Itensdoacao i WHERE i.codigo = :codigo")
    , @NamedQuery(name = "Itensdoacao.findByQuantidade", query = "SELECT i FROM Itensdoacao i WHERE i.quantidade = :quantidade")})
public class Itensdoacao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @Column(name = "quantidade")
    private int quantidade;
    @JoinColumn(name = "codigo_planta", referencedColumnName = "codigo")
    @ManyToOne(optional = false)
    private Planta codigoPlanta;

    public Itensdoacao() {
    }

    public Itensdoacao(Integer codigo) {
        this.codigo = codigo;
    }

    public Itensdoacao(Integer codigo, int quantidade) {
        this.codigo = codigo;
        this.quantidade = quantidade;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Planta getCodigoPlanta() {
        return codigoPlanta;
    }

    public void setCodigoPlanta(Planta codigoPlanta) {
        this.codigoPlanta = codigoPlanta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Itensdoacao)) {
            return false;
        }
        Itensdoacao other = (Itensdoacao) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Itensdoacao[ codigo=" + codigo + " ]";
    }
    
}
