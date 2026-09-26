<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Ordering - Login</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 80px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background: #ff6b35;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background: #e85a28;
        }

        .register {
            text-align: center;
            margin-top: 18px;
        }

        .register a {
            color: #ff6b35;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Login</h2>

    <form action="LoginServlet" method="post">

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <input type="submit" value="Login">

    </form>

    <div class="register">
        Don't have an account?
        <a href="register.jsp">Register</a>
    </div>

</div>

</body>
</html>

