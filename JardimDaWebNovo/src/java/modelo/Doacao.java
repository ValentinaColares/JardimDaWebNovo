/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author valen
 */
@Entity
@Table(name = "doacao")
@NamedQueries({
    @NamedQuery(name = "Doacao.findAll", query = "SELECT d FROM Doacao d")
    , @NamedQuery(name = "Doacao.findByCodigo", query = "SELECT d FROM Doacao d WHERE d.codigo = :codigo")
    , @NamedQuery(name = "Doacao.findByDataDoacao", query = "SELECT d FROM Doacao d WHERE d.dataDoacao = :dataDoacao")})
public class Doacao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @Column(name = "data_doacao")
    @Temporal(TemporalType.DATE)
    private Date dataDoacao;

    public Doacao() {
    }

    public Doacao(Integer codigo) {
        this.codigo = codigo;
    }

    public Doacao(Integer codigo, Date dataDoacao) {
        this.codigo = codigo;
        this.dataDoacao = dataDoacao;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Date getDataDoacao() {
        return dataDoacao;
    }

    public void setDataDoacao(Date dataDoacao) {
        this.dataDoacao = dataDoacao;
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
        if (!(object instanceof Doacao)) {
            return false;
        }
        Doacao other = (Doacao) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Doacao[ codigo=" + codigo + " ]";
    }
    
}
