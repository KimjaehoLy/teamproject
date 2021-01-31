package erp.hhh;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("attVO")
public class AttendanceVO {
   
   Integer att_num;
   Date start_time;
   Date end_time;
   Date today;
   Integer att_pay;
   String printDate;
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   
   
   
   public Integer getAtt_num() {
      return att_num;
   }
   public void setAtt_num(Integer att_num) {
      this.att_num = att_num;
   }
   public String getStart_time() {
      return sdf.format(start_time);
   }
   public void setStart_time(Date start_time) {
      this.start_time = start_time;
   }
   public String getEnd_time() {
      return sdf.format(end_time);
   }
   public void setEnd_time(Date end_time) {
      this.end_time = end_time;
   }
   public String getToday() {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      if(today!=null)
         return sdf.format(today);
      return "무";
      
      
   }
   public void setToday(Date today) {
      this.today = today;
   }
   
   
   
   
   public Integer getAtt_pay() {
      return att_pay;
   }
   public void setAtt_pay(Integer att_pay) {
      this.att_pay = att_pay;
   }
   @Override
   public String toString() {
      return "AttendanceVO [att_num=" + att_num + ", start_time=" + start_time + ", end_time=" + end_time + ", today="
            + today + ", sdf=" + sdf + ", searchDay=" + Arrays.toString(searchDay) + "]";
   }


   //-------------수정----------
   public String[] searchDay;


   
   

   public String[] getSearchDay() {
      return searchDay;
   }
   public void setSearchDay(String[] searchDay) {
      this.searchDay = searchDay;
      today = new Date(Integer.parseInt(searchDay[0]) - 1900, Integer.parseInt(searchDay[1])-1 , Integer.parseInt(searchDay[2]));
      System.out.println("AttVO.java/today : " + new SimpleDateFormat("yyyy-MM-dd").format(today));
      
      if(searchDay.length == 5) {
         System.out.println("AttVO/setSubDay 들어왔다~");
         start_time = new Date(Integer.parseInt(searchDay[0]) - 1900, Integer.parseInt(searchDay[1]) -1 , Integer.parseInt(searchDay[2]),
               Integer.parseInt(searchDay[3]), 00, 00);
         end_time = new Date(Integer.parseInt(searchDay[0]) - 1900, Integer.parseInt(searchDay[1]) -1 , Integer.parseInt(searchDay[2]),
               Integer.parseInt(searchDay[4]), 00, 00);
      }
   }
   public String getPrintDate() {
      sdf = new SimpleDateFormat("HH:mm:ss");
      return sdf.format(start_time) + "~" + sdf.format(end_time);
   }
   
   
}