<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Z4 Shop</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript">
            addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
            window.scrollTo(0, 1);
            }
        </script>
        <!-- //custom-theme -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="css/shop.css" type="text/css" media="screen" property="" />
        <link href="css/style7.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Owl-carousel-CSS -->
        <link rel="stylesheet" type="text/css" href="css/contact.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- font-awesome-icons -->
        <link href="css/font-awesome.css" rel="stylesheet">
        <!-- //font-awesome-icons -->
        <link href="//fonts.googleapis.com/css?family=Montserrat:100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800"
              rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    </head>

    <body>
        <!-- banner -->
        <%@include file="/inc/toppage.jsp" %>
        <!-- //banner -->
        <!-- top Products -->
        <div class="ads-grid_shop">
            <div class="shop_inner_inf mg-t-10 mg-b-10">
                <div class="col-md-4 col-sm-10 contact-left">
                    <h3 class="head mg-b-20">Contact Us</h3>
                    <div class="content-contact" style="border-right: 1px solid #dddddd;">
                        <div class="visit">
                            <div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
                                <span class="fa fa-home" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-10 contact-text">
                                <h4>Visit us</h4>
                                <p>Parma Via Modena,BO, Italy</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mail-us">
                            <div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
                                <span class="fa fa-envelope" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-10 contact-text">
                                <h4>Mail us</h4>
                                <p><a href="#">Z4sneakers@gmail.com</a></p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="call">
                            <div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
                                <span class="fa fa-phone" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-10 contact-text">
                                <h4>Call us</h4>
                                <p>+18044261149</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="visit">
                            <div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
                                <span class="fa fa-fax" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-10 contact-text">
                                <h4>Fax</h4>
                                <p>+1804426349</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 col-sm-12 contact_grid_right">
                    <h3 class="head mg-b-20">Check Order</h3>
                    <div class="checkOrder-content">
                        <form action="#" method="post">
                            <div class="col-md-12 contact_left_grid">
                                <input id="valueSDT" type="text" name="checkOrder" maxlength="12" pattern="([0-9]|[0-9]|[0-9])"  placeholder="Enter your Phone Number here ..." required="" value="">
                                <div class="tx-al-c" style="width: 30%; height: 51px;float: right; display: flex;align-items: center;justify-content: space-evenly;">
                                <button type="reset" value="Reset" class="btn btn-icon btn-new">Clear</button>
                                <button onclick="showOrder()" type="button" class="btn btn-icon btn-search">Search</button>
                                </div>
                            </div>
                        </form>

                        <c:if test="${control=='showOrder'}">
                            <div class="col-md-12 orderInfo mg-t-10">
                                <hr>
                                <h3 class="head tx-al-c mg-b-20">Your Invoice</h3>
                                <p class="tx-al-r" style="margin-bottom: 20px;"><img src="images/logo.PNG" /></p>
                                <div style="margin-bottom: 20px;">
                                    <p>Invoice Date: <fmt:formatDate value="${date}" pattern="dd-MM-yyyy"></fmt:formatDate></p>
                                    <p>Order by: <span style="color:red;">${tenKH}</span></p>
                                    <p>Address: <span style="color: red;">${address}</span></p>
                                    <p>Status: <span style="color:red;">${status}</span></p>

                                </div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Index</th>
                                            <th>Image</th>
                                            <th>Product</th>
                                            <th>Size</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="hd" items="${listHD}" varStatus="st">
                                            <tr>
                                                <td>${st.index+1}</td>
                                                <td><img style="width:60px; height: 60px;" src="${hd.img}" /></td>
                                                <td>${hd.tenSP}</td>
                                                <td>${hd.size}</td>
                                                <td>${hd.SL}</td>
                                                <td>$ ${hd.gia}</td>
                                                <td>$ ${hd.total}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="tx-al-r">
                                    <p class="mg-r-10 f-20">PaymentTotal: <span style="color:red;">$ ${total}</span></p>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="contact-map">

            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d100949.24429313939!2d-122.44206553967531!3d37.75102885910819!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA%2C+USA!5e0!3m2!1sen!2sin!4v1472190196783"
                    class="map" style="border:0" allowfullscreen=""></iframe>
        </div>
        <!-- footer -->
        <%@include file="/inc/footerpage.jsp" %>
        <!-- //footer -->

        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!-- //js -->
        <!-- cart-js -->
        <script src="js/minicart.js"></script>
        <script>
                                    $("#valueSDT").keyup(function () {
                                        $("#valueSDT").val(this.value.match(/[0-9]*/));
                                    });
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
        <script>
                                    function showOrder() {
                                        var sdt = document.getElementById('valueSDT').value;
                                        $.post("admin/showOrderofCustomer.htm", {'sdt': sdt}, function (data) {
                                            $('body').html(data);
                                        });
                                    }
        </script>
    </body>

</html>