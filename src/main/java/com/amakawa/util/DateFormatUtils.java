package com.amakawa.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtils {

    public static Date StringToDate(String format, String target) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        Date date = null;
        try {
            date = sdf.parse(target);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    public static String DateToString(String format,Date date){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        String res = sdf.format(date);
        return res;
    }


}
