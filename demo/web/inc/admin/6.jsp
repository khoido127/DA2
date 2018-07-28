<%-- 
    Document   : productDetail
    Created on : Jul 6, 2018, 10:07:17 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Manage Page</title>
    </head>
    <body>

        <h1>Describe Bill</h1>
        <div class="content-bill row no-margin">
            <form id="formDescribeHD" action="" method="post">
                <c:forEach var="hd" items="${listEditDescribe}">
                    <div class="bill-details">
                        <div class="row">

                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <label class="edit-label">ID Bill</label>
                                <input ${readonly} type="text" maxlength="10" id="idbill" class="edit-field" name="IDHD" value="${hd.IDHD}"/>
                            </div>
                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <c:forEach var="t" items="${listTT}">
                                    <div class="col-md-4 tx-al-c">
                                        <label class="mg-r-5">${t.hinhThucTT}</label>
                                        <input ${t.checked} value="${t.hinhThucTT}" type="radio" name="hinhThucTT" />
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <label class="edit-label">Order By</label>
                                <input type="text" class="edit-field" id="orderby" name="TenKH" maxlength="50" value="${hd.tenKH}"/>
                            </div>
                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <label class="edit-label">Phone</label>
                                <input id="phone" type="text" maxlength="14" class="edit-field" name="SDT" value="${hd.SDT}"/>
                                <span id="checkphonewrong" style="display: none;" class="col-md-8 col-md-offset-4 no-padding">Phone have 10 - 11 digit! Ex: 09x.xxx.xxxx, 08x.xxx.xxxx, 01x.xxx.xxx.xx </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <label class="edit-label" style="position: relative;top: -28px;">Address</label>
                                <textarea class="edit-field" name="diaChi" col="30" row="3" maxlength="200" value="${hd.diaChi}"></textarea>
                            </div>
                            <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                                <label class="edit-label">Total:</label>
                                <span class="edit-field tx-al-l">${hd.total}$</span>
                            </div>
                        </div>
                    </div>
                    <div class="button-group col-md-12 tx-al-r">
                        <input type="hidden" id="IDHD" value="" />
                        <!--<button onclick="" type="button" class="mg-r-5 btn btn-add">Add New</button>-->
                        <button onclick="saveDescribeHD()" type="button" class="mg-r-5 btn btn-icon btn-save">Save</button>
                        <button data-toggle="modal" data-target="#modal-delete" id="deleteDescribe" disabled onclick="pageDeleteDescribeHD()" type="button" class="btn btn-icon btn-delete">Delete</button>
                    </div>
                </c:forEach>
            </form>
            <div class="bill-table col-md-12">
                <div class="row mg-t-10">
                    <h1>Bill Table</h1>
                    <div class="col-md-12">
                        <div class="white-box">
                            <div class="table-responsive">
                                <form id="formHoaDon" action="" method="post">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Index</th>
                                                <th>ID Bill</th>
                                                <th>Time</th>
                                                <th>Total</th>
                                                <th>Status</th>
                                                <th>Order By</th>
                                                <th>Phone</th>
                                                <th>Edit</th>
                                                <th>Detail</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="hd" items="${listHD}" varStatus="st">
                                                <tr>
                                                    <td>${st.index+1}</td>
                                                    <td>${hd.IDHD}</td>
                                                    <td><p><fmt:formatDate pattern="dd/MM/yyyy" value="${hd.ngay}" /></p></td>
                                                    <td>${hd.tongTien}$</td>
                                                    <td>${hd.trangThai}</td>
                                                    <td>${hd.tenKH}</td>
                                                    <td>${hd.SDT}</td>
                                                    <td>
                                                        <button onclick="getDataShowEditDescribe('${hd.IDHD}')" type="button" class="icon icon-detail"></button>
                                                    </td>
                                                    <td>
                                                        <button onclick="showDetailHD('${hd.IDHD}')" type="button" class="icon icon-show"></button>
                                                    </td>
                                                    <td>
                                                        <div class="checkbox">
                                                            <label style="font-size: 1.5em; padding-left: 8px;">
                                                                <input type="hidden" id="count" value="">
                                                                <input onclick="getIDHDToDelete()" type="checkbox" value="${hd.IDHD}" id="checkBox">
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
             $("#phone").keyup(function () {
                                                                        $("#phone").val(this.value.match(/[0-9]*/));
                                                                    });
                                                                     $("#orderby").keyup(function () {
                                                                        $("#orderby").val(this.value.match(/[a-zA-Z_ ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]*/));
                                                                    });
                                                                     $("#idbill").keyup(function () {
                                                                        $("#idbill").val(this.value.match(/[a-zA-Z0-9]*/));
                                                                    });
                                                                    //                                   bat loi phone
                                                                    $("#phone").focusout(function () {
                                                                        var phone = $('#phone').val().trim(); // ID Số điện thoại
                                                                        phone = phone.replace('(+84)', '0');
                                                                        phone = phone.replace('+84', '0');
                                                                        phone = phone.replace('0084', '0');
                                                                        phone = phone.replace(/ /g, '');
                                                                        if (phone !== '') {
                                                                            var firstNumber = phone.substring(0, 2);
                                                                            if ((firstNumber === '09' || firstNumber === '08' || firstNumber === '01') && phone.length >= 10) {
                                                                                if (phone.match(/^\d{10}/)) {
                                                                                    document.getElementById('checkphonewrong').style = 'display:none';
                                                                                }
                                                                            } else if (firstNumber === '01' && phone.length === 11) {
                                                                                if (phone.match(/^\d{11}/)) {
                                                                                    document.getElementById('checkphonewrong').style = 'display:none';
                                                                                }
                                                                            } else {
                                                                                document.getElementById('checkphonewrong').style = 'display:visible; color:red;font-size:12px';
                                                                            }
                                                                        }else{document.getElementById('checkphonewrong').style = 'display:none';}                                                                    });
                                                                   
        </script>
        <script>
            function showDetailHD(id) {
//                alert(id);
                $.post("admin/showDetailHD.htm", {'id': id}, function (data) {
                    $('body').html(data);
                });
            }
        </script>
        <script>
            function getDataShowEditDescribe(id) {
//                alert(id);
                $.post("admin/getDataShowEditDescribe.htm", {'id': id}, function (data) {
                    $('body').html(data);
                });
            }
            function saveDescribeHD() {
                $.post("admin/saveDescribeHD.htm", $('#formDescribeHD').serialize(), function (data) {
                    $('body').html(data);
                });
            }
            function getIDHDToDelete() {
                var inputs = document.getElementsByTagName("input");
                var count = "";
                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].type == "checkbox" && inputs[i].checked) {
                        count = count + inputs[i].value + ";";
                    }
                }
//                alert(count);
                document.getElementById('IDHD').value = count;
                if (count.length > 0) {
                    document.getElementById('deleteDescribe').disabled = false;
                } else {
                    document.getElementById('deleteDescribe').disabled = true;
                }
            }
            function pageDeleteDescribeHD() {
                var idhd = document.getElementById('IDHD').value;
//                alert(idhd);
                $.post("admin/pageDeleteDescribeHD.htm", {'id': idhd}, function (data) {
                    $('.modal-body').html(data);
                });
            }
        </script>
    </body>
</html>
