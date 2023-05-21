package com.groupnine.travelbuddy.Co_Traveller;
import java.sql.Time;
import java.sql.Date;
import java.text.SimpleDateFormat;
public class Co_Traveller_Info  {
    String Transportation,Fromplace,Toplace,Name;
    int Serviceno;
    Time Time;
    Date Date;
//    public Co_Traveller_Info(String transportation, String serviceNo, String from, String to, String date, String time) {
//    }
//    public Co_Traveller_Info(String name, String dest) {
//    }
//    public Co_Traveller_Info(String name, String dest, String date, String time) {
//    }
    public Co_Traveller_Info(String transportation, int serviceNo, String from, String to, java.sql.Date date, java.sql.Time time) {
        setTransportation(transportation); setServiceno(serviceNo); setFromplace(from); setToplace(to); setDate(date); setTime(time);
    }

    public Co_Traveller_Info(String name, String dest, java.sql.Date date, java.sql.Time time) {
    }

    public String getTransportation(){return Transportation;}
    public void setTransportation(String Transportation){this.Transportation = Transportation;}
    public int getServiceno(){return Serviceno;}
    public void setServiceno(int Serviceno){this.Serviceno = Serviceno;}
    public String getFromplace(){return Fromplace;}
    public void setFromplace(String Fromplace){this.Fromplace = Fromplace;}
    public String getToplace(){return Toplace;}
    public void setToplace(String Toplace){this.Toplace = Toplace;}
    public Date getDate() { return Date; }
    public void setDate(Date date) { this.Date = date; }
    public String getDateInString() {
        return Date.toString();
    }
    public Time getTime() { return Time; }
    public String getTimeInString() {
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        return format.format(Time);
    }
    public String getName() {
        return Name;
    }
    public void setName(String Name){this.Name = Name;}
    public void setTime(Time time) { this.Time = time; }
    public Co_Traveller_Info(String transportation,int serviceno,String fromplace,String toplace,Date date,Time time,String name){
        setTransportation(transportation);setServiceno(serviceno);setFromplace(fromplace);setToplace(toplace);setDate(date);setTime(time);setName(name);}


}
