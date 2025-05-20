package com.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.dao.mybookdao;
import com.bookstore.model.bookmodel;
import com.bookstore.model.mybookmodel;

import jakarta.transaction.Transactional;

@Transactional
@Service
public class mybookserviceImpl implements mybookservice{

	@Autowired
	private mybookdao dao1;
	
	@Override
	public boolean SavemyBooks(mybookmodel mbm) {
		// TODO Auto-generated method stub
	 return	dao1.SavemyBooks(mbm);
	}

	@Override
	public List<mybookmodel> getAllmyBooks() {
		// TODO Auto-generated method stub
		return dao1.getAllmyBooks();
	}

	@Override
	public mybookmodel getBookById(int id) {
		// TODO Auto-generated method stub
		return dao1.getBookById(id);
	}

	@Override
	public mybookmodel editmybookByid(int id) {
		// TODO Auto-generated method stub
		return dao1.editmybookByid(id);
	}

	

	
}
