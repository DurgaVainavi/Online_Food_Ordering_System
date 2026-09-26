<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Ordering - Register</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 70px auto;
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
            margin-top: 12px;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            margin-top: 20px;
            background: #ff6b35;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background: #e85a28;
        }

        .login {
            text-align: center;
            margin-top: 15px;
        }

        .login a {
            text-decoration: none;
            color: #ff6b35;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Create Account</h2>

    <form action="RegisterServlet" method="post">

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Mobile Number</label>
        <input type="text" name="mobile" maxlength="10" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <input type="submit" value="Register">

    </form>

    <div class="login">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>

</div>

</body>
</html>