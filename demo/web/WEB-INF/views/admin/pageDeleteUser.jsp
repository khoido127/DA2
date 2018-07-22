<%-- 
    Document   : deleteSP
    Created on : Jul 11, 2018, 8:36:03 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Do you want to delete this?</h1>
        <div style="border: 0;" class="modal-footer">
            <button onclick="deleteuser('${username}')" type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
        <script>
            function deleteuser(username) {
                alert(username);
                    $.post("admin/deleteuser.htm",{'username': username},function(data) {
                        $('body').html(data);
});
            }
        </script>
    </body>
</html>
