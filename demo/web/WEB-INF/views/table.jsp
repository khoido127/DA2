<%-- 
    Document   : table
    Created on : May 26, 2018, 11:42:05 AM
    Author     : Visible
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <th>MaSP</th>
                <th>TenSP</th>
                <th>GiaSP</th>
                <th>TenLoaiSP</th>
            </tr>
            <c:forEach var="sp" items="${listsp}">
                <tr>
                    <td>${sp.IDSP}</td>
                    <td>${sp.tenSP}</td>
                    <td>${sp.giaSP}</td>
                    <td>${sp.loai.IDLoai}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
