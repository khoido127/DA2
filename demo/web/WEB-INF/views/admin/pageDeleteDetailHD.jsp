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
        <h3>Bạn thật sự muốn xóa sản phẩm của đơn hàng này?</h3>
        <div style="border: 0;" class="modal-footer">
            <button onclick="deleteDetailHD('${id}', '${count}')" type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
        <script>
            function deleteDetailHD(id, count) {
//                alert(id);
                $.post("admin/deleteDetailHD.htm", {'id': id, 'count': count}, function (data) {
                    $('body').html(data);
                });
//                window.location.href = "admin/deleteDetailHD.htm?id=" + id;
            }
        </script>
    </body>
</html>
