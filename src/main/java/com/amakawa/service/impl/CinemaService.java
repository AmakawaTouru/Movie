package com.amakawa.service.impl;

import com.amakawa.mapper.CinemaMapper;
import com.amakawa.pojo.Cinema;
import com.amakawa.service.ICinemaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CinemaService implements ICinemaService {

    @Autowired
    private CinemaMapper cinemaMapper;

    @Override
    public List<Cinema> findAllCinemas() {
        return cinemaMapper.findAllCinemas();
    }

    @Override
    public Integer addCinema(Cinema cinema) {
        return cinemaMapper.addCinema(cinema);
    }

    @Override
    public Cinema findCinemaById(Long id) {
        return cinemaMapper.findCinemaById(id);
    }

    @Override
    public Integer updateCinema(Cinema cinema) {
        return cinemaMapper.updateCinema(cinema);
    }

    @Override
    public Integer rmCinema(Long id) {
        return cinemaMapper.rmCinema(id);
    }

    @Override
    public List<Cinema> findCinemasByCity(String city) {
        return cinemaMapper.findCinemasByCity(city);
    }
}
