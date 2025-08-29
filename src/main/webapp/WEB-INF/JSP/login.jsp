<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>Login</title>
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap"
    rel="stylesheet"
  />
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
      font-family: 'Inter', sans-serif;
    }

    .container {
      background: #fff;
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      width: 90%;
      max-width: 400px;
      text-align: center;
    }

    h2 {
      margin-bottom: 20px;
      color: #333;
      font-weight: 600;
      letter-spacing: 1px;
    }

    .form-group {
      margin: 20px 0;
      text-align: left;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      color: #555;
      font-size: 0.9rem;
    }

    .form-group input[type="text"],
    .form-group input[type="password"] {
      width: 100%;
      padding: 12px 15px;
      border: 2px solid #eee;
      border-radius: 10px;
      font-size: 1rem;
      transition: border-color 0.3s;
    }

    .form-group input:focus {
      outline: none;
      border-color: #f97316;
    }

    .btn {
      width: 100%;
      padding: 14px;
      margin-top: 10px;
      border: none;
      border-radius: 30px;
      background: linear-gradient(90deg, #f97316, #ea580c);
      color: #fff;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: transform 0.2s, box-shadow 0.2s;
    }

    .btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }

    .error-message {
      margin-top: 15px;
      color: #dc2626;
      font-size: 0.9rem;
      font-weight: 500;
    }

    .switch-page {
      margin-top: 20px;
      font-size: 0.9rem;
      color: #555;
    }

    .switch-page a {
      color: #f97316;
      text-decoration: none;
      font-weight: 600;
    }

    .switch-page a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Welcome Back</h2>
    <form method="post" action="/login">
      <div class="form-group">
        <label for="username">Username</label>
        <input
          type="text"
          id="username"
          name="username"
          placeholder="Enter your username"
          required
        />
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input
          type="password"
          id="password"
          name="password"
          placeholder="Enter your password"
          required
        />
      </div>

      <button type="submit" class="btn">Log In</button>
    </form>

    <c:if test="${not empty error}">
      <div class="error-message">${error}</div>
    </c:if>

    <div class="switch-page">
      New here?
      <a href="/register">Create an account</a>
    </div>
  </div>
</body>
</html>