package com.groupnine.travelbuddy.Co_Traveller;

public class Co_Traveller_Requests {
    private String fullname, email, mobile, status;
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Co_Traveller_Requests(String fullname,String email,String status){
        setFullname(fullname);setEmail(email);setStatus(status);
    }
}
