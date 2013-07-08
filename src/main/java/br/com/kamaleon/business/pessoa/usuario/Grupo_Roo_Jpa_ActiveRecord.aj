// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.kamaleon.business.pessoa.usuario;

import br.com.kamaleon.business.pessoa.usuario.Grupo;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Grupo_Roo_Jpa_ActiveRecord {
    
    public static long Grupo.countGrupoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Grupo o", Long.class).getSingleResult();
    }
    
    public static List<Grupo> Grupo.findAllGrupoes() {
        return entityManager().createQuery("SELECT o FROM Grupo o", Grupo.class).getResultList();
    }
    
    public static Grupo Grupo.findGrupo(Long id) {
        if (id == null) return null;
        return entityManager().find(Grupo.class, id);
    }
    
    public static List<Grupo> Grupo.findGrupoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Grupo o", Grupo.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Grupo Grupo.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Grupo merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
