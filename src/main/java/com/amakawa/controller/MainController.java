package com.amakawa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {


    @RequestMapping("/")
    public String main(){
        return "mainPage";
    }

    @RequestMapping("/movieList")
    public String movieList(){
        return "movieList";
    }

    @RequestMapping("/cinemaList")
    public String cinemaList(){
        return "cinemaList";
    }

    @RequestMapping("/movieDetail")
    public String movieDetail() {
        return "movieDetail";
    }

    @RequestMapping("/cinemaDetail")
    public String cinemaDetail() {
        return "cinemaDetail";
    }

    @RequestMapping("/test")
    public String test(){
        return "test";
    }

}
