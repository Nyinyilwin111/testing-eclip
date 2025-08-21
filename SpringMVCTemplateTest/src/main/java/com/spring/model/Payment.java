package com.spring.model;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class Payment {
    private int id;
    private int userId;
    private int packageId;
    private int paymentMethodId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date paymentDate;
    private String screenshot_path;
    private String status;
}