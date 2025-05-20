<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
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
    <a class="navbar-brand text-white" href="#">BookStore</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link text-white" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="availablebooks.jsp">Available Books</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-white" href="mybooks.jsp">My Books</a>
            </li>
        </ul>
        <div>
            <a class="nav-link disabled text-white" href="registernewBook.jsp">Register new Book</a>
        </div>
    </div>
</nav>

<div class="container my-5 p-5" style="border: 1px solid black;">
    <h4 class="text-center">Edit Book Here</h4>

    <form id="RegForm" enctype="multipart/form-data" class="col-md-4 offset-md-4">
        <div class="form-group row">
            <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
            <div class="col-md-6">
                <input type="text" id="name" class="form-control" name="name" required>
            </div>
        </div>

        <div class="form-group row">
            <label for="author" class="col-md-4 col-form-label text-md-right">Author</label>
            <div class="col-md-6">
                <input type="text" id="author" class="form-control" name="author" required>
            </div>
        </div>

        <div class="form-group row">
            <label for="price" class="col-md-4 col-form-label text-md-right">Price</label>
            <div class="col-md-6">
                <input type="number" id="price" class="form-control" name="price" required>
            </div>
        </div>

        <div class="col-md-6 offset-md-4">
            <button type="submit" class="btn btn-primary">Register</button>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
    const urlParams = new URLSearchParams(window.location.search);
    const bookId = urlParams.get('id'); // Get ID from URL

    // Fetch book data by ID
    $.get(`http://localhost:8081/editbook/${bookId}`, function (data) {
        console.log(data);
        $("#id").val(data.id); // Ensure the hidden input for ID exists
        $("#name").val(data.name);
        $("#author").val(data.author);
        $("#price").val(data.price);
    }).fail(function (error) {
        console.error("Error fetching book data:", error);
        alert("Failed to load book data");
    });

    // Handle form submission
    $("#RegForm").submit(function (event) {
        event.preventDefault();
        const formData = {
            id: $("#id").val(),
            name: $("#name").val(),
            author: $("#author").val(),
            price: $("#price").val()
        };

        $.ajax({
            type: "PUT",
            url: `http://localhost:8081/api/books/${formData.id}`,
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
                alert("Data Updated Successfully");
                // Optionally redirect or refresh the page
            },
            error: function (error) {
                alert("Error updating data");
                console.error(error);
            }
        });
    });
});

</script>

	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
