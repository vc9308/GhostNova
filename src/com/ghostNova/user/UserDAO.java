package com.ghostNova.user;

import java.util.List;

/**
 * Created by victor on 6/5/16.
 */
public interface UserDAO {
    void insert(User user) throws Exception;

    void delete(String id) throws Exception;

    void update_Password(User user) throws Exception;

    void update_Email(User user) throws Exception;

    User queryById(String userId) throws Exception;

    User queryByEmail(String email) throws Exception;

    List<User> queryAll() throws Exception;

    boolean confirm(String id, String password) throws Exception;

    boolean idExits(String id) throws Exception;

    boolean emailExits(String email) throws Exception;
}
