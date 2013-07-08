// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.kamaleon.controller;

import br.com.kamaleon.business.projeto.modulo.SubModulo;
import br.com.kamaleon.business.projeto.modulo.SubModuloService;
import br.com.kamaleon.controller.SubModuloController;
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

privileged aspect SubModuloController_Roo_Controller {
    
    @Autowired
    SubModuloService SubModuloController.subModuloService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SubModuloController.create(@Valid SubModulo subModulo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, subModulo);
            return "submoduloes/create";
        }
        uiModel.asMap().clear();
        subModuloService.saveSubModulo(subModulo);
        return "redirect:/submoduloes/" + encodeUrlPathSegment(subModulo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SubModuloController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("submodulo", subModuloService.findSubModulo(id));
        uiModel.addAttribute("itemId", id);
        return "submoduloes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SubModuloController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("submoduloes", subModuloService.findSubModuloEntries(firstResult, sizeNo));
            float nrOfPages = (float) subModuloService.countAllSubModuloes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("submoduloes", subModuloService.findAllSubModuloes());
        }
        return "submoduloes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SubModuloController.update(@Valid SubModulo subModulo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, subModulo);
            return "submoduloes/update";
        }
        uiModel.asMap().clear();
        subModuloService.updateSubModulo(subModulo);
        return "redirect:/submoduloes/" + encodeUrlPathSegment(subModulo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SubModuloController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, subModuloService.findSubModulo(id));
        return "submoduloes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SubModuloController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SubModulo subModulo = subModuloService.findSubModulo(id);
        subModuloService.deleteSubModulo(subModulo);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/submoduloes";
    }
    
    String SubModuloController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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