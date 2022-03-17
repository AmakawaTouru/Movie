package com.amakawa.service;

import com.amakawa.pojo.Cinema;

import java.util.List;

public interface ICinemaService {
    List<Cinema> findAllCinemas();
    Integer addCinema(Cinema cinema);
    Cinema findCinemaById(Long id);
    Integer updateCinema(Cinema cinema);
    Integer rmCinema(Long id);
    List<Cinema> findCinemasByCity(String city);
}
