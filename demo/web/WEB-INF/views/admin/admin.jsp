<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
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
                                    <li><a href="admin/content.htm?page=1" class="p-l-20">Product Detail</a></li>
                                    <li><a href="admin/content.htm?page=2" class="p-l-20">Product Describe</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="admin/content.htm?page=3" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>User</a>
                            </li>
                            <li>
                                <a href="admin/content.htm?page=4" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Comment</a>
                            </li>
                            <li>
                                <a href="admin/content.htm?page=5" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Bill</a>
                            </li>

                        </ul>
                    </div>
                </div>
                <!-- End Left Sidebar -->
                <!-- Page Content -->
                
                <c:import url="${page}"></c:import>
                
            </div>
            <div class="clearfix"></div>
            <!-- footer -->
            <%@include file="/inc/footerpage.jsp" %>
        </div>

        <!-- //footer -->
        <!-- All Jquery -->
        <!-- Bootstrap Core JavaScript -->
        <script src="../manage-lib/bootstrap/dist/js/bootstrap.min.js"></script>
        <!--slimscroll JavaScript -->
        <script src="../manage-lib/js/jquery.slimscroll.js"></script>
        <!--Wave Effects -->
        <script src="../manage-lib/js/waves.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../manage-lib/js/custom.min.js"></script>
        <script src="../manage-lib/js/dashboard1.js"></script>
    </body>

</html>