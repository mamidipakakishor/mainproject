<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Book</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600&display=swap" rel="stylesheet">

    <style>
        html, body {
            margin: 0;
            height: 100%;
            font-family: 'Raleway', sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            position: relative; /* So absolute children can position relative to viewport */
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 90%;
            max-width: 500px;
            text-align: center;
            position: relative; /* just in case */
        }

        h2 {
            margin-bottom: 30px;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            text-align: left;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border-radius: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 1em;
        }

        input[type="submit"] {
            margin-top: 30px;
            width: 100%;
            padding: 15px;
            font-size: 1.1em;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
        }

        .back-button {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            color: white;
            font-weight: bold;
            text-decoration: none;
            border-radius: 30px;
            transition: background 0.3s ease;
            z-index: 10;
        }

        .back-button:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
        }
    </style>
</head>
<body>
    <!-- Back button outside form container for absolute top-right -->
    <a href="/library/display" class="back-button">Back to Library</a>

    <div class="form-container">
        <h2>Add New Book</h2>
        <form:form method="post" action="/library/addBook" modelAttribute="book">
            <label>Name:</label>
            <form:input path="name" type="text"/>

            <label>Author:</label>
            <form:input path="author" type="text"/>

            <label>Price:</label>
            <form:input path="price" type="number"/>

            <input type="submit" value="Add Book" />
        </form:form>
    </div>
</body>
</html>
