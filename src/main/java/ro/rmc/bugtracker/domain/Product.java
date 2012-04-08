package ro.rmc.bugtracker.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "PRODUCT")
public class Product {

    @NotNull
    @Size(min = 3)
    private String name;

    @Size(max = 500)
    private String description;
}
