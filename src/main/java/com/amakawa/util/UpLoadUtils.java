package com.amakawa.util;

import javax.servlet.http.HttpServletRequest;

public class UpLoadUtils {

    public static String getUpPicLocalPath(String upFileName,
                                           String UUID,
                                           HttpServletRequest request){
        String uidName = UUID + upFileName.substring(upFileName.lastIndexOf("."));
        String path = request.getServletContext().getRealPath("/upload/movies") + "/" + uidName;
        return path;
    }

    public static String getUpPicDbPath(String upFileName,
                                        String UUID,
                                        HttpServletRequest request){
        String uidName = UUID + upFileName.substring(upFileName.lastIndexOf("."));
        String path = "../upload/movies/" + uidName;
        return path;
    }



}
