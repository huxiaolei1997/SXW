package util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;



public class test {


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Connection conn = DBUtil.getConnection();
		// if(conn != null){
		// System.out.print("数据库连接成功");
		// }
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
         
        //过去七天
        String[] sevenDays = new String[7]; 
        for(int i = 0; i < sevenDays.length; i++){
			//c.set(2017,02,01); //设定自己需要的时间
        	c.setTime(new Date());
        	c.add(Calendar.DATE, - i);
             Date d = c.getTime();
             String day = format.format(d);
             System.out.println("过去七天："+day);
             sevenDays[i] = day;
        }
        System.out.println(java.util.Arrays.toString(sevenDays));
	}

}
