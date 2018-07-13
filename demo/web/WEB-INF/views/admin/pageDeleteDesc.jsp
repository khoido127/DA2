<%-- 
    Document   : pageDeleteDescription
    Created on : Jul 13, 2018, 4:46:25 PM
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
        <h3>Bạn thật sự muốn xóa mô tả của sản phẩm này?</h3>
        <div style="border: 0;" class="modal-footer">
            <button onclick="saveToEditDescription('${vitri}', 'delete')" type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>

    </body>
</html>
