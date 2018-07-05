
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
                                    <li><a href="#" class="p-l-20">Product Detail</a></li>
                                    <li><a href="#" class="p-l-20">Brand</a></li>
                                </ul>
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
                    <!-- content product -->
                    <div class="row top-content mg-b-20">
                        <div class="content-left-panel col-md-4">
                            <div class="single-right-left ">
                                <div class="grid images_3_of_2">
                                    <div class="flexslider">

                                        <ul class="slides">
                                            <li data-thumb="images/product/AD/ADNMD-CS2PS-BLK/CT1.jpg">
                                                <div class="thumb-image"> <img src="images/product/AD/ADNMD-CS2PS-BLK/CT1.jpg" data-imagezoom="true" class="img-responsive" style="width: 320px; height: 280px"> </div>
                                            </li>
                                            <li data-thumb="images/product/AD/ADNMD-CS2PS-BLK/CT2.jpg">
                                                <div class="thumb-image"> <img src="images/product/AD/ADNMD-CS2PS-BLK/CT2.jpg" data-imagezoom="true" class="img-responsive" style="width: 320px; height: 280px"> </div>
                                            </li>
                                            <li data-thumb="images/product/AD/ADNMD-CS2PS-BLK/CT3.jpg">
                                                <div class="thumb-image"> <img src="images/product/AD/ADNMD-CS2PS-BLK/CT3.jpg" data-imagezoom="true" class="img-responsive" style="width: 320px; height: 280px"> </div>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="content-right-panel col-md-8 p-l-0">
                            <div class="row" style="">
                                <div class="addnew-product">
                                    <div class=" mg-b-10 mg-t-10">
                                        <label class="edit-label">Product ID:</label>
                                        <input type="text" class="edit-field" value=""/>
                                    </div>
                                    <div class="mg-b-10 mg-t-10">
                                        <label class="edit-label">Product Name:</label>
                                        <input type="text" class="edit-field" value=""/>
                                    </div>
                                    <div class="mg-b-10 mg-t-10">
                                        <label class="edit-label">Price:</label>
                                        <input type="text" class="edit-field" value=""/>
                                    </div>
                                    <div class="mg-b-10 mg-t-10">
                                        <label class="edit-label">Brand:</label>
                                        <input type="text" class="edit-field" value=""/>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="button-content col-md-12 tx-al-r p-r-20">
                            <div class="col-md-4 button-content-left tx-al-l">
                                <input type="button" class="btn" value="Choose Image" />
                            </div>
                            <div class="col-md-8 button-content-right">
                                <div class="tx-al-r">
                                    <input type="button" class="btn" value="Add New" />
                                    <input type="button" class="btn" value="Save" />
                                </div>
                            </div>
                        </div>
                    </div>
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
                                        <th>DELETE</th>
                                        <th>PRODUCT DETAIL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td class="txt-oflo">Elite admin</td>
                                        <td>SALE</td>
                                        <td class="txt-oflo">April 18, 2017</td>
                                        <td><span class="text-success">$24</span></td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-detail" value="Detail"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td class="txt-oflo">Real Homes WP Theme</td>
                                        <td>EXTENDED</td>
                                        <td class="txt-oflo">April 19, 2017</td>
                                        <td><span class="text-info">$1250</span></td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-detail" value="Detail"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td class="txt-oflo">Ample Admin</td>
                                        <td>EXTENDED</td>
                                        <td class="txt-oflo">April 19, 2017</td>
                                        <td><span class="text-info">$1250</span></td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-detail" value="Detail"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td class="txt-oflo">Medical Pro WP Theme</td>
                                        <td>TAX</td>
                                        <td class="txt-oflo">April 20, 2017</td>
                                        <td><span class="text-danger">-$24</span></td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-detail" value="Detail"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- end content product -->

                    <!--content product description-->
                    <hr>
                    <div class="row mg-t-10">
                        <h1> Product Description</h1>
                        <div class="col-md-12">
                            <div class="white-box">
                                <h3 class="box-title">Product table</h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>IMAGE</th>
                                                <th>TITLE</th>
                                                <th>DESCRIPTION</th>
                                                <th>DELETE</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <img src="images/product/AD/ADNMD-CS2PS-BLK/CT1.jpg"  style="width: 200px; height: 160px">
                                                    <input type="button" class="btn" value="Choose Image"/>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="100"> </textarea>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                                </td>
                                                <td>
                                                    <input type="button" class="btn btn-trash" value="Delete"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>
                                                    <img src="images/product/AD/ADNMD-CS2PS-BLK/CT2.jpg"  style="width: 200px; height: 160px">
                                                    <input type="button" class="btn" value="Choose Image"/>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="100"> </textarea>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                                </td>
                                                <td>
                                                    <input type="button" class="btn btn-trash" value="Delete"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>
                                                    <img src="images/product/AD/ADNMD-CS2PS-BLK/CT3.jpg"  style="width: 200px; height: 160px">
                                                    <input type="button" class="btn" value="Choose Image"/>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="100"> </textarea>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                                </td>
                                                <td>
                                                    <input type="button" class="btn btn-trash" value="Delete"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>
                                                    <img src="images/product/AD/ADNMD-CS2PS-BLK/CT2.jpg"  style="width: 200px; height: 160px">
                                                    <input type="button" class="btn" value="Choose Image"/>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="100"> </textarea>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                                </td>
                                                <td>
                                                    <input type="button" class="btn btn-trash" value="Delete"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="button-bottom tx-al-r mg-r-20">
                                <input type="button" class="btn" value="Save"/>
                                <input type="button" class="btn" value="Add New"/>
                            </div>
                        </div>
                    </div>
                    <!-- end content product decription-->
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