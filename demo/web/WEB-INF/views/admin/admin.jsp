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
                <div id="page-wrapper" class="pull-right" style="width: 80%">
                <c:import url="${page}"></c:import>
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
        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!-- //js -->
        <!-- cart-js -->
        <script src="js/minicart.js"></script>
        <script>
            shoe.render();
            shoe.cart.on('shoe_checkout', function (evt) {
                var items, len, i;
                if (this.subtotal() > 0) {
                    items = this.items();
                    for (i = 0, len = items.length; i < len; i++) {
                    }
                }
            });
        </script>
        <!-- //cart-js -->
        <!-- /nav -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <script src="js/classie.js"></script>
        <script src="js/demo1.js"></script>
        <!-- //nav -->
        <!-- single -->
        <script src="js/imagezoom.js"></script>
        <!-- single -->
        <!-- script for responsive tabs -->
        <script src="js/easy-responsive-tabs.js"></script>
        <script>
            $(document).ready(function () {
                $('#horizontalTab').easyResponsiveTabs({
                    type: 'default', //Types: default, vertical, accordion           
                    width: 'auto', //auto or any width like 600px
                    fit: true, // 100% fit in a container
                    closed: 'accordion', // Start closed if in accordion view
                    activate: function (event) { // Callback function if tab is switched
                        var $tab = $(this);
                        var $info = $('#tabInfo');
                        var $name = $('span', $info);
                        $name.text($tab.text());
                        $info.show();
                    }
                });
                $('#verticalTab').easyResponsiveTabs({
                    type: 'vertical',
                    width: 'auto',
                    fit: true
                });
            });
        </script>
        <!-- FlexSlider -->
        <script src="js/jquery.flexslider.js"></script>

        <!--        // Can also be used with $(document).ready()-->
        <script>

            // Can also be used with $(document).ready()
            function viewDetail(id) {


                $.post('Home/quickviewSingle.htm', {'id': id}, function (data) {
                    $(".modal-body").html(data);
                    $('.flexslider').flexslider({
                        animation: "slide",
                        controlNav: "thumbnails"
                    });
                });
//                                                                
            }

        </script>
        <script>
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        </script>
        <!-- //FlexSlider-->

        <!--search-bar-->
        <script src="js/search.js"></script>
        <!--//search-bar-->
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({
                        scrollTop: $(this.hash).offset().top
                    }, 1000);
                });
            });
        </script>
        <!-- //end-smoth-scrolling -->
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
    </body>

</html>