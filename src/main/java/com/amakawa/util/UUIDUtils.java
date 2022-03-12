package com.amakawa.util;

import java.util.UUID;

public class UUIDUtils {

    public static String getUUID(){
        String str = UUID.randomUUID().toString();
        str = str.replace("-", "");
        return str;
    }

}
