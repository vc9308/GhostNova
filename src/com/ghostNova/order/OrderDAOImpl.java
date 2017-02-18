package com.ghostNova.order;

import com.ghostNova.db.DatabaseConnection;
import com.ghostNova.product.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by victor on 6/17/16.
 */
public class OrderDAOImpl implements OrderDAO {
    @Override
    public void insert(Order order) throws Exception {
        String sql = "INSERT INTO Orders (TradingId, ProductId, CustomerId, SellerId, CustomerEmail, SellerEmail, TradingDate, Payment, Price, TradingQuantity, HasBeenDelivered, HasBeenAppliedForReturn, HasBeenCancelled) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        DatabaseConnection dbcn = null;
        PreparedStatement pstmt = null;
        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, order.getTradingId());
            pstmt.setString(2, order.getProductId());
            pstmt.setString(3, order.getCustomerId());
            pstmt.setString(4, order.getSellerId());
            pstmt.setString(5, order.getCustomerEmail());
            pstmt.setString(6, order.getSellerEmail());
            pstmt.setString(7, order.getTradingDate());
            pstmt.setString(8, order.getPayment());
            pstmt.setFloat(9, order.getPrice());
            pstmt.setInt(10, order.getTradingQuantity());
            pstmt.setBoolean(11, order.getHasBeenDelivered());
            pstmt.setBoolean(12, order.getHasBeenAppliedForReturn());
            pstmt.setBoolean(13, order.getHasBeenCancelled());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbcn.close();
        }
    }

    @Override
    public List<Order> queryByProductId(String productId) throws Exception {
        String sql = "SELECT * FROM Orders WHERE ProductId = ?;";
        DatabaseConnection dbcn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Order order = null;
        List<Order> orders = new ArrayList<Order>();
        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, productId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                order = new Order();
                order.setTradingId(rs.getString("TradingId"));
                order.setProductId(rs.getString("ProductId"));
                order.setCustomerId(rs.getString("CustomerId"));
                order.setSellerId(rs.getString("SellerId"));
                order.setCustomerEmail(rs.getString("CustomerEmail"));
                order.setSellerEmail(rs.getString("SellerEmail"));
                order.setTradingDate(rs.getString("TradingDate"));
                order.setPayment(rs.getString("Payment"));
                order.setPrice(rs.getFloat("Price"));
                order.setTradingQuantity(rs.getInt("TradingQuantity"));
                order.setHasBeenDelivered(rs.getBoolean("HasBeenDelivered"));
                order.setHasBeenAppliedForReturn(rs.getBoolean("HasBeenAppliedForReturn"));
                order.setHasBeenCancelled(rs.getBoolean("HasBeenCancelled"));
                orders.add(order);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbcn.close();
        }
        return orders;
    }

    @Override
    public List<Order> queryByCustomerId(String customerId) throws Exception {
        String sql = "SELECT * FROM Orders WHERE CustomerId = ?;";
        DatabaseConnection dbcn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Order order = null;
        List<Order> orders = new ArrayList<Order>();
        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, customerId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                order = new Order();
                order.setTradingId(rs.getString("TradingId"));
                order.setProductId(rs.getString("ProductId"));
                order.setCustomerId(rs.getString("CustomerId"));
                order.setSellerId(rs.getString("SellerId"));
                order.setCustomerEmail(rs.getString("CustomerEmail"));
                order.setSellerEmail(rs.getString("SellerEmail"));
                order.setTradingDate(rs.getString("TradingDate"));
                order.setPayment(rs.getString("Payment"));
                order.setPrice(rs.getFloat("Price"));
                order.setTradingQuantity(rs.getInt("TradingQuantity"));
                order.setHasBeenDelivered(rs.getBoolean("HasBeenDelivered"));
                order.setHasBeenAppliedForReturn(rs.getBoolean("HasBeenAppliedForReturn"));
                order.setHasBeenCancelled(rs.getBoolean("HasBeenCancelled"));
                orders.add(order);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbcn.close();
        }
        return orders;
    }


    @Override
    public List<Order> queryBySellerId(String sellerId) throws Exception {
        String sql = "SELECT * FROM Orders WHERE SellerId = ?;";
        DatabaseConnection dbcn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Order order = null;
        List<Order> orders = new ArrayList<Order>();
        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, sellerId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                order = new Order();
                order.setTradingId(rs.getString("TradingId"));
                order.setProductId(rs.getString("ProductId"));
                order.setCustomerId(rs.getString("CustomerId"));
                order.setSellerId(rs.getString("SellerId"));
                order.setCustomerEmail(rs.getString("CustomerEmail"));
                order.setSellerEmail(rs.getString("SellerEmail"));
                order.setTradingDate(rs.getString("TradingDate"));
                order.setPayment(rs.getString("Payment"));
                order.setPrice(rs.getFloat("Price"));
                order.setTradingQuantity(rs.getInt("TradingQuantity"));
                order.setHasBeenDelivered(rs.getBoolean("HasBeenDelivered"));
                order.setHasBeenAppliedForReturn(rs.getBoolean("HasBeenAppliedForReturn"));
                order.setHasBeenCancelled(rs.getBoolean("HasBeenCancelled"));
                orders.add(order);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbcn.close();
        }
        return orders;
    }

    @Override
    public Order queryByOrderId(String orderId) throws Exception {
        String sql = "SELECT * FROM Orders WHERE orderId = ?;";
        DatabaseConnection dbcn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Order order = null;
        try {
            dbcn = new DatabaseConnection();
            pstmt = dbcn.getConnection().prepareStatement(sql);
            pstmt.setString(1, orderId);
            rs = pstmt.executeQuery();
            order = new Order();
            if (rs.next()) {
                order.setTradingId(rs.getString("TradingId"));
                order.setProductId(rs.getString("ProductId"));
                order.setCustomerId(rs.getString("CustomerId"));
                order.setSellerId(rs.getString("SellerId"));
                order.setCustomerEmail(rs.getString("CustomerEmail"));
                order.setSellerEmail(rs.getString("SellerEmail"));
                order.setTradingDate(rs.getString("TradingDate"));
                order.setPayment(rs.getString("Payment"));
                order.setPrice(rs.getFloat("Price"));
                order.setTradingQuantity(rs.getInt("TradingQuantity"));
                order.setHasBeenDelivered(rs.getBoolean("HasBeenDelivered"));
                order.setHasBeenAppliedForReturn(rs.getBoolean("HasBeenAppliedForReturn"));
                order.setHasBeenCancelled(rs.getBoolean("HasBeenCancelled"));
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbcn.close();
        }
        return order;
    }
}
