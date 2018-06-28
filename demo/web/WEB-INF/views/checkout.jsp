

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Z4 Shop</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Downy Shoes Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
        <link rel="stylesheet" type="text/css" href="css/checkout.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- font-awesome-icons -->
        <link href="css/font-awesome.css" rel="stylesheet">
        <!-- //font-awesome-icons -->
        <link href="//fonts.googleapis.com/css?family=Montserrat:100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800"
              rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    </head>

    <body>
        <%@include file="/inc/toppage.jsp" %>
        <!-- top Products -->
        <div class="ads-grid_shop">
            <div class="shop_inner_inf">
                <div class="privacy about">
                    <h3>Chec<span>kout</span></h3>

                    <div class="checkout-right">
                        <h4>Your shopping cart contains: <span>${sumCart} Products</span></h4>
                        <table class="timetable_sub">
                            <thead>
                                <tr>
                                    <th>SL No.</th>
                                    <th>Product</th>
                                    <th>Quality</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    String idsp = String.valueOf(request.getAttribute("idsp"));
                                %>
                                <c:forEach var="sp" items="${listcart}" varStatus="st">
                                    <c:set var="IDSP" value="${sp.IDSP}"></c:set>
                                    <c:set var="ID" value="<%=idsp%>"></c:set>
                                    <tr id="check-${sp.IDSP}" class="rem1">
                                        <td class="invert">${st.index+1}</td>
                                        <td style="width: 160px;height: 80px;" class=""><a href="single.html"><img src="images/product/${sp.idLoai}/${sp.IDSP}/${sp.hinhSP}" alt=" " class="img-responsive"></a></td>
                                        <td class="invert">
                                            <div class="quantity">
                                                <div class="quantity-select">

                                                    <div onclick="downFunction('${sp.IDSP}');" class="entry value-minus">&nbsp;</div>
                                                    <input id="${sp.IDSP}" style="width: 40px;height: 40px;text-align: center;" type="text" value="${sp.soluong}" />
                                                    <div onclick="upFunction('${sp.IDSP}');" class="entry value-plus active">&nbsp;</div>
                                                    <c:if test="${IDSP==idsp}">
                                                        <br />
                                                        ${stock}
                                                    </c:if>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="invert">${sp.tenSP}</td>

                                        <td class="invert">$${sp.giaSP}</td>

                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="checkout-left">
                        <div class="col-md-4 checkout-left-basket">
                            <h4><a href="Home/pageShop.htm?code=1@all">Continue to basket</a></h4>
                            <ul>
                                <c:forEach var="sp" items="${listcart}" varStatus="s">
                                    <li style="font-weight: bold;">Product ${sp.IDSP} <i>-</i> <span>$${sp.giaSP} </span></li>
                                    </c:forEach>

                                <li>Total <i>-</i> <span>${tongtien}</span></li>
                            </ul>
                        </div>
                        <div class="col-md-8 address_form">
                            <h4>Add a new Details</h4>
                            <form action="Home/payment.htm" method="get" class="creditly-card-form agileinfo_form">
                                <section class="creditly-wrapper wrapper">
                                    <div class="information-wrapper">
                                        <div class="first-row form-group">
                                            <div class="controls">
                                                <label class="control-label">Full name: </label>
                                                <input class="billing-address-name form-control" type="text" name="TenKH" placeholder="Full name">
                                            </div>
                                            <div class="card_number_grids">
                                                <div class="card_number_grid_left">
                                                    <div class="controls">
                                                        <label class="control-label">Mobile number:</label>
                                                        <input name="SDT" class="form-control" type="text" placeholder="Mobile number">
                                                    </div>
                                                </div>
                                                <div class="card_number_grid_right">
                                                    <div class="controls">
                                                        <label class="control-label">Address: </label>
                                                        <input name="diaChi" class="form-control" type="text" placeholder="Address">
                                                    </div>
                                                </div>
                                                <div class="clear"> </div>
                                            </div>
                                            <div class="controls">
                                                <label class="control-label">Town/City: </label>
                                                <input class="form-control" type="text" placeholder="Town/City">
                                            </div>
                                            <div class="controls">
                                                <label class="control-label">Email: </label>
                                                <input name="Email" class="form-control" type="text" placeholder="Email">
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </form>
                            <div class="checkout-right-basket">
                                <a href="Home/redirectPage.htm?page=payment"> ORDER</a>
                            </div>
                            <div class="checkout-right-basket">
                                <a href="#">COD </a>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/inc/footerpage.jsp" %>
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
        <!--search-bar-->
        <script src="js/search.js"></script>
        <!--//search-bar-->
        <!--quantity-->
        <script>
                                                        $('.value-plus').on('click', function () {
                                                            var divUpd = $(this).parent().find('.value'),
                                                                    newVal = parseInt(divUpd.text(), 10) + 1;
                                                            divUpd.text(newVal);
                                                        });

                                                        $('.value-minus').on('click', function () {
                                                            var divUpd = $(this).parent().find('.value'),
                                                                    newVal = parseInt(divUpd.text(), 10) - 1;
                                                            if (newVal >= 1)
                                                                divUpd.text(newVal);
                                                        });
        </script>
        <!--quantity-->
        <script>
            $(document).ready(function (c) {
                $('.close1').on('click', function (c) {
                    $('.rem1').fadeOut('slow', function (c) {
                        $('.rem1').remove();
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function (c) {
                $('.close2').on('click', function (c) {
                    $('.rem2').fadeOut('slow', function (c) {
                        $('.rem2').remove();
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function (c) {
                $('.close3').on('click', function (c) {
                    $('.rem3').fadeOut('slow', function (c) {
                        $('.rem3').remove();
                    });
                });
            });
        </script>

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

        <!--Xu ly so luong-->
        <script>

            function downFunction(id) {

                var quantity = document.getElementById('' + id + '').value;
                if (quantity > 1) {
                    quantity--;
                    document.getElementById('' + id + '').value = quantity;
                    $.post('Home/getGioHang.htm', {'id': id, 'sl': quantity, 'ck': "all"}, function (data) {
                        console.log(id);
                        $('body').html(data);
                    });

                } else {

                    document.getElementById('check-' + id + '').setAttribute("style", "display:none");
                    $.post('Home/getGioHang.htm', {'id': id, 'sl': -1, 'ck': "all"}, function (data) {
                        $('body').html(data);
                    });
                }

            }
            function upFunction(id) {
                var quantity = document.getElementById('' + id + '').value;

                quantity++;
                console.log(quantity);
                document.getElementById('' + id + '').value = quantity;
                $.post('Home/getGioHang.htm', {'id': id, 'sl': quantity, 'ck': "all"}, function (data) {
                    console.log(id);
                    $('body').html(data);

                });


            }


        </script>
        <script></script>
    </body>

</html>