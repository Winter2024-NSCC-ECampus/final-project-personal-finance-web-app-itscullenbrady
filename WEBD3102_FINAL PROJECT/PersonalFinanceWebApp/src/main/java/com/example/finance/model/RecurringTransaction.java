package com.example.finance.model;


public class RecurringTransaction {
    private String type;
    private String category;
    private double amount;
    private String note;
    private String frequency;

    public RecurringTransaction(String type, String category, double amount, String note, String frequency) {
        this.type = type;
        this.category = category;
        this.amount = amount;
        this.note = note;
        this.frequency = frequency;
    }

    public RecurringTransaction() {
    }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public String getFrequency() { return frequency; }
    public void setFrequency(String frequency) { this.frequency = frequency; }
}
