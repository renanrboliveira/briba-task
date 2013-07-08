// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.kamaleon.business.projeto.categoria;

import br.com.kamaleon.business.projeto.categoria.Categoria;
import br.com.kamaleon.business.projeto.categoria.CategoriaService;
import java.util.List;

privileged aspect CategoriaService_Roo_Service {
    
    public abstract long CategoriaService.countAllCategorias();    
    public abstract void CategoriaService.deleteCategoria(Categoria categoria);    
    public abstract Categoria CategoriaService.findCategoria(Long id);    
    public abstract List<Categoria> CategoriaService.findAllCategorias();    
    public abstract List<Categoria> CategoriaService.findCategoriaEntries(int firstResult, int maxResults);    
    public abstract void CategoriaService.saveCategoria(Categoria categoria);    
    public abstract Categoria CategoriaService.updateCategoria(Categoria categoria);    
}
