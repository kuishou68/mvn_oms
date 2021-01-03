package com.lijianlin.entity;

public class UserInfoBO {
     Integer user_id;
     String user_name;
     String user_type;
     String email;
     String phoneNumber;
     String status;
     String create_time;
     String sex;

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public UserInfoBO(){}

    public UserInfoBO(Integer user_id, String user_name, String user_type, String email, String phoneNumber, String status, String create_time, String sex) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_type = user_type;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.status = status;
        this.create_time = create_time;
        this.sex = sex;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }


    @Override
    public String toString() {
        return "UserInfoBO{" +
                "user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", user_type='" + user_type + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", status='" + status + '\'' +
                ", create_time='" + create_time + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }
}
