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
        <base href="${pageContext.servletContext.contextPath}/">
        <link href="css/checkbox.css" rel="stylesheet" >

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
                    <th>EDIT</th>
                    <th>DESCRIPTION</th>
                    <th>COMMENT</th>
                    <th>STORAGE</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sp" items="${list}" varStatus="st">
                    <tr id="" style="">
                        <td>${st.index+1}</td>
                        <td style="width: 80px; height: 80px;"><img style="width: 80px; height: 80px;" src="images/product/${sp.IDLoai}/${sp.IDSP}/${sp.hinhSP}" /></td>
                        <td class="txt-oflo"><a style="text-decoration: none;color: black;" target="_blank" href="Home/pageSingle.htm?code=${sp.IDSP}">${sp.tenSP}</a></td>
                        <td>${sp.tenLoai}</td>
                        <td>$ ${sp.giaSP}</td>
                        <td>
                            <div class="checkbox">
                                <label style="font-size: 1.5em; padding-left: 8px;">
                                    <input type="hidden" id="count" value="" />
                                    <input onclick="deleteSP()" type="checkbox" value="${sp.IDSP}" id="checkBox">
                                    <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                </label>
                            </div>
                            <!--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal-delete">Open Modal</button>-->
                        </td>
                        <td>
                            <button onclick="getDataEdit('${sp.IDSP}')" type="button" class="btn btn-detail">Edit</button>
                        </td>

                        <td>
                            <button onclick="getShowDetail('${sp.IDSP}')" type="button" class="btn btn-detail">Show</button>
                        </td>
                        <td>
                            <button onclick="getShowComment('${sp.IDSP}')" type="button" class="btn btn-detail">Show</button>
                        </td>
                        <td>
                            <button onclick="getShowKho('${sp.IDSP}')" type="button" class="btn btn-detail">Show</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <script>
                                function getShowDetail(id) {
                                    $.post("admin/showDescription.htm", {'id': id}, function (data) {
                                        $('body').html(data);
                                    });
                                }
        </script>
        <script>
            function getShowComment(id) {
                $.post("admin/showComment.htm", {'id': id}, function (data) {
                    $('body').html(data);
                });
            }
        </script>
        <!--Show Kho-->
        <script>
            function getShowKho(id){
                alert(id);
                $.post("admin/showDataKho.htm", {'id': id}, function (data) {
                    $('body').html(data);
                });
            }
        </script>
        <script>

            function checkDelete(id) {
//                var inputs = document.getElementsByTagName("input");
//                alert(inputs.length);
//                var count = "";
//                for (var i = 0; i < inputs.length; i++) {
//                    var input = inputs[i];
//                    if (inputs[i].type == "checkbox" && inputs[i].checked) {
//                        count = count + inputs[i].value + ";";
//                    }
//                }
//                alert(count);
            }
        </script>
    </body>
</html>
