package com.amakawa.controller;


import com.alibaba.fastjson.JSONObject;
import com.amakawa.dto.MovieDto;
import com.amakawa.mapper.MovieMapper;
import com.amakawa.pojo.Movie;
import com.amakawa.service.impl.MovieService;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/movie")
public class MovieController {

    @Autowired
    private MovieService movieService;

    @RequestMapping("/findAllMovies")
    @ResponseBody
    public JSONObject findAllMovie(){
        JSONObject json = new JSONObject();
        List<Movie> upcomingMovieList = movieService.findAllMovie(0);
        List<Movie> movieList = movieService.findAllMovie(1);
        List<Movie> outMovieList = movieService.findAllMovie(2);
        json.put("data", movieList);
        json.put("data2", upcomingMovieList);
        json.put("data3", outMovieList);
        return json;
    }

    //todo
    // 这里还有cinima会复用，所以还有东西会需要补充。
    @RequestMapping("/findMovieById")
    @ResponseBody
    public JSONObject findMovieById(@RequestParam("movie_id") long id){
        JSONObject json = new JSONObject();
        Movie movie = movieService.findMovieById(id);
        json.put("code", 0);
        json.put("data", movie);
        return json;
    }


    @RequestMapping("/addMovie")
    @ResponseBody
    public JSONObject addMovie(@RequestParam(value = "file",required = false) MultipartFile file,
                               Movie movie,
                               HttpServletRequest request){
        JSONObject json = new JSONObject();
        String upFileName =file.getOriginalFilename();
        String UUID = UUIDUtils.getUUID();
        String localPath = UpLoadUtils.getUpPicLocalPath(upFileName,UUID,"/upload/movies", request);
        String dbPath = UpLoadUtils.getUpPicDbPath(upFileName, UUID,"../upload/movies/", request);
        Date releaseDate = DateFormatUtils.StringToDate("yyyy-MM-dd", movie.getMovieRelease());
        MovieDto movieDto = new MovieDto(movie);
        movieDto.setMovieRelease(releaseDate);
        movieDto.setMoviePoster(dbPath);
        Integer rs = movieService.addMovie(movieDto);
        if (rs > 0){
            try {
                file.transferTo(new File(localPath));
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println("成功写入文件，路径为："+localPath);
            json.put("code", 0);
            json.put("msg", "添加电影成功!");
        } else {
            json.put("code", 200);
            json.put("msg", "添加电影失败");
        }
        return json;
    }

    @ResponseBody
    @RequestMapping("/updateMovie")
    public JSONObject updateMovie(@RequestParam(value = "file",required = false) MultipartFile file,
                                  Movie movie,
                                  HttpServletRequest request) {
        JSONObject json = new JSONObject();
        String localPath = null;
        String dbPath = null;
        MovieDto movieDto = new MovieDto(movie);
        if (file != null){
            String upFileName =file.getOriginalFilename();
            String UUID = UUIDUtils.getUUID();
            localPath = UpLoadUtils.getUpPicLocalPath(upFileName,UUID,"/upload/movies", request);
            dbPath = UpLoadUtils.getUpPicDbPath(upFileName, UUID, "../upload/movies/",request);
            movieDto.setMoviePoster(dbPath);
        } else {
            Movie oldMovie = movieService.findMovieById(movie.getMovieId());
            movieDto.setMoviePoster(oldMovie.getMoviePoster());
        }
        Date releaseDate = DateFormatUtils.StringToDate("yyyy-MM-dd", movie.getMovieRelease());
        movieDto.setMovieRelease(releaseDate);
        Integer rs = movieService.updateMovie(movieDto);
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
            json.put("msg", "修改电影成功！");
        } else {
            json.put("code", 200);
            json.put("msg", "修改电影失败");
        }
        return json;
    }

    @ResponseBody
    @RequestMapping("rmMovie")
    public JSONObject rmMovie(@RequestParam("movieId") Long id){
        JSONObject json = new JSONObject();
        Integer rs = movieService.rmMovie(id);
        if (rs > 0){
            json.put("code", 0);
            json.put("msg", "下架成功！");
        } else {
            json.put("code", 200);
            json.put("msg", "下架失败！");
        }
        return json;
    }

    @ResponseBody
    @RequestMapping("upMovie")
    public JSONObject upMovie(@RequestParam("movieId") Long id){
        JSONObject json = new JSONObject();
        Integer rs = movieService.upMovie(id);
        if (rs > 0){
            json.put("code", 0);
            json.put("msg", "上映成功！");
        } else {
            json.put("code", 200);
            json.put("msg", "上映失败！");
        }
        return json;
    }

    @ResponseBody
    @RequestMapping("reUpMovie")
    public JSONObject reUpMovie(@RequestParam("movieId") Long id){
        JSONObject json = new JSONObject();
        Integer rs = movieService.reUpMovie(id);
        if (rs > 0){
            json.put("code", 0);
            json.put("msg", "重新上架成功！");
        } else {
            json.put("code", 200);
            json.put("msg", "重新上架失败！");
        }
        return json;
    }

    @ResponseBody
    @RequestMapping("giveScore")
    public JSONObject giveScore(@RequestParam("movie_id") Long id,
                                @RequestParam("score") Integer score){
        JSONObject json = new JSONObject();
        Integer curNum = movieService.getMovieCommentNum(id);
        double curScore = movieService.getScore(id);
        double curTotal = curNum * curScore + score;
        double dbNum = (double) (curNum+1);
        double newScore = curTotal / dbNum;
        Integer rs = movieService.updateScore(id,newScore,(int)dbNum);
        if (rs > 0){
            json.put("code", 0);
            json.put("msg", "添加分数成功！");
        } else {
            json.put("code", 200);
            json.put("msg", "添加分数失败！");
        }
        return json;
    }


    @RequestMapping("sortAllMovies")
    @ResponseBody
    public JSONObject sortAllMovies(@RequestParam("order") String order,
                                    @RequestParam("type") String type,
                                    @RequestParam("area") String area,
                                    @RequestParam("status") Integer status) {
        JSONObject json = new JSONObject();
        List<Movie> list;
        list = movieService.sortAllMovie(order,type,area,status);
        json.put("code",0);
        json.put("count", list.size());
        json.put("data", list);
        return json;
    }

}
