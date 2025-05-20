<%-- 
    Document   : mybooks
    Created on : Sep 18, 2024, 2:15:43 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Book Store</title>
  </head>
  <body>
   
      <nav class="navbar navbar-expand-lg navbar-light bg-dark">
  <a class="navbar-brand text-white"  href="#">BookStore</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link text-white"   href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="availablebooks.jsp">Available Books </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link disabled text-white" href="mybooks.jsp">My Books</a>
      </li>
     
    </ul>    
       <div> <a class="nav-link disabled text-white" href="registernewBook.jsp">Register new Book</a> </div>       
  </div>
</nav>
      <div class="container my-5"> 
          <div class="report-body"> 
					
          <table class="table table-stripped"id="tabl" class="table"> 
              <thead> 
                <tr> 
                    <th scope="col">ID</th> 
                    <th scope="col"> Name</th>                     
                    <th scope="col">Author</th>                      
                    <th scope="col">Price</th>                    
                      <th scope="col">Action</th>
                     <th scope="col">Edit</th>
                      <th scope="col">Delete</th>
                </tr> 
            </thead>
            <tbody> 
                
            </tbody> 
        </table> 
					
				</div> 
      </div>       
      
      
      
      
      <script>
           // alert("hello"); 
           $(document).ready(function (){
               //alert("hello");
               $.get("http://localhost:8081/mybooks",function (data,status){
                  //alert(data.length); 
                  
                  $("#tabl tbody").empty(); 
				     data.forEach(function (item) { 
				    	 $("#tabl tbody").append('<tr> <td> '+item.id+' </td> <td> '+item.name+' </td>  <td> '+item.author+' </td><td> '+item.price+' </td><td><button type="button" id="btn" class="addmybook">Add To Mybooks</button></td><td><button type="button" id="btn" class="getvalues">Edit</button></td><td><button type="button" id="btn" class="getid">Delete</button></td> </tr>'); 	    	
        });  
               });
            });   
            /*   
               $(document).on('click', '#tabl .getid', function() {
                   //location.reload();
                   console.log("Delete button clicked!");
                    var row = $(this).closest('tr');
                    var id = row.find('td:eq(0)').text();
                    console.log("ID: " + id); 
                     $.ajax({
                        type: "DELETE",  
                        contentType: "application/json",
                        url: "http://localhost:8081/delete/"+id, 
                        dataType: "text",
                        success: function(data) {
                            location.reload();
                            refreshData();
                        if (data == "deleted") {
                         alert("Data Deleted Successfully");
                     }
                    console.log(data);
                    }//,
                });
               });
               
               $(document).on('click', '#tabl .addmybook', function() {
                   //location.reload();
                   console.log("addmybook button clicked!");
                    var row = $(this).closest('tr');
                    var id = row.find('td:eq(0)').text();
                    console.log("ID: " + id); 
                     $.ajax({
                        type: "Post",  
                        contentType: "application/json",
                        url: "http://localhost:8081/addmybook/"+id, 
                        dataType: "text",
                        success: function(data) {
                            if(data=="success")
					{
                                            console.log(data);
					alert("!!! book added to mybook  Successfully !!!!");
					//console.log("redired to login page");
                                         location.assign("http://localhost:8080/BookStore/mybooks.jsp");
					}
                    //console.log(data);
                    }//,
                });
               });
               }); */
               /*
                $(document).on('click', '#tabl .getvalues', function() {
                   //location.reload();
                   console.log("Edit button clicked!");
                    var row = $(this).closest('tr');
                    var id = row.find('td:eq(0)').text();
                    console.log("ID: " + id);
                  $.get("http://localhost:8093/edituser/"+id,function(data,status){
                      console.log(data);
                      $("#id").val(data.id);
                      $("#name").val(data.name);
                     
                      $("#phone").val(data.phone);
                     
                      $("#email").val(data.email);                     
                      
                      $("#password").val(data.password);
                  });
                   
               });
               
               function refreshData()
               {
                    $.get("http://localhost:8093/userdetails",function (data,status){
                  //alert(data.length); 
                  
                  $("#tabl tbody").empty(); 
                    data.forEach(function (item) { 
                    $("#tabl tbody").append('<tr> <td> '+item.id+' </td> <td> '+item.name+' </td> <td> '+item.phone+' </td> <td> '+item.email+' </td><td> '+item.password+' </td><td><button type="button" class="getvalues">Edit</button></td><td><button type="button" class="getid">Delete</button></td> </tr>'); 	    	
                 });  
               });
               }
               
               
               /* Logic For Update*/
               
               /*
               $("#updateuser").submit(function(event){
                   // alert('test');
                   event.preventDefault();
		 ajaxPost();
	}); 
	
	function ajaxPost()
	{
		var formData = {
                                 id : $("#id").val(),
				 name : $("#name").val(),
				 
				 phone : $("#phone").val(),
				 
				 email : $("#email").val(),
                                 
				password : $("#password").val()
				}
                                console.log(formData);
		
		//Do Post
                   $.ajax({
			type : "post",
			contentType:"application/json",
			url:"http://localhost:8093/userupdate" ,
			data:JSON.stringify(formData) , 
			datatype:"application/text",
			success:function(data)
			{
                             location.reload();
                            refreshData();
				if(data=="success")
					{
                                            alert("Data Updated Success Successfully");
					}
                                    console.log(data);
			},
		});
                
                
		//ajaxPost();
	}
              
               
           });*/ 
        
    </script>
      
      
      
      
      
      
      
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    
    
    
  </body>
</html>
