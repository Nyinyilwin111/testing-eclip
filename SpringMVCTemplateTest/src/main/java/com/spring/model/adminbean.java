

package com.spring.model;


import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter

public class adminbean {

    private int id;

    @NotBlank
    private String name;

    @NotBlank

    private String email;

    @NotBlank
    private String password;
}
