
<html lang="zxx">

    <%@page pageEncoding="UTF-8" %>
    <head>
        <title>Z4 Shop</title>
        <link rel="stylesheet" href="../css/login.css" type="text/css" media="screen" property="" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>

    <body>
        <form method="post" id="formLogin" action="admin/checkLogin.htm" class="login-form">
            <p class="login-text">
                <img src="images/login.png" style="width: 180px">
            </p>
            <input onclick="changeStatus()" id="user" name="username" type="text" class="login-username" autofocus="true" maxlength="10" required="true" placeholder="Username" />
            <span style="color: white;font-style: italic;" id="error"></span>
            <input id="pass" name="password" type="password" class="login-password" required="true" maxlength="10" placeholder="Password" />
            <div class="button-login" style="display: flex;justify-content: center">
                <input type="button" class="login-submit" value="Reset"/>
                <button onclick="checkLogin()" type="button" name="Login" value="Login" class="login-submit" >Login</button>
            </div>

        </form>
        <div class="underlay-photo"></div>
        <div class="underlay-black"></div> 
    </body>
    <script>
        function checkLogin() {
            var username = document.getElementById('user').value;
            var password = document.getElementById('pass').value;
            if (username.length == 0 || password.length == 0) {
                document.getElementById('error').innerHTML = "Vui lòng nhập đầy đủ thông tin!";
                return false;
            }
            document.getElementById('formLogin').submit();
        }
        function changeStatus(){
            document.getElementById('error').innerHTML = "";
        }
    </script>
</html>