package com.bookstore.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.bookstore.model.bookmodel;
import com.bookstore.model.mybookmodel;

import jakarta.persistence.EntityManager;

@Repository
public class bookdaoImpl implements bookdao {

	@Autowired
	private EntityManager em;

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}

	@Override
	public Boolean addBook(bookmodel bm) {
		// TODO Auto-generated method stub
		boolean f=true;
		Session session=em.unwrap(Session.class);
		session.save(bm);
		return f;
	}

	@Override
	public bookmodel getBookById(int id) {
		// TODO Auto-generated method stub
		Session session=em.unwrap(Session.class);
		return null;
	}

	@Override
	public List<bookmodel> getAllBooks() {
		// TODO Auto-generated method stub
		Session session=em.unwrap(Session.class);
		return session.createQuery("from bookmodel").list();		
	}

	@Override
	public void updateBook(bookmodel bm) {
		// TODO Auto-generated method stub
		Session session=em.unwrap(Session.class);
	}

	@Override
	public void deleteBookById(int id) {
		// TODO Auto-generated method stub
		Session session=em.unwrap(Session.class);		
		bookmodel bm=session.get(bookmodel.class, id);
		session.delete(bm);
	}

	@Override
	public Boolean addtomybook(int id) {
		// TODO Auto-generated method stub
		boolean f=true;
		Session session=em.unwrap(Session.class);		
		mybookmodel mbm=session.get(mybookmodel.class, id);
		session.save(mbm);
		return f;
	}

	@Override
	public bookmodel editbookByid(int id) {
		// TODO Auto-generated method stub		
		Session session=em.unwrap(Session.class);		
		return session.get(bookmodel.class, id);
	}	
}
