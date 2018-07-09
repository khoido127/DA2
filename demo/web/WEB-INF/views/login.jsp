
<html lang="zxx">

    <%@page pageEncoding="UTF-8" %>
    <head>
        <title>Z4 Shop</title>
        <link rel="stylesheet" href="../css/login.css" type="text/css" media="screen" property="" />

    </head>

    <body>
        <form class="login-form">
            <p class="login-text">
                <img src="../images/login.png" style="width: 180px">
            </p>
            <input type="text" class="login-username" autofocus="true" maxlength="10" required="true" placeholder="Username" />
            <input type="password" class="login-password" required="true" maxlength="10" placeholder="Password" />
            <div class="button-login" style="display: flex;justify-content: center">
                <input type="button" class="login-submit" value="Reset"/>
            <input type="submit" name="Login" value="Login" class="login-submit" />
            </div>
            
        </form>
        <div class="underlay-photo"></div>
        <div class="underlay-black"></div> 
    </body>

</html>