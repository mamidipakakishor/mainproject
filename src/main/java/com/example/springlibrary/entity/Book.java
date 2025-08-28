package com.example.springlibrary.entity;

import java.time.LocalDate;
import javax.persistence.*;

@Entity
@Table(name = "book_tb")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String author;
    private int price;
    private String status; // Available or Borrowed
    private LocalDate borrowedDate;
    private int borrowedForDays;

    // Getter and Setter for id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter and Setter for name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for author
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    // Getter and Setter for price
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    // Getter and Setter for status
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Getter and Setter for borrowedDate
    public LocalDate getBorrowedDate() {
        return borrowedDate;
    }

    public void setBorrowedDate(LocalDate borrowedDate) {
        this.borrowedDate = borrowedDate;
    }

    // Getter and Setter for borrowedForDays
    public int getBorrowedForDays() {
        return borrowedForDays;
    }

    public void setBorrowedForDays(int borrowedForDays) {
        this.borrowedForDays = borrowedForDays;
    }
}