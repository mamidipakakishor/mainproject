<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Raleway', sans-serif;
            background: linear-gradient(to right, #d4fc79, #96e6a1);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 90%;
            max-width: 500px;
            position: relative;
            z-index: 1;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 1em;
            box-sizing: border-box;
        }

        input[type="submit"] {
            margin-top: 30px;
            width: 100%;
            padding: 15px;
            font-size: 1.1em;
            background: linear-gradient(to right, #56ab2f, #a8e063);
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #a8e063, #56ab2f);
        }

        .back-button {
            position: absolute;
            top: 20px;
            right: 20px;
            text-decoration: none;
            background: linear-gradient(to right, #56ab2f, #a8e063);
            color: white;
            padding: 10px 18px;
            border-radius: 25px;
            font-weight: 600;
            transition: background 0.3s ease;
            z-index: 2;
        }

        .back-button:hover {
            background: linear-gradient(to right, #a8e063, #56ab2f);
        }
    </style>
</head>
<body>
    <a href="/library/display" class="back-button">Back to Library</a>
    <div class="form-container">
        <h2>Edit Book</h2>
        <form method="post" action="/library/updateBook">
            <input type="hidden" name="id" value="${book.id}" />

            <label>Name:</label>
            <input type="text" name="name" value="${book.name}" />

            <label>Author:</label>
            <input type="text" name="author" value="${book.author}" />

            <label>Price:</label>
            <input type="number" name="price" value="${book.price}" />

            <label>Status:</label>
            <select name="status">
                <option value="Available" ${book.status == 'Available' ? 'selected' : ''}>Available</option>
                <option value="Borrowed" ${book.status == 'Borrowed' ? 'selected' : ''}>Borrowed</option>
            </select>

            <input type="submit" value="Update Book" />
        </form>
    </div>
</body>
</html>
