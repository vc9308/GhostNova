package com.ghostNova.order;

import com.ghostNova.product.Product;

import java.util.List;

/**
 * Created by victor on 6/17/16.
 */
public interface OrderDAO {
    public void insert(Order order) throws Exception;

    public List<Order> queryByProductId(String productId) throws Exception;

    public List<Order> queryByCustomerId(String customerId) throws Exception;

    public List<Order> queryBySellerId(String sellerId) throws Exception;

    public Order queryByOrderId(String orderId) throws Exception;
}
