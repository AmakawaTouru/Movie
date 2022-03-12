package com.amakawa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MovieDetailController {

    @RequestMapping("/movieDetail")
    public String movieDetail() {
        return "movieDetail";
    }


}
