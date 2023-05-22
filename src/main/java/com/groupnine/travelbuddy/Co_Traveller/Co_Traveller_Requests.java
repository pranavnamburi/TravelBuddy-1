package com.groupnine.travelbuddy.Co_Traveller;

public class Co_Traveller_Requests {
    private String fullname, email, status;
    private Integer serviceno;
    public String getFullname() { return fullname; }
    public Integer getServiceno() { return serviceno; }
    public void setServiceno(Integer service) { this.serviceno = serviceno; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Co_Traveller_Requests(String fullname, String email, String status, Integer service){
        setFullname(fullname);setEmail(email);setStatus(status);setServiceno(service);
    }
}
