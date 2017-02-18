package com.ghostNova.order;

/**
 * Created by victor on 6/17/16.
 */
public class OrderDAOFactory {
    public static OrderDAO getOrderDAOInstance() {
        return new OrderDAOImpl();
    }
}
