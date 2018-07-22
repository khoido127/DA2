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
        <h1>Bạn thật sự muốn xóa loại sản phẩm này?</h1>
        <div style="border: 0;" class="modal-footer">
            <button onclick="deleteBrand('${idLoai}')" type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
        <script>
            function deleteBrand(idLoai) {
//                alert(id);
                window.location.href = "admin/deleteBrand.htm?idLoai=" + idLoai;
            }
        </script>
    </body>
</html>
