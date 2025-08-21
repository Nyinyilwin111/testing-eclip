package com.spring.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Getter @Setter
public class Subscription {

    private int subscriptionId;
    private Integer userId;
    private Integer packageId;

    private Date startDate;
    private Date endDate;
}
