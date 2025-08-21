package com.spring.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Package {
    private int id;
    private String name;
    private double price;
    private int duration_in_days;
    private String description;
  
}
