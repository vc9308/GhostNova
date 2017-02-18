package com.ghostNova.user;

/**
 * Created by victor on 6/5/16.
 */
public class UserDAOFactory {
    public static UserDAO getUserDAOInstance() {
        return new UserDAOImpl();
    }
}