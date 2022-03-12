package com.amakawa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage")
public class ManagerController {

    @RequestMapping("/index")
    public String manager(){
        return "manage";
    }

}
