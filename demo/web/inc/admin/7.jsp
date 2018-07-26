<%-- 
    Document   : productDetail
    Created on : Jul 6, 2018, 10:07:17 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Manage Page</title>
    </head>
    <body>
        <h1>Detail Bill</h1>
        <div class="content-bill row no-margin">
            <form id="formEditDetailHD" action="" method="post">
                <c:forEach var="hd" items="${listEditDetail}">
                    <div class="bill-details">

                        <div class="row">
                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <label class="edit-label">Product Name</label>
                                <input type="text" class="edit-field" name="TenSP" value="${hd.tenSP}"/>
                            </div>
                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <label class="edit-label">Size</label>
                                <select name="Size" id="sizeSP">
                                    <c:forEach var="s" items="${listSize}">
                                        <option ${s.selected} value="${s.size}">${s.size}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <label class="edit-label">Quantity</label>
                                <input type="number" class="edit-field" name="SL" value="${hd.SL}"/>
                            </div>
                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <label class="edit-label">Price</label>
                                <input type="text" class="edit-field" name="Gia" value="${hd.gia}"/>
                            </div>
                        </div>


                    </div>

                    <div class="button-group col-md-12 tx-al-r">
                        <input id="indexHD" type="hidden" name="index" value="${index}" />
                        <input id="idhd" type="hidden" name="idhd" value="${hd.IDHD}" />
                        <input id="idsp" type="hidden" name="idsp" value="${hd.IDSP}"/>
                        <input type="hidden" id="countDetail" />
                        <!--<button onclick="" type="button" class="mg-r-5 btn btn-add">Add New</button>-->
                        <button onclick="getDataToSaveDetailHD()" type="button" class="mg-r-5 btn btn-icon btn-save">Save</button>
                        <button data-toggle="modal" data-target="#modal-delete" disabled onclick="pageDeleteDetailHD('${hd.IDHD}')" type="button" class="btn btn-icon btn-delete" id="deleteDetailHD" >Delete</button>
                    </div>
                </c:forEach>
            </form>
            <div class="bill-table col-md-12">
                <div class="row mg-t-10">
                    <h1>Bill Table</h1>
                    <div class="col-md-12">
                        <div class="white-box">
                            <div class="table-responsive">
                                <form id="formComment" action="" method="post">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>ID Bill</th>
                                                <th>Image</th>
                                                <th>Product Name</th>
                                                <th>Size</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="hd" items="${listDetailHD}" varStatus="st">
                                                <tr>
                                                    <td>${st.index+1}</td>
                                                    <td>${hd.IDHD}</td>
                                                    <td><img style="width: 80px; height: 80px;" src="${hd.img}" /></td>
                                                    <td>${hd.tenSP}</td>
                                                    <td>${hd.size}</td>
                                                    <td>${hd.SL}</td>
                                                    <td>${hd.gia}$</td>
                                                    <td>
                                                        <button onclick="getDataShowEditDetailHD('${hd.IDHD}', '${st.index}', '${hd.IDSP}')" type="button" class="icon icon-detail"></button>
                                                    </td>
                                                    <td>
                                                        <div class="checkbox">
                                                            <label style="font-size: 1.5em; padding-left: 8px;">
                                                                <input type="hidden" id="count" value="">
                                                                <input onclick="getDataDeleteDetailHD('${hd.IDHD}')" type="checkbox" value="${st.index}" id="checkBox">
                                                                <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <script>
            function getDataShowEditDetailHD(id, index, idsp) {
//                alert(id + index + idsp);
                $.post("admin/getDataShowEditDetailHD.htm", {'id': id, 'index': index, 'idsp': idsp}, function (data) {
                    $('body').html(data);
                });
            }
        </script>
        <!--Xử lý phần Save Detail HD-->
        <script>
            function getDataToSaveDetailHD() {
                var id = document.getElementById('idhd').value;
                var index = document.getElementById('indexHD').value;
//                alert(id + index);
                $.post("admin/getDataToSaveDetailHD.htm", $('#formEditDetailHD').serialize(), function (data) {
                    $('body').html(data);
                });
            }
        </script>
        <!--Lấy dữ liệu chuẩn bị Delete-->
        <script>
            function getDataDeleteDetailHD(id) {
                var inputs = document.getElementsByTagName('input');
                var count = "";
                var dem = 0;
                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].type == "checkbox" && !inputs[i].checked) {
                        count = count + inputs[i].value + ";";
                    }
                    if (inputs[i].type == "checkbox" && inputs[i].checked) {
                        dem = 1;
                    }
                }
                document.getElementById('countDetail').value = count;
                if (dem == 1) {
                    document.getElementById('deleteDetailHD').disabled = false;
                } else {
                    document.getElementById('deleteDetailHD').disabled = true;
                }
//                alert(count);
            }
            function pageDeleteDetailHD(id) {
                var count = document.getElementById('countDetail').value;
//                alert(count);
                $.post("admin/pageDeleteDetailHD.htm", {'count': count, 'id': id}, function (data) {
                    $('.modal-body').html(data);
                });

            }
        </script>
    </body>
</html>
