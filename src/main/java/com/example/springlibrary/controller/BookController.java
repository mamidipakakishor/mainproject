package com.example.springlibrary.controller;

import com.example.springlibrary.entity.Book;
import com.example.springlibrary.repo.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/library")
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("appName", "School Library Software");
        return "home";
    }

    @GetMapping("/addBookForm")
    public String addBookForm(Model model) {
        model.addAttribute("book", new Book());
        return "addBook";
    }

    @PostMapping("/addBook")
    public String addBook(@ModelAttribute("book") Book book) {
        book.setStatus("Available");
        bookRepository.save(book);
        return "redirect:/library/display";
    }

    @GetMapping("/display")
    public String displayBooks(Model model) {
        model.addAttribute("books", bookRepository.findAll());
        return "displayBook";
    }

    @GetMapping("/editBook/{id}")
    public String editBook(@PathVariable int id, Model model) {
        model.addAttribute("book", bookRepository.findById(id).orElse(null));
        return "editBook";
    }

    @PostMapping("/updateBook")
    public String updateBook(@ModelAttribute("book") Book book) {
        bookRepository.save(book);
        return "redirect:/library/display";
    }

    @GetMapping("/deleteBook/{id}")
    public String deleteBook(@PathVariable int id) {
        bookRepository.deleteById(id);
        return "redirect:/library/display";
    }

    @GetMapping("/borrowBookForm/{id}")
    public String borrowBookForm(@PathVariable int id, Model model) {
        Book book = bookRepository.findById(id).orElse(null);
        if (book == null || !"Available".equals(book.getStatus())) {
            return "redirect:/library/display";
        }
        model.addAttribute("book", book);
        return "borrowBookForm";
    }

    @PostMapping("/borrowBook/{id}")
    public String borrowBook(@PathVariable int id, @RequestParam("days") int days) {
        Book book = bookRepository.findById(id).orElse(null);
        if (book != null && "Available".equals(book.getStatus())) {
            book.setStatus("Borrowed");
            book.setBorrowedDate(LocalDate.now());
            book.setBorrowedForDays(days > 0 ? days : 7);
            bookRepository.save(book);
        }
        return "redirect:/library/display";
    }
    @GetMapping("/returnBook/{id}")
    public String returnBook(@PathVariable int id) {
        Book book = bookRepository.findById(id).orElse(null);
        if (book != null && "Borrowed".equals(book.getStatus())) {
            book.setStatus("Available");
            book.setBorrowedDate(null);
            book.setBorrowedForDays(0);
            bookRepository.save(book);
        }
        return "redirect:/library/display";
    }
    
}
