package com.ghostNova.order;

/**
 * Created by victor on 6/17/16.
 */
public class Order {
    String tradingId = new String();
    String productId = new String();
    String customerId = new String();
    String sellerId = new String();
    String customerEmail = new String();
    String sellerEmail = new String();
    String tradingDate = new String();
    String payment = new String();
    Float price = new Float(0f);
    Integer tradingQuantity = new Integer(0);
    Boolean hasBeenDelivered = new Boolean(false);
    Boolean hasBeenAppliedForReturn = new Boolean(false);
    Boolean hasBeenCancelled = new Boolean(false);

    public String getTradingId() {
        return tradingId;
    }

    public void setTradingId(String tradingId) {
        this.tradingId = tradingId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public String getTradingDate() {
        return tradingDate;
    }

    public void setTradingDate(String tradingDate) {
        this.tradingDate = tradingDate;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getTradingQuantity() {
        return tradingQuantity;
    }

    public void setTradingQuantity(Integer tradingQuantity) {
        this.tradingQuantity = tradingQuantity;
    }

    public Boolean getHasBeenDelivered() {
        return hasBeenDelivered;
    }

    public void setHasBeenDelivered(Boolean hasBeenDelivered) {
        this.hasBeenDelivered = hasBeenDelivered;
    }

    public Boolean getHasBeenAppliedForReturn() {
        return hasBeenAppliedForReturn;
    }

    public void setHasBeenAppliedForReturn(Boolean hasBeenAppliedForReturn) {
        this.hasBeenAppliedForReturn = hasBeenAppliedForReturn;
    }

    public Boolean getHasBeenCancelled() {
        return hasBeenCancelled;
    }

    public void setHasBeenCancelled(Boolean hasBeenCancelled) {
        this.hasBeenCancelled = hasBeenCancelled;
    }
}
