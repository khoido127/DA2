<%-- 
    Document   : newjsp
    Created on : Jul 10, 2018, 11:22:48 AM
    Author     : ASUS
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <table id="tableProduct" class="table display">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>IMAGE</th>
                    <th>NAME</th>
                    <th>BRAND</th>
                    <th>PRICE</th>
                    <th>DELETE</th>
                    <th>PRODUCT DETAIL</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sp" items="${list}" varStatus="st">
                    <tr id="" style="cursor: pointer;">
                        <td>${st.index+1}</td>
                        <td style="width: 80px; height: 80px;"><img style="width: 80px; height: 80px;" src="images/product/${sp.IDLoai}/${sp.IDSP}/${sp.hinhSP}" /></td>
                        <td class="txt-oflo">${sp.tenSP}</td>
                        <td>${sp.tenLoai}</td>
                        <td>$ ${sp.giaSP}</td>
                        <td>
                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                            <!--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal-delete">Open Modal</button>-->
                            <button onclick="pageDeleteSP('${sp.IDSP}')" data-toggle="modal" data-target="#modal-delete" type="button" class="btn btn-trash" >Delete</button>
                        </td>
                        <td>
                            <button onclick="getDataEdit('${sp.IDSP}')" type="button" class="btn btn-detail">Detail</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

    </body>
</html>
