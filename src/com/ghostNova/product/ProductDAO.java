package com.ghostNova.product;

import java.util.List;

/**
 * Created by victor on 6/10/16.
 */
public interface ProductDAO {
    void insert(Product product) throws Exception;

    void delete(Product product) throws Exception;

    void update(Product product) throws Exception;

    void trade(Product product, int amount) throws Exception;

    List<Product> queryAll() throws Exception;

    List<Product> queryAllLite() throws Exception;

    List<Product> queryByUserId(String userId) throws Exception;

    Product queryByProductId(String productId) throws Exception;
}
