package com.ghostNova.user;

import com.ghostNova.db.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by victor on 6/5/16.
 */
public class UserDAOImpl implements UserDAO {
    @Override
    public void insert(User user) throws Exception {
        String sql = "INSERT INTO Account (ID, Password, Email) VALUES (?, ?, ?);";
        DatabaseConnection dbcn = null;
        PreparedStatement pstmt = null;

        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex) {
            throw new Exception(ex);
        } finally {
            dbcn.close();
        }
    }

    @Override
    public void delete(String id) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = null;
        PreparedStatement pstmt = null;

        try {
            sql = "DELETE FROM Account WHERE Id = ?;";
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
    }

    @Override
    public void update_Email(User user) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = null;
        PreparedStatement pstmt = null;

        try {
            sql = "UPDATE Account SET Email = ? WHERE Id = ?;";
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getUserId());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex) {
            System.out.print(ex);
        } finally {
            dbcn.close();
        }
    }

    @Override
    public void update_Password(User user) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = null;
        PreparedStatement pstmt = null;
        try {
            sql = "UPDATE Account SET Password = ? WHERE id = ?;";
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, user.getPassword());
            pstmt.setString(2, user.getUserId());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex) {
            System.out.print(ex);
        } finally {
            dbcn.close();
        }
    }

    @Override
    public List<User> queryAll() throws Exception {
        DatabaseConnection dbcn = null;
        String sql = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<User> all = new ArrayList<User>();
        try {
            sql = "SELECT * FROM Account;";
            dbcn = new DatabaseConnection();
            stmt = dbcn.getConnection().createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getString("Id"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
                all.add(user);
            }
            rs.close();
            stmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
        return all;
    }

    @Override
    public User queryById(String id) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = new User();
        try {
            sql = "SELECT * FROM Account WHERE id = ?;";
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user.setUserId(rs.getString("Id"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
            } else {
                user.setUserId(rs.getString("Id"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
            }
            rs.close();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
        return user;
    }

    @Override
    public User queryByEmail(String email) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = new User();
        try {
            sql = "SELECT * FROM Account WHERE email = ?";
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, user.getEmail());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user.setUserId(rs.getString("Id"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
            }
            rs.close();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
        return user;
    }

    @Override
    public boolean confirm(String id, String password) throws Exception {
        DatabaseConnection dbcn = null;
        String sql;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean is_Pass = false;
        try {
            sql = "SELECT * FROM Account WHERE Id = ? AND Password = ?;";
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                is_Pass = true;
            }
            rs.close();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
        return is_Pass;
    }

    @Override
    public boolean idExits(String id) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = new User();
        boolean hasRow = false;
        try {
            sql = "SELECT * FROM Account WHERE id = ?;";
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                hasRow = true;
            }
            rs.close();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
        return hasRow;
    }

    @Override
    public boolean emailExits(String email) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = new User();
        boolean hasRow = false;
        try {
            sql = "SELECT * FROM Account WHERE email = ?";
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                hasRow = true;
            }
            rs.close();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
        return hasRow;
    }
}
