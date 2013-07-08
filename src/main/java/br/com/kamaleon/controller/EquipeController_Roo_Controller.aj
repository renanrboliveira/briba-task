// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.kamaleon.controller;

import br.com.kamaleon.business.pessoa.usuario.Equipe;
import br.com.kamaleon.business.pessoa.usuario.UsuarioService;
import br.com.kamaleon.controller.EquipeController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect EquipeController_Roo_Controller {
    
    @Autowired
    UsuarioService EquipeController.usuarioService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EquipeController.create(@Valid Equipe equipe, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, equipe);
            return "equipes/create";
        }
        uiModel.asMap().clear();
        equipe.persist();
        return "redirect:/equipes/" + encodeUrlPathSegment(equipe.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EquipeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Equipe());
        return "equipes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EquipeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("equipe", Equipe.findEquipe(id));
        uiModel.addAttribute("itemId", id);
        return "equipes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EquipeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("equipes", Equipe.findEquipeEntries(firstResult, sizeNo));
            float nrOfPages = (float) Equipe.countEquipes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("equipes", Equipe.findAllEquipes());
        }
        return "equipes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EquipeController.update(@Valid Equipe equipe, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, equipe);
            return "equipes/update";
        }
        uiModel.asMap().clear();
        equipe.merge();
        return "redirect:/equipes/" + encodeUrlPathSegment(equipe.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EquipeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Equipe.findEquipe(id));
        return "equipes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EquipeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Equipe equipe = Equipe.findEquipe(id);
        equipe.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/equipes";
    }
    
    void EquipeController.populateEditForm(Model uiModel, Equipe equipe) {
        uiModel.addAttribute("equipe", equipe);
        uiModel.addAttribute("usuarios", usuarioService.findAllUsuarios());
    }
    
    String EquipeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
