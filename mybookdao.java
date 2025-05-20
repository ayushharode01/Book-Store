package com.bookstore.dao;

import java.util.List;

import com.bookstore.model.bookmodel;
import com.bookstore.model.mybookmodel;

public interface mybookdao {

	public boolean SavemyBooks(mybookmodel mbm);
	public List<mybookmodel> getAllmyBooks();
	public mybookmodel getBookById(int id);
	public mybookmodel editmybookByid(int id);
}
