package com.example.finance.model;


public class Investment {
    private String name;
    private String type;
    private double amount;

    public Investment(String name, String type, double amount) {
        this.name = name;
        this.type = type;
        this.amount = amount;
    }

    public Investment() {
    }

    public String getName() { return name; }
    public String getType() { return type; }
    public double getAmount() { return amount; }
}
