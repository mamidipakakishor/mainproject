<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${appName}</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Raleway', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 80%;
            max-width: 600px;
        }

        h1 {
            color: #333;
            font-size: 2.5em;
            margin-bottom: 30px;
        }

        a.button {
            display: inline-block;
            text-decoration: none;
            background: linear-gradient(90deg, #667eea, #764ba2);
            color: white;
            padding: 15px 30px;
            border-radius: 30px;
            font-size: 1.2em;
            transition: background 0.3s ease;
        }

        a.button:hover {
            background: linear-gradient(90deg, #764ba2, #667eea);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to ${appName}</h1>
        <h3>Welcome, ${username}!</h3>
        <a href="/library/display" class="button">View Library Books</a>
    </div>
</body>
</html>
