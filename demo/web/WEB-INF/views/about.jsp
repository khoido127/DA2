
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
                                <a href="index.jsp" class="cl-ogrange" style="font-weight: bold; font-size: 38px">Z4</a> 
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
        <div class="content-manage" style="margin: 30px 0">
        <div class="sidebar pull-left" style="width:20%" >
            <div class="sidebar-nav">
                <div class="sidebar-head">
                    <h3 class="menu-title">Navigation</h3>
                </div>
                <ul class="menu-title">
                    <li>
                        <a href="index.html" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Product</a>
                    </li>
                    <li>
                        <a href="index.html" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>User</a>
                    </li>
                    <li>
                        <a href="index.html" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Comment</a>
                    </li>
                    <li>
                        <a href="index.html" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Bill</a>
                    </li>
                    
                </ul>
            </div>
        </div>
        <!-- End Left Sidebar -->
        <!-- Page Content -->
        <div id="page-wrapper" class="pull-right" style="width: 80%">
                <!-- table -->
                <div class="row top-content mg-b-20">
                    <div class="col-md-6 mg-b-10 mg-t-10">
                        <label class="edit-label">Product ID:</label>
                        <input type="text" class="edit-field" value=""/>
                    </div>
                     <div class="col-md-6 mg-b-10 mg-t-10">
                        <label class="edit-label">Product Name:</label>
                        <input type="text" class="edit-field" value=""/>
                    </div>
                     <div class="col-md-6 mg-b-10 mg-t-10">
                        <label class="edit-label">Price:</label>
                        <input type="text" class="edit-field" value=""/>
                    </div>
                     <div class="col-md-6 mg-b-10 mg-t-10">
                        <label class="edit-label">Brand:</label>
                        <input type="text" class="edit-field" value=""/>
                    </div>
                    <div class="button-content col-md-12 tx-al-r p-r-20"> 
                        <input type="button" class="btn" value="Add New" />
                        <input type="button" class="btn" value="Save" />
                        <input type="button" class="btn" value="Delete" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">Product table</h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>NAME</th>
                                            <th>STATUS</th>
                                            <th>DATE</th>
                                            <th>PRICE</th>
                                            <th><input type="checkbox" class="custom-checkbox"/></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td class="txt-oflo">Elite admin</td>
                                            <td>SALE</td>
                                            <td class="txt-oflo">April 18, 2017</td>
                                            <td><span class="text-success">$24</span></td>
                                            <td><input type="checkbox" class="custom-checkbox"/></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td class="txt-oflo">Real Homes WP Theme</td>
                                            <td>EXTENDED</td>
                                            <td class="txt-oflo">April 19, 2017</td>
                                            <td><span class="text-info">$1250</span></td>
                                            <td><input type="checkbox" class="custom-checkbox"/></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td class="txt-oflo">Ample Admin</td>
                                            <td>EXTENDED</td>
                                            <td class="txt-oflo">April 19, 2017</td>
                                            <td><span class="text-info">$1250</span></td>
                                            <td><input type="checkbox" class="custom-checkbox"/></td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td class="txt-oflo">Medical Pro WP Theme</td>
                                            <td>TAX</td>
                                            <td class="txt-oflo">April 20, 2017</td>
                                            <td><span class="text-danger">-$24</span></td>
                                            <td><input type="checkbox" class="custom-checkbox"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
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