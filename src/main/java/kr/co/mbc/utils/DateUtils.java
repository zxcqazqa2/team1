package kr.co.mbc.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    // 포맷된 날짜를 반환하는 메서드
    public static String getFormattedDate() {
    	Date currentDate = new Date();  // 현재 날짜 생성
    	
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        String naljja = sdf.format(currentDate);
        
        return naljja;
    }
}
