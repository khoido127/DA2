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
        <title>User Manage Page</title>
    </head>
    <body>
        <h1>User Manage</h1>
        <div class="content-user row no-margin">
            <form action="admin/saveToEditUser.htm" method="post" id="formuser" enctype="multipart/form-data">
                <c:forEach var="nv" items="${list1nv}">
                    <div class="col-md-3 content-image tx-al-c mg-t-10">
                        <img id="anhdaidien" class="mg-b-10" src="${src}" width="200"/>
                        <input multiple="false" accept="image/*" onchange="getFileUploadUser(event)" id="uploadImage" type="file" class="btn" name="fileupload" value=""/>
                    </div>
                    <div class="col-md-9 content-edit">
                        <div class="edit-control col-md-10 mg-b-10 mg-t-10">
                            <label class="edit-label">Username</label>
                            <input ${readonly} name="username" type="text" class="edit-field" value="${nv.username}"/>
                        </div>
                        <div class="edit-control col-md-10 mg-b-10 mg-t-10">
                            <label class="edit-label">Password</label>
                            <input name="password" type="password" class="edit-field" value="${nv.password}"/>
                        </div>
                        <div class="edit-control col-md-10 mg-b-10 mg-t-10">
                            <label class="edit-label" style="float:left">Is Admin:</label>
                            <div class="edit-field" style="float:left">
                                <c:forEach var="r" items="${listRole}">
                                    <div class="tx-al-c" style="width:40%;float:left">
                                        <label class="mg-r-5">${r.role}</label>
                                        <input ${r.checked} value="${r.isAdmin}" type="radio"  name="isAdmin" />
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="edit-control col-md-10 mg-b-10 mg-t-10">
                            <label class="edit-label">Info</label>
                            <textarea name="info" maxlength="200" class="edit-field" cols="6" rows="3" draggable="false" placeholder="Input here">${nv.info}</textarea>
                        </div>
                        <div class="button-group col-md-12 tx-al-r">
                            <input type="hidden" name="srcimg" value="${nv.img}"/>
                            <button onclick="resetuser()" type="button" class="mg-r-5 btn btn-add">Clear</button>
                            <button onclick="getdatatosave()" type="button" class="mg-r-5 btn btn-save">Save</button>
                            <button data-toggle="modal" data-target="#modal-delete" onclick="confirm()" id="btndeleteuser" disabled type="button" class="btn btn-delete">Delete</button>
                        </div>
                    </div>
                </c:forEach>
            </form>
            <div class="col-md-12 table-content">
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
                                                <th>Username</th>
                                                <th>Password</th>
                                                <th>IsAdmin</th>
                                                <th>Image</th>
                                                <th>Info</th>
                                                <th>Edit</th>
                                                <th>Delete</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="nv" items="${listnv}" varStatus="vitri">
                                                <tr>
                                                    <td>${vitri.index+1}</td>
                                                    <td><p>${nv.username}</p></td>
                                                    <td><p>${nv.password}</p></td>
                                                    <td>${nv.isAdmin}</td>
                                                    <td>
                                                        <img class="mg-b-10" src="images/${nv.img}" width="50"/>
                                                    </td>
                                                    <td>${nv.info}</td>
                                                    <td>
                                                        <button onclick="edit1user('${nv.username}')" type="button" class="btn btn-edit">edit</button>
                                                    </td>
                                                    <td>
                                                        <div class="checkbox">
                                                            <label style="font-size: 1.5em; padding-left: 8px;">
                                                                <input type="hidden" id="count" value="">
                                                                <input type="hidden" id="listusername" value=""/>
                                                                <input onclick="checkdelete()" type="checkbox" value="${nv.username}" id="checkBox">
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
            function  edit1user(username) {
//                alert(username);
                $.post("admin/editnv.htm", {'username': username}, function (data) {
                    $('body').html(data);
                });
            }
            function getdatatosave() {
//                $.post("admin/saveToEditUser.htm",$('#formuser').serialize(), function (data) {
//                    $('body').html(data);
//                });
                document.getElementById('formuser').submit();
            }
            function resetuser() {
                $.post("admin/showuser.htm", function (data) {
                    $('body').html(data);
                });
            }
            function checkdelete() {
//                alert(username);
                var inputs = document.getElementsByTagName("input");
                var count = "";
                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].type == "checkbox" && inputs[i].checked) {
                        count = count + inputs[i].value + ";";
                    }
                }
                document.getElementById('listusername').value = count;
//                alert(count);
                if (count.length > 0) {
                    document.getElementById('btndeleteuser').disabled = false;
                } else {
                    document.getElementById('btndeleteuser').disabled = true;
                }
            }
            function confirm(){
                var username = document.getElementById('listusername').value;
//                alert(username);
                $.post("admin/pageconfirmuser.htm",{'username':username}, function(data) {
                    $('.modal-body').html(data);
} );
            }
        </script>
        <!--Xử lý phần Upload file khi click upload 1 image thì sẽ show image cho xem trước-->
        <script>
            var getFileUploadUser = function (event) {
                var input = event.target;
                var reader = new FileReader();
                reader.onload = function () {
                    var dataURL = reader.result;
                    var image = document.getElementById('anhdaidien');
//                        console.log(image.src);
                    image.src = dataURL;

                };
                reader.readAsDataURL(input.files[0]);
            };

        </script>
        <!--End-->
    </body>
</html>
