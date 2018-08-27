package com.shop;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {

    static Pattern pattern = Pattern.compile("[1-9]*");

    public static boolean isNum(String str){
        Matcher isNum = pattern.matcher(str);
        if( !isNum.matches() ){
            return false;
        }
        return true;
    }


}
