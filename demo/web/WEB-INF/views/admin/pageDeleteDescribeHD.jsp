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
        <h3>Do you want to delete this?</h3>
        <div style="border: 0;" class="modal-footer">
            <button onclick="deleteDescribeHD('${id}')" type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
        <script>
            function deleteDescribeHD(id) {
//                alert(id);
                $.post("admin/deleteDescribeHD.htm", {'id': id}, function (data) {
                    $('body').html(data);
                });
//                window.location.href = "admin/deleteDetailHD.htm?id=" + id;
            }
        </script>
    </body>
</html>
