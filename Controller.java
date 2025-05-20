package com.bookstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bookstore.model.bookmodel;
import com.bookstore.model.mybookmodel;
import com.bookstore.service.bookservice;
import com.bookstore.service.mybookservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@RestController
@CrossOrigin(origins = "http://localhost:8080")
public class Controller {
	
	@Autowired
	bookservice service;
	
	@Autowired
	mybookservice mybookservice;
	

	/*@GetMapping("/")
	public String home() {
		
		return "";
	}*/
	@PostMapping("/savebook")
	public ResponseEntity<String> savebook(/*@RequestParam("name") String name,
            @RequestParam("author") String author,
            @RequestParam("price") String price*/@RequestBody bookmodel bm )
	{
		//TODO: process POST request
//System.out.println("Received: Name=" + name + ", Author=" + author + ", Price=" + price);
        
        // Assuming save operation was successful        		
		service.addBook(bm);
		return ResponseEntity.ok("success");
	}
	
	@GetMapping("/availablebooks")
	public List<bookmodel> getallbooks() {
		return service.getAllBooks();
		
		/*List<bookmodel> books = service.getAllBooks();
        return (List<bookmodel>) ResponseEntity.ok(books);*/
	}
	
	@DeleteMapping("delete/{id}")
	private void deletebook(@PathVariable int id) {
		// TODO Auto-generated method stub
		service.deleteBookById(id);		
	}
	
	@PostMapping("addmybook") ///{id}
	public ResponseEntity<String> addtomybook(@RequestBody mybookmodel mbm) {
		//TODO: process POST request
	//System.out.println("id :"+id);	
		mybookservice.SavemyBooks(mbm);
		System.out.println("my books : "+mbm);
		return ResponseEntity.ok("success");
	}
	
	
	@GetMapping("/mybooks")
	public List<mybookmodel> getallmybooks() {
		return mybookservice.getAllmyBooks();
	
	}
	
	/*
	@GetMapping("editbook/{id}")
	public bookmodel editbook(@PathVariable int id) 
	{
		System.out.println(" id : "+id);
		//mybookservice.editmybookByid(id);
		return service.editbookByid(id);
	}	*/
	
	@GetMapping("editbook/{id}")
	public ResponseEntity<bookmodel> editbook(@PathVariable int id) {
	    System.out.println(" id : " + id);
	    bookmodel book = service.editbookByid(id);
	    
	    if (book != null) {
	        return ResponseEntity.ok(book);
	    } else {
	        return ResponseEntity.notFound().build();
	    }
	}
}
