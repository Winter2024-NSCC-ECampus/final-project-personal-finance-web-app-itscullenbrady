package com.example.finance.model;


public class Budget {
    private String category;
    private double limit;       
    private double spent;

    public Budget(String category, double limit) {
        this.category = category;
        this.limit = limit;
        this.spent = 0.0;
    }

    public Budget() {
    }

    public String getCategory() { return category; }
    public double getLimit() { return limit; }
    public double getSpent() { return spent; }

    public void addSpending(double amount) {
        this.spent += amount;
    }
}
