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
        <h1>ORDER SUCCESS</h1>
        <label>View Detail Order:</label><a class="btn btn-default" href="Home/redirectPage.htm?page=contact">View Invoice</a>
        <div style="border: 0;" class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>
<!--        <script>
            function deleteSP(id) {
//                alert(id);
                window.location.href = "admin/deleteSP.htm?id=" + id;
            }
        </script>-->
    </body>
</html>
