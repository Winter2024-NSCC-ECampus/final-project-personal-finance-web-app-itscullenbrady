package com.example.finance.model;


public class Transaction {
    private String type;
    private String category;
    private double amount;
    private String note;
    private String tags;

    public Transaction(String type, String category, double amount, String note, String tags) {
        this.type = type;
        this.category = category;
        this.amount = amount;
        this.note = note;
        this.tags = tags;
    }

    public Transaction() {
    }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public String getTags() { return tags; }
    public void setTags(String tags) { this.tags = tags; }
}
