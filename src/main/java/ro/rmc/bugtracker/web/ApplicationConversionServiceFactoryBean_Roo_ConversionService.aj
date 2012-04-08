// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.rmc.bugtracker.web;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import ro.rmc.bugtracker.domain.Product;
import ro.rmc.bugtracker.web.ApplicationConversionServiceFactoryBean;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Product, String> ApplicationConversionServiceFactoryBean.getProductToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ro.rmc.bugtracker.domain.Product, java.lang.String>() {
            public String convert(Product product) {
                return new StringBuilder().toString();
            }
        };
    }
    
    public Converter<Long, Product> ApplicationConversionServiceFactoryBean.getIdToProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ro.rmc.bugtracker.domain.Product>() {
            public ro.rmc.bugtracker.domain.Product convert(java.lang.Long id) {
                return Product.findProduct(id);
            }
        };
    }
    
    public Converter<String, Product> ApplicationConversionServiceFactoryBean.getStringToProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ro.rmc.bugtracker.domain.Product>() {
            public ro.rmc.bugtracker.domain.Product convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Product.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getProductToStringConverter());
        registry.addConverter(getIdToProductConverter());
        registry.addConverter(getStringToProductConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}