// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.kamaleon.business.endereco;

import br.com.kamaleon.business.endereco.Endereco;

privileged aspect Endereco_Roo_JavaBean {
    
    public String Endereco.getLogradouro() {
        return this.logradouro;
    }
    
    public void Endereco.setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }
    
    public String Endereco.getBairro() {
        return this.bairro;
    }
    
    public void Endereco.setBairro(String bairro) {
        this.bairro = bairro;
    }
    
    public String Endereco.getNumero() {
        return this.numero;
    }
    
    public void Endereco.setNumero(String numero) {
        this.numero = numero;
    }
    
    public String Endereco.getCep() {
        return this.cep;
    }
    
    public void Endereco.setCep(String cep) {
        this.cep = cep;
    }
    
    public String Endereco.getEstado() {
        return this.estado;
    }
    
    public void Endereco.setEstado(String estado) {
        this.estado = estado;
    }
    
    public String Endereco.getCidade() {
        return this.cidade;
    }
    
    public void Endereco.setCidade(String cidade) {
        this.cidade = cidade;
    }
    
}