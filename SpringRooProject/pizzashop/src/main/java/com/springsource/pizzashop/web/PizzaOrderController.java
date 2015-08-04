package com.springsource.pizzashop.web;

import com.springsource.pizzashop.domain.PizzaOrder;
import com.springsource.pizzashop.domain.PizzaOrderPk;
import com.springsource.pizzashop.service.PizzaOrderService;
import com.springsource.pizzashop.service.PizzaService;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.ConversionService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/pizzaorders")
public class PizzaOrderController {

	private ConversionService conversionService;

	@Autowired
    PizzaOrderService pizzaOrderService;

	@Autowired
    PizzaService pizzaService;

	@Autowired
    public PizzaOrderController(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid PizzaOrder pizzaOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pizzaOrder);
            return "pizzaorders/create";
        }
        uiModel.asMap().clear();
        pizzaOrderService.savePizzaOrder(pizzaOrder);
        return "redirect:/pizzaorders/" + encodeUrlPathSegment(conversionService.convert(pizzaOrder.getId(), String.class), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new PizzaOrder());
        return "pizzaorders/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") PizzaOrderPk id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("pizzaorder", pizzaOrderService.findPizzaOrder(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "pizzaorders/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("pizzaorders", pizzaOrderService.findPizzaOrderEntries(firstResult, sizeNo));
            float nrOfPages = (float) pizzaOrderService.countAllPizzaOrders() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("pizzaorders", pizzaOrderService.findAllPizzaOrders());
        }
        addDateTimeFormatPatterns(uiModel);
        return "pizzaorders/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid PizzaOrder pizzaOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pizzaOrder);
            return "pizzaorders/update";
        }
        uiModel.asMap().clear();
        pizzaOrderService.updatePizzaOrder(pizzaOrder);
        return "redirect:/pizzaorders/" + encodeUrlPathSegment(conversionService.convert(pizzaOrder.getId(), String.class), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") PizzaOrderPk id, Model uiModel) {
        populateEditForm(uiModel, pizzaOrderService.findPizzaOrder(id));
        return "pizzaorders/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") PizzaOrderPk id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PizzaOrder pizzaOrder = pizzaOrderService.findPizzaOrder(id);
        pizzaOrderService.deletePizzaOrder(pizzaOrder);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pizzaorders";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("pizzaOrder_deliverydate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, PizzaOrder pizzaOrder) {
        uiModel.addAttribute("pizzaOrder", pizzaOrder);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("pizzas", pizzaService.findAllPizzas());
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }

	@RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showJson(@PathVariable("id") PizzaOrderPk id) {
        PizzaOrder pizzaOrder = pizzaOrderService.findPizzaOrder(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (pizzaOrder == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(pizzaOrder.toJson(), headers, HttpStatus.OK);
    }

	@RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<PizzaOrder> result = pizzaOrderService.findAllPizzaOrders();
        return new ResponseEntity<String>(PizzaOrder.toJsonArray(result), headers, HttpStatus.OK);
    }

	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json) {
        PizzaOrder pizzaOrder = PizzaOrder.fromJsonToPizzaOrder(json);
        pizzaOrderService.savePizzaOrder(pizzaOrder);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

	@RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJsonArray(@RequestBody String json) {
        for (PizzaOrder pizzaOrder: PizzaOrder.fromJsonArrayToPizzaOrders(json)) {
            pizzaOrderService.savePizzaOrder(pizzaOrder);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

	@RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        PizzaOrder pizzaOrder = PizzaOrder.fromJsonToPizzaOrder(json);
        if (pizzaOrderService.updatePizzaOrder(pizzaOrder) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }

	@RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (PizzaOrder pizzaOrder: PizzaOrder.fromJsonArrayToPizzaOrders(json)) {
            if (pizzaOrderService.updatePizzaOrder(pizzaOrder) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> deleteFromJson(@PathVariable("id") PizzaOrderPk id) {
        PizzaOrder pizzaOrder = pizzaOrderService.findPizzaOrder(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (pizzaOrder == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        pizzaOrderService.deletePizzaOrder(pizzaOrder);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
}
