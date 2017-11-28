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
@Table(name = "doacao")
@NamedQueries({
    @NamedQuery(name = "Doacao.findAll", query = "SELECT d FROM Doacao d"),
    @NamedQuery(name = "Doacao.findCodCategoria", query = "SELECT d FROM Doacao d WHERE d.codigoItensdoacao.codigoPlanta.codigoCategoria.codigo = :codigo"),
    @NamedQuery(name = "Doacao.findFilter", query = "SELECT d FROM Doacao d WHERE d.codigoItensdoacao.codigoPlanta.nomePopular like :filtro or d.codigoItensdoacao.codigoPlanta.nomeCientifico like :filtro or d.codigoItensdoacao.codigoPlanta.codigoCategoria.nome like :filtro")
})
public class Doacao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @Column(name = "data_doacao")
    private String dataDoacao;
    @Column(name = "doada")
    private Boolean doada;
    @Column(name = "descricao")
    private String descricao;
    @JoinColumn(name = "codigo_itensdoacao", referencedColumnName = "codigo")
    @ManyToOne(optional = false)
    private Itensdoacao codigoItensdoacao;
    @JoinColumn(name = "codigo_usuario", referencedColumnName = "codigo")
    @ManyToOne(optional = false)
    private Usuario codigoUsuario;

    public Doacao() {
    }

    public Doacao(Integer codigo) {
        this.codigo = codigo;
    }

    public Doacao(Integer codigo, String dataDoacao) {
        this.codigo = codigo;
        this.dataDoacao = dataDoacao;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getDataDoacao() {
        return dataDoacao;
    }

    public void setDataDoacao(String dataDoacao) {
        this.dataDoacao = dataDoacao;
    }

    public Boolean getDoada() {
        return doada;
    }

    public void setDoada(Boolean doada) {
        this.doada = doada;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Itensdoacao getCodigoItensdoacao() {
        return codigoItensdoacao;
    }

    public void setCodigoItensdoacao(Itensdoacao codigoItensdoacao) {
        this.codigoItensdoacao = codigoItensdoacao;
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
