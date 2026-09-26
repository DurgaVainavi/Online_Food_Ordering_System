package com.food.model;

public class CartItem {
    private int id;
    private String name;
    private String image;
    private int price;
    private int quantity = 1;

    public CartItem(int id, String name, String image, int price) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = 1;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getImage() { return image; }
    public int getPrice() { return price; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}