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
        <base href="${pageContext.servletContext.contextPath}/">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Do you want to delete this?</h3>
        <form id="formDeleteDescription" action="admin/deleteDescription.htm" method="post">
            <div style="border: 0;" class="modal-footer">
                <input type="hidden" name="hinh" value="${hinh}" />
                <input type="hidden" name="tieude" value="${tieude}" />
                <input type="hidden" name="mota" value="${mota}" />
                <input type="hidden" name="id" value="${id}" />
                <button type="button" onclick="getFormDeleteDescription()" class="btn btn-default" data-dismiss="modal">Yes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </form>
        <script>
            function getFormDeleteDescription() {
                document.getElementById('formDeleteDescription').submit();
            }
        </script>
    </body>
</html>
