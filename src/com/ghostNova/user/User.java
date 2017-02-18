package com.ghostNova.user;

/**
 * Created by victor on 6/5/16.
 */
public class User {
    String userId = new String();
    String password = new String();
    String email = new String();

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
