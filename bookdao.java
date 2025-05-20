package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.bookmodel;
import com.bookstore.model.mybookmodel;

public interface bookdao {

	public Boolean addBook(bookmodel bm );
	public bookmodel getBookById(int id);
	public List<bookmodel> getAllBooks();
	public void updateBook(bookmodel bm);
	public bookmodel editbookByid(int id);
	public void deleteBookById(int id);
	public Boolean addtomybook(int id );
}
