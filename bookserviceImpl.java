package com.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.dao.bookdao;
import com.bookstore.model.bookmodel;

import jakarta.transaction.Transactional;

@Transactional
@Service
public class bookserviceImpl implements bookservice {

	@Autowired
	bookdao dao;

	@Override
	public Boolean addBook(bookmodel bm) {
		// TODO Auto-generated method stub
		return dao.addBook(bm);
	}

	@Override
	public bookmodel getBookById(int id) {
		// TODO Auto-generated method stub
		return dao.getBookById(id);
	}

	@Override
	public List<bookmodel> getAllBooks() {
		// TODO Auto-generated method stub
		return dao.getAllBooks();
	}

	@Override
	public void updateBook(bookmodel bm) {
		// TODO Auto-generated method stub
		dao.updateBook(bm);
	}

	@Override
	public void deleteBookById(int id) {
		// TODO Auto-generated method stub
		dao.deleteBookById(id);
	}

	@Override
	public Boolean addtomybook(int id) {
		// TODO Auto-generated method stub
		return dao.addtomybook(id);
	}

	@Override
	public bookmodel editbookByid(int id) {
		// TODO Auto-generated method stub
		return dao.editbookByid(id);
	}
}
