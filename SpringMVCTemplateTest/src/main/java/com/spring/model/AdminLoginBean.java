package com.spring.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminLoginBean {

    @NotBlank

    private String email;

    @NotBlank
    private String password;
}
