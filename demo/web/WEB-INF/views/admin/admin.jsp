<%-- 
    Document   : demo
    Created on : Jul 9, 2018, 9:31:29 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<meta http-equiv="refresh" content="5" />-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            setTimeout(function () {
                location.reload();
            }, 200000);
        </script>
        <!--Data Table-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.18/b-1.5.2/b-html5-1.5.2/b-print-1.5.2/sl-1.2.6/datatables.min.css"/>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.18/b-1.5.2/b-html5-1.5.2/b-print-1.5.2/sl-1.2.6/datatables.min.js"></script>


        <title>Z4 Shop</title>
        <%@include file="/inc/lib.jsp" %>
    </head>
    <body>

        <div class="content-manage-page" id="home">
            <nav class="navbar row no-padding">
                <div class="top-left-part col-md-2">
                    <!-- Logo -->
                    <span class="team-name" style="color:#a3a3a3; font-size: 28px"> 
                        <a href="Home/redirectPage.htm?page=index" class="cl-ogrange" style="font-weight: bold; font-size: 38px">Z4</a> 
                        Team</span> 
                </div>
                <!-- /Logo -->
                <div class="pull-right col-md-4">
                    <div class="pull-right">
                        <a class="profile-pic" href="#"> 
                            <b class="username f-20">Steave</b></a>
                        <img src="images/t1.jpg" alt="user-img" width="75" class="img-circle mg-l-20 mg-r-20 mg-t-10">
                    </div>
                </div>
                <!-- /.navbar-header -->
            </nav>
            <!-- Left Sidebar -->
            <div class="content-manage">
                <div class="sidebar pull-left" style="width:20%" >
                    <div class="sidebar-nav">
                        <div class="sidebar-head" style="margin: 0 10px; border-bottom: solid 2px #dddddd;">
                            <h3 class="menu-title tx-al-c mg-b-10">Navigation</h3>
                        </div>
                        <ul class="menu-title">
                            <li>
                                <a href="index.html" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Product</a>
                                <ul class="sub-menu">
                                    <li><a href="admin/contentDetailProduct.htm?page=1" class="p-l-20">Product Detail</a></li>
                                    <li><a href="admin/content.htm?page=2" class="p-l-20">Product Describe</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="admin/content.htm?page=3" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>User</a>
                            </li>
                            <li>
                                <a href="admin/content.htm?page=4" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Brand</a>
                            </li>
                            <li>
                                <a href="admin/content.htm?page=5" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Bill</a>
                            </li>

                        </ul>
                    </div>
                </div>
                <!-- End Left Sidebar -->
                <!-- Page Content -->
                <!-- The Modal -->
                <div id="modal-delete" class="modal" tabindex="-1" role="dialog">

                    <div  class="modal-dialog modal-lg" role="document">
                        <div style="border:5px solid #cccccc; border-radius: 0;" class="modal-content">
                            <div style="border: 0;" class="modal-header">

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                
                                <div style="border: 0;" class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Modal-->
                <div id="page-wrapper" class="pull-right" style="width: 80%">

                    <c:import url="/inc/admin/edit.jsp"></c:import>
                        <!--<div class="white-box">-->
                    <c:import  url="${page}"></c:import>

                    </div>
                    <div class="clearfix"></div>
                    <!-- footer -->
                <%@include file="/inc/footerpage.jsp" %>
            </div>

            <!-- FlexSlider -->
            <script src="js/jquery.flexslider.js"></script>

            <!--        // Can also be used with $(document).ready()-->

            <script>
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
            </script>
            <!-- //FlexSlider-->
            <!-- single -->
            <script src="js/imagezoom.js"></script>
            <!-- single -->
            <!-- /nav -->
            <script src="js/modernizr-2.6.2.min.js"></script>
            <script src="js/classie.js"></script>
            <script src="js/demo1.js"></script>
            <!-- //nav -->
            <!--slimscroll JavaScript -->
            <script src="../manage-lib/js/jquery.slimscroll.js"></script>
            <script>

            $(document).ready(function () {
                $('#tableProduct').DataTable({
                    dom: 'Bfrtip',
                    select: true
//                        buttons: [
//                            'copy', 'excel', 'pdf'
//                        ]

                });
            });
            </script>
            <!--Xu ly phan Show du lieu de Edit khi Select 1 row-->
            <script>
                function getDataEdit(idsp) {
//                    alert(idsp);
//                    window.location.href="admin/getDataEdit.htm?id=" + idsp;
                    $.post("admin/getDataEdit.htm", {'id': idsp}, function (data) {
                        $('body').html(data);
                    });
                }
            </script>
            <!--Xử lý phần Upload file khi click upload 1 image thì sẽ show image cho xem trước-->
            <script>
                var getFileUpload = function (event) {
                    var input = event.target;
                    var reader = new FileReader();

                    reader.onload = function () {
                        var id = document.getElementById('idImage').value;
                        var nameFileUpload = document.getElementById('uploadImage').files[0].name;
                        console.log(document.getElementById('uploadImage').value);
//                        alert("hello" + id);
//                        document.getElementById('fileName-' + id).value = nameFileUpload;
                        var dataURL = reader.result;
                        var image = document.getElementById('anhDaiDien');
//                        console.log(image.src);
                        image.src = dataURL;
                        var thumb = document.getElementById('thumbImage-' + id);
                        thumb.src = dataURL;
                    };
                    reader.readAsDataURL(input.files[0]);
                };

            </script>
            <!--End-->

            <!--Xu ly phan hinh anh slide-->
            <script>
                var nameImage = "";
                for (var i = 1; i <= 3; i++) {
                    nameImage = nameImage + document.getElementById('index-' + i).value + ".jpg" + ";";

                }
                document.getElementById('nameImage').value = nameImage;
//                alert(nameImage);
                function getImage(s, id) {
//                    alert(nameImage);
                    for (var i = 1; i <= 3; i++) {

                        if (i == id) {
                            document.getElementById('thumbImage-' + i).setAttribute("style", "border:1px solid red;width:80px;height:80px;");
                        } else {
                            document.getElementById('thumbImage-' + i).setAttribute("style", "width:80px;height:80px;");
                        }
                    }

                    var src = document.getElementById('thumbImage-' + id).src;
                    document.getElementById('anhDaiDien').src = src;
                    document.getElementById('idImage').value = id;
                }



            </script>

            <script>
                function getDataToSave(id) {
                    var nameImage = "";
                    var index = document.getElementById('idImage').value;
                    var file = document.getElementById('anhDaiDien').src;
                    console.log(id);
                    console.log(index);
                    for (var i = 1; i <= 3; i++) {
                        nameImage = nameImage + document.getElementById('fileName-' + i).value + ";";
                    }
//                    $.post("admin/saveToEdit.htm", {'id': id,'nameImage':index}, function (data) {
//                        $('body').html(data);
//                    });
                    window.location.href = "admin/saveToEdit.htm?id=" + id + "&fileUpload=fileUpload";
                    console.log(nameImage);
                }
            </script>
            <!--Refresh de them moi-->
            <script>
                function addNew() {
                    $.post("admin/contentDetailProduct.htm", {'page': 1}, function (data) {
                        $('body').html(data);
                    });
                }
            </script>
            <!--Get giá trị IDLoai-->
            <script>
                function getIDLoai() {
                    alert("hello");
//                    var idloai = document.getElementById('loaiSP');
//                    var value=idloai.options[idloai.selectedIndex].value;
                    alert($('#loaiSP')).val();
                }
            </script>
            <script>
                function pageDeleteSP(id) {
//                    alert(id);
                    $.post('admin/pageDeleteSP.htm', {'id': id}, function (data) {
                        $(".modal-body").html(data);

                    });
//                                                                
                }
                
            </script>
    </body>
</html>
