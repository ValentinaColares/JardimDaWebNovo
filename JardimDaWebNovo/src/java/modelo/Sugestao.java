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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author valen
 */
@Entity
@Table(name = "sugestao")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sugestao.findAll", query = "SELECT s FROM Sugestao s")
    , @NamedQuery(name = "Sugestao.findByCodigo", query = "SELECT s FROM Sugestao s WHERE s.codigo = :codigo")
    , @NamedQuery(name = "Sugestao.findBySugestao", query = "SELECT s FROM Sugestao s WHERE s.sugestao = :sugestao")})
public class Sugestao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @Column(name = "sugestao")
    private String sugestao;
    @JoinColumn(name = "codigo_usuario", referencedColumnName = "codigo")
    @ManyToOne(optional = false)
    private Usuario codigoUsuario;

    public Sugestao() {
    }

    public Sugestao(Integer codigo) {
        this.codigo = codigo;
    }

    public Sugestao(Integer codigo, String sugestao) {
        this.codigo = codigo;
        this.sugestao = sugestao;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getSugestao() {
        return sugestao;
    }

    public void setSugestao(String sugestao) {
        this.sugestao = sugestao;
    }

    public Usuario getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(Usuario codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
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
        if (!(object instanceof Sugestao)) {
            return false;
        }
        Sugestao other = (Sugestao) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Sugestao[ codigo=" + codigo + " ]";
    }
    
}
