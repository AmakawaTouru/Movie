package com.amakawa.util;

import javax.servlet.http.HttpServletRequest;

public class UpLoadUtils {

    public static String getUpPicLocalPath(String upFileName,
                                           String UUID,
                                           String uploadLocalPath,
                                           HttpServletRequest request){
        String uidName = UUID + upFileName.substring(upFileName.lastIndexOf("."));
        String path = request.getServletContext().getRealPath(uploadLocalPath) + "/" + uidName;
        return path;
    }


    public static String getUpPicDbPath(String upFileName,
                                        String UUID,
                                        String uploadDbPath,
                                        HttpServletRequest request){
        String uidName = UUID + upFileName.substring(upFileName.lastIndexOf("."));
        String path =  uploadDbPath + uidName;
        return path;
    }



}
