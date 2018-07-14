<%-- 
    Document   : pageDeleteComment
    Created on : Jul 14, 2018, 3:11:11 PM
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
        <h3>Bạn thật sự muốn xóa đánh giá này?</h3>
        <div style="border: 0;" class="modal-footer">
            <button onclick="deleteComment('${stt}', '${id}')" type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
    </body>
    <!--Xóa 1 comment-->
    <script>
        function deleteComment(stt, id) {
            $.post("admin/deleteComment.htm", {'stt': stt, 'id': id}, function (data) {
                $('body').html(data);
            });
        }
    </script>
</html>
