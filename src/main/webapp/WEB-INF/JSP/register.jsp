<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register</title>
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
      background: linear-gradient(135deg, #74ebd5 0%, #acb6e5 100%);
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
      border-color: #667eea;
    }

    .form-group input::placeholder {
      color: #aaa;
    }

    .btn {
      width: 100%;
      padding: 14px;
      margin-top: 10px;
      border: none;
      border-radius: 30px;
      background: linear-gradient(90deg, #667eea, #764ba2);
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

    .switch-page {
      margin-top: 15px;
      font-size: 0.9rem;
      color: #555;
    }

    .switch-page a {
      color: #667eea;
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
    <h2>Create Your Account</h2>
    <form:form method="post" action="/register" modelAttribute="user">
      <div class="form-group">
        <label for="username">Username</label>
        <form:input
          path="username"
          id="username"
          placeholder="Enter your username"
        />
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <form:input
          path="password"
          id="password"
          type="password"
          placeholder="Enter a strong password"
        />
      </div>

      <div class="form-group">
        <label for="adminKey">Admin Key (optional)</label>
        <input
          type="text"
          name="adminKey"
          id="adminKey"
          placeholder="Key to register as admin"
        />
      </div>

      <button type="submit" class="btn">Register Now</button>
    </form:form>

    <div class="switch-page">
      Already have an account?
      <a href="/login">Login here</a>
    </div>
  </div>
</body>
</html>