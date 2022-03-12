package com.amakawa.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Schedule {
    private long scheduleId;
    private long scheduleHall;
    private long scheduleMovie;
    private Date scheduleOnShow;
    private float schedulePrice;
    private int scheduleRemainNum;
    private int scheduleStatus;
}
