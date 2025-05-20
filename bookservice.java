package com.bookstore.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bookstore.model.bookmodel;



public interface bookservice {

	public Boolean addBook(bookmodel bm );
	public bookmodel getBookById(int id);
	public List<bookmodel> getAllBooks();
	public void updateBook(bookmodel bm);
	public bookmodel editbookByid(int id);
	public void deleteBookById(int id);
	public Boolean addtomybook(int id);
}
