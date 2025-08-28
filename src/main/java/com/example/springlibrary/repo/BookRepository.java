package com.example.springlibrary.repo;

import org.springframework.data.repository.CrudRepository;
import com.example.springlibrary.entity.Book;

public interface BookRepository extends CrudRepository<Book, Integer> {}