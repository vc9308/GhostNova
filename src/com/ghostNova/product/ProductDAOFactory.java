package com.ghostNova.product;

/**
 * Created by victor on 6/11/16.
 */
public class ProductDAOFactory {
    public static ProductDAO getProductDAOInstance() {
        return new ProductDAOImpl();
    }
}
