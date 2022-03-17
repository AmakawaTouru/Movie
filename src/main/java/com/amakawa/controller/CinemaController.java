package com.amakawa.controller;

import com.alibaba.fastjson.JSONObject;
import com.amakawa.dto.MovieDto;
import com.amakawa.pojo.Cinema;
import com.amakawa.pojo.Movie;
import com.amakawa.service.ICinemaService;
import com.amakawa.util.DateFormatUtils;
import com.amakawa.util.UUIDUtils;
import com.amakawa.util.UpLoadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/cinema")
public class CinemaController {

    @Autowired
    private ICinemaService cinemaService;

    @RequestMapping("/findAllCinemas")
    @ResponseBody
    public JSONObject findAllCinemas(){
        JSONObject json = new JSONObject();
        List<Cinema> cinemas = cinemaService.findAllCinemas();
        json.put("code",0);
        json.put("count", cinemas.size());
        json.put("data", cinemas);
        return json;
    }

    @RequestMapping("/findCinemasByCity")
    @ResponseBody
    public JSONObject findCinemasByCity(@RequestParam("city") String city){
        JSONObject json = new JSONObject();
        List<Cinema> cinemas = cinemaService.findCinemasByCity(city);
        json.put("code",0);
        json.put("count", cinemas.size());
        json.put("data", cinemas);
        return json;
    }


    @RequestMapping("/addCinema")
    @ResponseBody
    public JSONObject addMovie(@RequestParam(value = "file",required = false) MultipartFile file,
                               Cinema cinema,
                               HttpServletRequest request){
        JSONObject json = new JSONObject();
        String upFileName =file.getOriginalFilename();
        String UUID = UUIDUtils.getUUID();
        String localPath = UpLoadUtils.getUpPicLocalPath(upFileName,UUID,"/upload/cinemas",request);
        String dbPath = UpLoadUtils.getUpPicDbPath(upFileName, UUID,"../upload/cinemas/", request);
        cinema.setCinemaPoster(dbPath);
        System.out.println(cinema);
        Integer rs = cinemaService.addCinema(cinema);
        if (rs > 0){
            try {
                file.transferTo(new File(localPath));
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println("成功写入文件，路径为："+localPath);
            json.put("code", 0);
            json.put("msg", "添加电影院成功!");
        } else {
            json.put("code", 200);
            json.put("msg", "添加电影院失败");
        }
        return json;
    }


    @RequestMapping("/findCinemaById")
    @ResponseBody
    public JSONObject findCinemaById(@RequestParam("cinema_id") long id){
        JSONObject json = new JSONObject();
        Cinema cinema = cinemaService.findCinemaById(id);
        json.put("code", 0);
        json.put("data", cinema);
        return json;
    }

    @ResponseBody
    @RequestMapping("/updateCinema")
    public JSONObject updateCinema(@RequestParam(value = "file",required = false) MultipartFile file,
                                  Cinema cinema,
                                  HttpServletRequest request) {
        JSONObject json = new JSONObject();
        String localPath = null;
        String dbPath = null;
        if (file != null){
            String upFileName =file.getOriginalFilename();
            String UUID = UUIDUtils.getUUID();
            localPath = UpLoadUtils.getUpPicLocalPath(upFileName,UUID,"/upload/cinemas", request);
            dbPath = UpLoadUtils.getUpPicDbPath(upFileName, UUID, "../upload/cinemas/",request);
            cinema.setCinemaPoster(dbPath);
        } else {
            Cinema oldCinema = cinemaService.findCinemaById(cinema.getCinemaId());
            cinema.setCinemaPoster(oldCinema.getCinemaPoster());
        }
        Integer rs = cinemaService.updateCinema(cinema);
        if (rs > 0){
            if (localPath != null){
                try {
                    file.transferTo(new File(localPath));
                    System.out.println("成功写入文件，路径为："+localPath);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            json.put("code", 0);
            json.put("msg", "修改电影院成功！");
        } else {
            json.put("code", 200);
            json.put("msg", "修改电影院失败");
        }
        return json;
    }

    @ResponseBody
    @RequestMapping("rmCinema")
    public JSONObject rmCinema(@RequestParam("cinemaId") Long id){
        JSONObject json = new JSONObject();
        Integer rs = cinemaService.rmCinema(id);
        if (rs > 0){
            json.put("code", 0);
            json.put("msg", "删除成功！");
        } else {
            json.put("code", 200);
            json.put("msg", "删除失败！");
        }
        return json;
    }







}
