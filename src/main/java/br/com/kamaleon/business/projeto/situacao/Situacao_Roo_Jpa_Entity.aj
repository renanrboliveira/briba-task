// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.kamaleon.business.projeto.situacao;

import br.com.kamaleon.business.projeto.situacao.Situacao;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Version;

privileged aspect Situacao_Roo_Jpa_Entity {
    
    declare @type: Situacao: @Entity;
    
    @Version
    @Column(name = "version")
    private Integer Situacao.version;
    
    public Integer Situacao.getVersion() {
        return this.version;
    }
    
}