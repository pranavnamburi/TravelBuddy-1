package com.groupnine.travelbuddy.Friend_Pool;

public class FriendPoolRequest {
    private String fullname, email, mobile, status;
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public FriendPoolRequest(String fullname, String email, String mobile, String status) {
        setFullname(fullname); setEmail(email); setMobile(mobile); setStatus(status);
    }
}
