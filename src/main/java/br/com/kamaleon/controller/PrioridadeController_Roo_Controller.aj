// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.kamaleon.controller;

import br.com.kamaleon.business.projeto.prioridade.Prioridade;
import br.com.kamaleon.business.projeto.prioridade.PrioridadeService;
import br.com.kamaleon.controller.PrioridadeController;
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

privileged aspect PrioridadeController_Roo_Controller {
    
    @Autowired
    PrioridadeService PrioridadeController.prioridadeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PrioridadeController.create(@Valid Prioridade prioridade, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, prioridade);
            return "prioridades/create";
        }
        uiModel.asMap().clear();
        prioridadeService.savePrioridade(prioridade);
        return "redirect:/prioridades/" + encodeUrlPathSegment(prioridade.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PrioridadeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Prioridade());
        return "prioridades/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PrioridadeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("prioridade", prioridadeService.findPrioridade(id));
        uiModel.addAttribute("itemId", id);
        return "prioridades/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PrioridadeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("prioridades", prioridadeService.findPrioridadeEntries(firstResult, sizeNo));
            float nrOfPages = (float) prioridadeService.countAllPrioridades() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("prioridades", prioridadeService.findAllPrioridades());
        }
        return "prioridades/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PrioridadeController.update(@Valid Prioridade prioridade, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, prioridade);
            return "prioridades/update";
        }
        uiModel.asMap().clear();
        prioridadeService.updatePrioridade(prioridade);
        return "redirect:/prioridades/" + encodeUrlPathSegment(prioridade.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PrioridadeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, prioridadeService.findPrioridade(id));
        return "prioridades/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PrioridadeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Prioridade prioridade = prioridadeService.findPrioridade(id);
        prioridadeService.deletePrioridade(prioridade);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/prioridades";
    }
    
    void PrioridadeController.populateEditForm(Model uiModel, Prioridade prioridade) {
        uiModel.addAttribute("prioridade", prioridade);
    }
    
    String PrioridadeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
