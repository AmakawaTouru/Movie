package com.amakawa.mapper;

import com.amakawa.pojo.Cinema;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CinemaMapper {
    List<Cinema> findAllCinemas();
    Integer addCinema(@Param("c") Cinema cinema);
    Cinema findCinemaById(@Param("id") Long id);
    Integer updateCinema(@Param("c") Cinema cinema);
    Integer rmCinema(@Param("id") Long id);
    List<Cinema> findCinemasByCity(@Param("city") String city);
}
