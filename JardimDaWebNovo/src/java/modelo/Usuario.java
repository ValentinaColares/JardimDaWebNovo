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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author valen
 */
@Entity
@Table(name = "usuario")
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.findByEmail", query = "SELECT u FROM Usuario u WHERE u.email = :filtro"),
    @NamedQuery(name = "Usuario.findFilter", query = "SELECT u FROM Usuario u WHERE u.nome like :filtro")
})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Basic(optional = false)
    @Column(name = "cidade")
    private String cidade;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @Basic(optional = false)
    @Column(name = "bairro")
    private String bairro;
    @Basic(optional = false)
    @Column(name = "endereco")
    private String endereco;
    @Column(name = "cep")
    private String cep;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "senha")
    private String senha;
    @Basic(optional = false)
    @Column(name = "doador")
    private boolean doador;
    @Column(name = "imagem")
    private String imagem;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoUsuario")
    private List<Doacao> doacaoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoUsuario")
    private List<Sugestao> sugestaoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoUsuario")
    private List<Planta> plantaList;

    public Usuario() {
    }

    public Usuario(Integer codigo) {
        this.codigo = codigo;
    }

    public Usuario(Integer codigo, String nome, String cidade, String estado, String bairro, String endereco, String email, String senha, boolean doador) {
        this.codigo = codigo;
        this.nome = nome;
        this.cidade = cidade;
        this.estado = estado;
        this.bairro = bairro;
        this.endereco = endereco;
        this.email = email;
        this.senha = senha;
        this.doador = doador;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public boolean getDoador() {
        return doador;
    }

    public void setDoador(boolean doador) {
        this.doador = doador;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public List<Doacao> getDoacaoList() {
        return doacaoList;
    }

    public void setDoacaoList(List<Doacao> doacaoList) {
        this.doacaoList = doacaoList;
    }

    public List<Sugestao> getSugestaoList() {
        return sugestaoList;
    }

    public void setSugestaoList(List<Sugestao> sugestaoList) {
        this.sugestaoList = sugestaoList;
    }

    public List<Planta> getPlantaList() {
        return plantaList;
    }

    public void setPlantaList(List<Planta> plantaList) {
        this.plantaList = plantaList;
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
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Usuario[ codigo=" + codigo + " ]";
    }
    
}
