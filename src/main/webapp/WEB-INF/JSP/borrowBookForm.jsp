<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Borrow Book</title>
    <style>
        body {
            font-family: 'Raleway', sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 90%;
            max-width: 500px;
            text-align: center;
        }
        input[type="number"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 1em;
        }
        input[type="submit"] {
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Borrow "${book.name}"</h2>
        <form method="post" action="/library/borrowBook/${book.id}">
            <label>Borrow for how many days?</label>
            <input type="number" name="days" min="1" value="7" required />
            <input type="submit" value="Confirm Borrow" />
        </form>
    </div>
</body>
</html>