/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author valen
 */
@Entity
@Table(name = "planta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Planta.findAll", query = "SELECT p FROM Planta p")
    , @NamedQuery(name = "Planta.findByCodigo", query = "SELECT p FROM Planta p WHERE p.codigo = :codigo")
    , @NamedQuery(name = "Planta.findByNomePopular", query = "SELECT p FROM Planta p WHERE p.nomePopular = :nomePopular")
    , @NamedQuery(name = "Planta.findByNomeCientifico", query = "SELECT p FROM Planta p WHERE p.nomeCientifico = :nomeCientifico")
    , @NamedQuery(name = "Planta.findByOrigem", query = "SELECT p FROM Planta p WHERE p.origem = :origem")
    , @NamedQuery(name = "Planta.findByPropagacao", query = "SELECT p FROM Planta p WHERE p.propagacao = :propagacao")
    , @NamedQuery(name = "Planta.findByEpocaPoda", query = "SELECT p FROM Planta p WHERE p.epocaPoda = :epocaPoda")
    , @NamedQuery(name = "Planta.findByDescricao", query = "SELECT p FROM Planta p WHERE p.descricao = :descricao")
    , @NamedQuery(name = "Planta.findByDataPlanta", query = "SELECT p FROM Planta p WHERE p.dataPlanta = :dataPlanta")
    , @NamedQuery(name = "Planta.findByQuantidade", query = "SELECT p FROM Planta p WHERE p.quantidade = :quantidade")
    , @NamedQuery(name = "Planta.findByImagem", query = "SELECT p FROM Planta p WHERE p.imagem = :imagem")
    , @NamedQuery(name = "Planta.findFilter", query = "SELECT p FROM Planta p WHERE p.nomePopular like :filtro or p.nomeCientifico like :filtro or p.codigoCategoria.nome like :filtro")
})
public class Planta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @Column(name = "nome_popular")
    private String nomePopular;
    @Column(name = "nome_cientifico")
    private String nomeCientifico;
    @Column(name = "origem")
    private String origem;
    @Column(name = "propagacao")
    private String propagacao;
    @Column(name = "epoca_poda")
    private String epocaPoda;
    @Column(name = "descricao")
    private String descricao;
    @Column(name = "data_planta")
    private String dataPlanta;
    @Basic(optional = false)
    @Column(name = "quantidade")
    private int quantidade;
    @Column(name = "imagem")
    private String imagem;
    @JoinTable(name = "inventario", joinColumns = {
        @JoinColumn(name = "codigo_planta", referencedColumnName = "codigo")}, inverseJoinColumns = {
        @JoinColumn(name = "codigo_usuario", referencedColumnName = "codigo")})
    @ManyToMany
    private List<Usuario> usuarioList;
    @JoinColumn(name = "codigo_categoria", referencedColumnName = "codigo")
    @ManyToOne(optional = false)
    private Categoria codigoCategoria;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoPlanta")
    private List<Itensdoacao> itensdoacaoList;

    public Planta() {
    }

    public Planta(Integer codigo) {
        this.codigo = codigo;
    }

    public Planta(Integer codigo, String nomePopular, int quantidade) {
        this.codigo = codigo;
        this.nomePopular = nomePopular;
        this.quantidade = quantidade;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNomePopular() {
        return nomePopular;
    }

    public void setNomePopular(String nomePopular) {
        this.nomePopular = nomePopular;
    }

    public String getNomeCientifico() {
        return nomeCientifico;
    }

    public void setNomeCientifico(String nomeCientifico) {
        this.nomeCientifico = nomeCientifico;
    }

    public String getOrigem() {
        return origem;
    }

    public void setOrigem(String origem) {
        this.origem = origem;
    }

    public String getPropagacao() {
        return propagacao;
    }

    public void setPropagacao(String propagacao) {
        this.propagacao = propagacao;
    }

    public String getEpocaPoda() {
        return epocaPoda;
    }

    public void setEpocaPoda(String epocaPoda) {
        this.epocaPoda = epocaPoda;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDataPlanta() {
        return dataPlanta;
    }

    public void setDataPlanta(String dataPlanta) {
        this.dataPlanta = dataPlanta;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    @XmlTransient
    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }

    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }

    public Categoria getCodigoCategoria() {
        return codigoCategoria;
    }

    public void setCodigoCategoria(Categoria codigoCategoria) {
        this.codigoCategoria = codigoCategoria;
    }

    @XmlTransient
    public List<Itensdoacao> getItensdoacaoList() {
        return itensdoacaoList;
    }

    public void setItensdoacaoList(List<Itensdoacao> itensdoacaoList) {
        this.itensdoacaoList = itensdoacaoList;
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
        if (!(object instanceof Planta)) {
            return false;
        }
        Planta other = (Planta) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Planta[ codigo=" + codigo + " ]";
    }
    
}
