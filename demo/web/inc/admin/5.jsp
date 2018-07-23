<%-- 
    Document   : productDetail
    Created on : Jul 6, 2018, 10:07:17 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Brand Page</title>
    </head>
    <body>
        <div class="brand-page">
            <div class="field-content row no-margin">
                <form method="post" action="" id="formBrand">
                <div class="addnew-product">
                    <div class="col-md-10 mg-b-10 mg-t-10">
                        <label class="edit-label">Brand ID:</label>
                        <input ${readonly} id="idLoai" type="text" name="idLoai" class="edit-field" value="${idLoai}"/>
                    </div>
                    <div class="col-md-10 mg-b-10 mg-t-10">
                        <label class="edit-label">Brand Name:</label>
                        <input type="text" name="tenLoai" class="edit-field" value="${tenLoai}"/>
                    </div>
                </div>
                <div class="button-content tx-al-r col-md-12">
                    <button onclick="saveBrand()" type="button" class="btn">Save</button>
                    <button onclick="resetBrand()" type="button" class="btn">Reset</button>
                </div>
                </form>

            </div>
            <div class="table-content row no-margin">
                <div class="white-box">
                    <h3 class="box-title">Brand table</h3>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>BRAND ID</th>
                                    <th>BRAND NAME</th>
                                    <th>EDIT</th>
                                    <th>DELETE</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="loai" items="${listLoai}" varStatus="st">
                                    <tr>
                                        <td>${st.index + 1}</td>
                                        <td class="txt-oflo">${loai.IDLoai}</td>
                                        <td>${loai.tenLoai}</td>
                                        <td>
                                            <button onclick="getDataEditBrand('${loai.IDLoai}', '${loai.tenLoai}')" type="button" class="btn btn-edit">Edit</button>
                                        </td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <button data-toggle="modal" data-target="#modal-delete"data-toggle="modal" data-target="#modal-delete" onclick="pageDeleteBrand('${loai.IDLoai}')" type="button" class="btn btn-trash">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <script>
                                                function getDataEditBrand(idLoai, tenLoai) {
                                                    $.post("admin/editBrand.htm", {'idLoai': idLoai, 'tenLoai': tenLoai}, function (data) {
                                                        $('body').html(data);
                                                    });
                                                }
                                                
        </script>
        <script>
            function saveBrand() {
                                                    var idLoai = document.getElementById('idLoai').value;
                                                    
//                                                    alert(idLoai);
//                                                    document.getElementById('formBrand').submit();
                                                    $.post("admin/saveEditBrand.htm",$('#formBrand').serialize(), function (data) {
                                                        $('body').html(data);
                                                    });
                                                }
                                                
                                                function pageDeleteBrand(idLoai) {
//                                                    alert(idLoai);
                                                    $.post("admin/pageDeleteBrand.htm",{'idLoai': idLoai}, function (data) {
                                                        $('.modal-body').html(data);
                                                    });
                                                }
                                                
                                                function resetBrand() {
                                                    $.post("admin/showBrand.htm", function (data) {
                                                        $('body').html(data);
                                                    });
                                                }
        </script>
    </body>
</html>
