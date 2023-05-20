package com.groupnine.travelbuddy.Friend_Pool;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

public class FriendPoolInfo {
    String fullname, email, mobile, from, destination, transport;
    Integer capacity;
    Time time;
    Date date;
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
    public String getDateInString() {
        return date.toString();
    }
    public Time getTime() { return time; }
    public String getTimeInString() {
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        String timeStr = format.format(time);
        return timeStr;
    }
    public void setTime(Time time) { this.time = time; }
    public FriendPoolInfo(String fullname, String email, String mobile, String from,String destination,String transport, Integer capacity, Date date, Time time) {
        setFullname(fullname); setEmail(email); setMobile(mobile); setFrom(from);setDestination(destination);setTransport(transport);setCapacity(capacity); setDate(date); setTime(time);
    }

}
