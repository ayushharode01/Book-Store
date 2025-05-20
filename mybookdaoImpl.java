package com.bookstore.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.model.bookmodel;
import com.bookstore.model.mybookmodel;

import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;

@Repository
public class mybookdaoImpl implements mybookdao {

	@Autowired 
	private EntityManager em;
	
	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}

	@Override
	public boolean SavemyBooks(mybookmodel mbm) {
		// TODO Auto-generated method stub
		
		boolean f=true;
		Session session=em.unwrap(Session.class);
		session.save(mbm);
		return f;
		
	}

	@Override
	public List<mybookmodel> getAllmyBooks() {
		// TODO Auto-generated method stub
		Session session=em.unwrap(Session.class);
		return session.createQuery("from mybookmodel").list();		
	}

	@Override
	public mybookmodel getBookById(int id) {
		// TODO Auto-generated method stub
		Session session=em.unwrap(Session.class);
		return null;
	}

	@Override
	public mybookmodel editmybookByid(int id) {
		// TODO Auto-generated method stub
		Session session=em.unwrap(Session.class);		
		return session.get(mybookmodel.class, id);
	}

	

}
