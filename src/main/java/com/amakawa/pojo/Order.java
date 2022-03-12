package com.amakawa.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Order {
    private long orderId;
    private long orderUserId;
    private long orderSchedule;
    private String orderSeats;
    private int orderStatus;
    private float orderPrice;
    private Date orderPaytime;
}
