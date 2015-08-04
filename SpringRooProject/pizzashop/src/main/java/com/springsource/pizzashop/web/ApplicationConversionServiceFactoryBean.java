package com.springsource.pizzashop.web;

import com.springsource.pizzashop.domain.Base;
import com.springsource.pizzashop.domain.Pizza;
import com.springsource.pizzashop.domain.PizzaOrder;
import com.springsource.pizzashop.domain.PizzaOrderPk;
import com.springsource.pizzashop.domain.Topping;
import com.springsource.pizzashop.service.BaseService;
import com.springsource.pizzashop.service.PizzaOrderService;
import com.springsource.pizzashop.service.PizzaService;
import com.springsource.pizzashop.service.ToppingService;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;

@Configurable
/**
 * A central place to register application converters and formatters. 
 */
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
	}

	@Autowired
    BaseService baseService;

	@Autowired
    PizzaService pizzaService;

	@Autowired
    PizzaOrderService pizzaOrderService;

	@Autowired
    ToppingService toppingService;

	public Converter<Base, String> getBaseToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.springsource.pizzashop.domain.Base, java.lang.String>() {
            public String convert(Base base) {
                return new StringBuilder().append(base.getName()).toString();
            }
        };
    }

	public Converter<Long, Base> getIdToBaseConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.springsource.pizzashop.domain.Base>() {
            public com.springsource.pizzashop.domain.Base convert(java.lang.Long id) {
                return baseService.findBase(id);
            }
        };
    }

	public Converter<String, Base> getStringToBaseConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.springsource.pizzashop.domain.Base>() {
            public com.springsource.pizzashop.domain.Base convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Base.class);
            }
        };
    }

	public Converter<Pizza, String> getPizzaToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.springsource.pizzashop.domain.Pizza, java.lang.String>() {
            public String convert(Pizza pizza) {
                return new StringBuilder().append(pizza.getName()).append(' ').append(pizza.getPrice()).toString();
            }
        };
    }

	public Converter<Long, Pizza> getIdToPizzaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.springsource.pizzashop.domain.Pizza>() {
            public com.springsource.pizzashop.domain.Pizza convert(java.lang.Long id) {
                return pizzaService.findPizza(id);
            }
        };
    }

	public Converter<String, Pizza> getStringToPizzaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.springsource.pizzashop.domain.Pizza>() {
            public com.springsource.pizzashop.domain.Pizza convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Pizza.class);
            }
        };
    }

	public Converter<PizzaOrder, String> getPizzaOrderToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.springsource.pizzashop.domain.PizzaOrder, java.lang.String>() {
            public String convert(PizzaOrder pizzaOrder) {
                return new StringBuilder().append(pizzaOrder.getName()).append(' ').append(pizzaOrder.getAddress()).append(' ').append(pizzaOrder.getTotal()).append(' ').append(pizzaOrder.getDeliveryDate()).toString();
            }
        };
    }

	public Converter<PizzaOrderPk, PizzaOrder> getIdToPizzaOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<com.springsource.pizzashop.domain.PizzaOrderPk, com.springsource.pizzashop.domain.PizzaOrder>() {
            public com.springsource.pizzashop.domain.PizzaOrder convert(com.springsource.pizzashop.domain.PizzaOrderPk id) {
                return pizzaOrderService.findPizzaOrder(id);
            }
        };
    }

	public Converter<String, PizzaOrder> getStringToPizzaOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.springsource.pizzashop.domain.PizzaOrder>() {
            public com.springsource.pizzashop.domain.PizzaOrder convert(String id) {
                return getObject().convert(getObject().convert(id, PizzaOrderPk.class), PizzaOrder.class);
            }
        };
    }

	public Converter<Topping, String> getToppingToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.springsource.pizzashop.domain.Topping, java.lang.String>() {
            public String convert(Topping topping) {
                return new StringBuilder().append(topping.getName()).toString();
            }
        };
    }

	public Converter<Long, Topping> getIdToToppingConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.springsource.pizzashop.domain.Topping>() {
            public com.springsource.pizzashop.domain.Topping convert(java.lang.Long id) {
                return toppingService.findTopping(id);
            }
        };
    }

	public Converter<String, Topping> getStringToToppingConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.springsource.pizzashop.domain.Topping>() {
            public com.springsource.pizzashop.domain.Topping convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Topping.class);
            }
        };
    }

	public Converter<String, PizzaOrderPk> getJsonToPizzaOrderPkConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.springsource.pizzashop.domain.PizzaOrderPk>() {
            public PizzaOrderPk convert(String encodedJson) {
                return PizzaOrderPk.fromJsonToPizzaOrderPk(new String(Base64.decodeBase64(encodedJson)));
            }
        };
    }

	public Converter<PizzaOrderPk, String> getPizzaOrderPkToJsonConverter() {
        return new org.springframework.core.convert.converter.Converter<com.springsource.pizzashop.domain.PizzaOrderPk, java.lang.String>() {
            public String convert(PizzaOrderPk pizzaOrderPk) {
                return Base64.encodeBase64URLSafeString(pizzaOrderPk.toJson().getBytes());
            }
        };
    }

	public void installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getBaseToStringConverter());
        registry.addConverter(getIdToBaseConverter());
        registry.addConverter(getStringToBaseConverter());
        registry.addConverter(getPizzaToStringConverter());
        registry.addConverter(getIdToPizzaConverter());
        registry.addConverter(getStringToPizzaConverter());
        registry.addConverter(getPizzaOrderToStringConverter());
        registry.addConverter(getIdToPizzaOrderConverter());
        registry.addConverter(getStringToPizzaOrderConverter());
        registry.addConverter(getToppingToStringConverter());
        registry.addConverter(getIdToToppingConverter());
        registry.addConverter(getStringToToppingConverter());
        registry.addConverter(getJsonToPizzaOrderPkConverter());
        registry.addConverter(getPizzaOrderPkToJsonConverter());
    }

	public void afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
}
