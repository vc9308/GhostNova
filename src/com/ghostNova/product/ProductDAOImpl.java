package com.ghostNova.product;

import com.ghostNova.db.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by victor on 6/10/16.
 */
public class ProductDAOImpl implements ProductDAO {
    @Override
    public void insert(Product product) throws Exception {
        String sql = "INSERT INTO Product VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        DatabaseConnection dbcn = null;
        PreparedStatement pstmt = null;

        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, product.getProductId());
            pstmt.setString(2, product.getUserId());
            pstmt.setString(3, product.getProductName());
            pstmt.setString(4, product.getCategory());
            pstmt.setFloat(5, product.getPrice());
            pstmt.setString(6, product.getPayment());
            pstmt.setInt(7, product.getAmount());
            pstmt.setString(8, product.getImageName());
            pstmt.setString(9, product.getDescription());
            pstmt.setInt(10, product.getTradingTimes());
            pstmt.setFloat(11, product.getStars());
            pstmt.setString(12, product.getPublishDate());
            pstmt.setString(13, product.getEditDate());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex) {
            throw new Exception(ex);
        } finally {
            dbcn.close();
        }
    }

    @Override
    public void delete(Product product) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = "DELETE FROM Product WHERE Id=?;";
        PreparedStatement pstmt = null;

        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, product.getProductId());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
    }


    @Override
    public void update(Product product) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = "UPDATE Product SET ProductName = ?, Category = ?, Price = ?, Payment = ?, Amount = ?, Description = ?, EditDate = ?, TradingTimes = ?, ImageName = ? WHERE ProductId = ?;";
        PreparedStatement pstmt = null;

        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, product.getProductName());
            pstmt.setString(2, product.getCategory());
            pstmt.setFloat(3, product.getPrice());
            pstmt.setString(4, product.getPayment());
            pstmt.setInt(5, product.getAmount());
            pstmt.setString(6, product.getDescription());
            pstmt.setString(7, product.getEditDate());
            pstmt.setInt(8, product.getTradingTimes());
            pstmt.setString(9, product.getImageName());
            pstmt.setString(10, product.getProductId());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
    }

    @Override
    public void trade(Product product, int tradeAmount) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = "UPDATE Product SET Amount = Amount - ? WHERE ProductId = ?;";
        PreparedStatement pstmt = null;

        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setInt(1, tradeAmount);
            pstmt.setInt(2, product.getAmount());

            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
    }

    @Override
    public List<Product> queryAll() throws Exception {
        DatabaseConnection dbcn = null;
        String sql = "SELECT * FROM Product;";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Product product = null;
        List<Product> all = new ArrayList<Product>();

        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setProductId(rs.getString("ProductId"));
                product.setUserId(rs.getString("UserId"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategory(rs.getString("Category"));
                product.setPrice(rs.getFloat("Price"));
                product.setPayment(rs.getString("Payment"));
                product.setAmount(rs.getInt("Amount"));
                product.setImageName(rs.getString("ImageName"));
                product.setDescription(rs.getString("Description"));
                product.setTradingTimes(rs.getInt("TradingTimes"));
                product.setStars(rs.getFloat("Stars"));
                product.setPublishDate(rs.getString("PublishDate"));
                product.setEditDate(rs.getString("EditDate"));
                all.add(product);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbcn.close();
        }
        return all;
    }

    @Override
    public List<Product> queryAllLite() throws Exception {
        DatabaseConnection dbcn = null;
        String sql = "SELECT * FROM Product;";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Product product = null;
        List<Product> all = new ArrayList<Product>();

        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setProductId(rs.getString("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategory(rs.getString("Category"));
                product.setPrice(rs.getFloat("Price"));
                product.setTradingTimes(rs.getInt("TradingTimes"));
                product.setStars(rs.getFloat("Stars"));
                product.setPublishDate(rs.getString("PublishDate"));
                all.add(product);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbcn.close();
        }
        return all;
    }

    @Override
    public List<Product> queryByUserId(String userId) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = "SELECT * FROM Product WHERE UserId = ?;";
        PreparedStatement pstmt;
        ResultSet rs = null;
        Product product = null;
        List<Product> products = new ArrayList<Product>();

        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setProductId(rs.getString(1));
                product.setUserId(rs.getString("UserId"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategory(rs.getString("Category"));
                product.setPrice(rs.getFloat("Price"));
                product.setPayment(rs.getString("Payment"));
                product.setAmount(rs.getInt("Amount"));
                product.setImageName(rs.getString("ImageName"));
                product.setDescription(rs.getString("Description"));
                product.setTradingTimes(rs.getInt("TradingTimes"));
                product.setStars(rs.getFloat("Stars"));
                product.setPublishDate(rs.getString("PublishDate"));
                product.setEditDate(rs.getString("EditDate"));
                products.add(product);
            }
            rs.close();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
        return products;
    }

    @Override
    public Product queryByProductId(String productId) throws Exception {
        DatabaseConnection dbcn = null;
        String sql = "SELECT * FROM Product WHERE ProductId = ?;";
        PreparedStatement pstmt;
        ResultSet rs = null;
        Product product = new Product();

        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, productId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setProductId(rs.getString("ProductId"));
                product.setUserId(rs.getString("UserId"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategory(rs.getString("Category"));
                product.setPrice(rs.getFloat("Price"));
                product.setPayment(rs.getString("Payment"));
                product.setAmount(rs.getInt("Amount"));
                product.setImageName(rs.getString("ImageName"));
                product.setDescription(rs.getString("Description"));
                product.setTradingTimes(rs.getInt("TradingTimes"));
                product.setPublishDate(rs.getString("PublishDate"));
                product.setEditDate(rs.getString("EditDate"));
            }
            rs.close();
            pstmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbcn.close();
        }
        return product;
    }
}
