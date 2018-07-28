
<%@page pageEncoding="UTF-8" %>
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
                                    <th>Size</th>
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
                                        <td>${sp.size}</td>
                                        <td class="invert">
                                            <div class="quantity">
                                                <div class="quantity-select">
                                                    <input type="hidden" id="sz-${sp.size}" value="${sp.size}" />
                                                    <div onclick="downFunction('${sp.IDSP}', '${sp.size}');" class="entry value-minus">&nbsp;</div>
                                                    <input id="${sp.IDSP}-${sp.size}" style="width: 40px;height: 40px;text-align: center;" type="text" value="${sp.soluong}" />
                                                    <div onclick="upFunction('${sp.IDSP}', '${sp.size}');" class="entry value-plus active">&nbsp;</div>
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
                            <form id="formCheckout" action="" class="creditly-card-form agileinfo_form">
                                <section class="creditly-wrapper wrapper">
                                    <div class="information-wrapper">
                                        <div class="first-row form-group">
                                            <input id="dem" type="hidden" name="dem" value="false" />
                                            <div class="controls">
                                                <label class="control-label">Full name: <span id="checkname" style="display: none;">Please,Enter your Full name!</span></label>
                                                <input id="fullname" class="billing-address-name form-control" type="text" name="TenKH" placeholder="Full name: Dimitri Vegas">
                                            </div>
                                            <div class="card_number_grids">
                                                <div class="card_number_grid_left">
                                                    <div class="controls">
                                                        <label class="control-label">Mobile number: 
                                                            <span  id="checkphone" style="display: none;">Please,Enter your Phone!</span>
                                                            <span  id="checkphonewrong" style="display: none;">Phone have 10 - 11 digit! Ex: 09x.xxx.xxxx, 08x.xxx.xxxx, 01x.xxx.xxx.xx </span>
                                                        </label>
                                                        <input id="phone" name="SDT" class="form-control" type="text" maxlength="14" minlength="10"  placeholder="Mobile number Ex: 09x.xxx.xxxx, 08x.xxx.xxxx, 01x.xxx.xxx.xx">
                                                    </div>
                                                </div>
                                                <div class="card_number_grid_right">
                                                    <div class="controls">
                                                        <label class="control-label">Address: <span id="checkad" style="display:none;">Please,Enter your Address!</span></label>
                                                        <input id="address" name="diaChi" class="form-control" type="text" maxlength="200" placeholder="Address: 123 Avenue ">
                                                    </div>
                                                </div>
                                                <div class="clear"> </div>
                                            </div>
                                            <div class="controls">
                                                <label class="control-label">Email: <span id="checkemail" style="display:none;">Invalid email! - Example@gmail.com</span></label>
                                                <input name="Email" id="email" class="form-control" type="email" placeholder="Email: Example@gmail.com"/>
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                <div class="tx-al-r mg-b-20">
                                    <input data-toggle="modal" data-target="#modal-checkout" type="button" id="ordersneaker" class="btn btn-order" onclick="checkout()" disabled value="Order" />
                                </div>
                            </form>
                            <!-- The Modal -->
                            <div id="modal-checkout" class="modal" tabindex="-1" role="dialog">

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
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <%@include file="/inc/footerpage.jsp" %>
        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!-- //js -->
        <!-- cart-js -->
        <script src="js/minicart.js"></script>
        <script>
//            bat loi email
                                        $("#email").focusout(function () {
                                            var email = document.getElementById('email');
                                            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                                            if (!filter.test(email.value)) {
                                                document.getElementById('checkemail').style = 'display:visible; color:red;font-size:12px';
                                                email.focus;
                                                return false;
                                            } else
                                            {
                                                document.getElementById('checkemail').style = 'display:none';
                                            }
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
                                                    $('#phone').focus();
                                                    document.getElementById('checkphonewrong').style = 'display:visible; color:red;font-size:12px';
                                                    document.getElementById('checkphone').style = 'display:none';
                                                }
                                            }
                                        });


                                        //                   bat loi ko cho nhap so

                                        $("#fullname").keyup(function () {
                                            $("#fullname").val(this.value.match(/[a-zA-Z_ ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]*/));

                                        });
                                        //                   bat loi khong nhap du 3 dieu kien
                                        var a = 0;
                                        var b = 0;
                                        var c = 0;
                                        var d = 0;


                                        $('#fullname').blur(function () {
                                            if ($('#fullname').val().trim() === '') {
                                                document.getElementById('checkname').style = 'display:visible; color:red;font-size:12px';
                                                a = 0;
                                                document.getElementById('ordersneaker').disabled = true;
                                            } else {
                                                a = 1;
                                                document.getElementById('checkname').style = 'display:none';
                                                d = a + b + c;
                                                if (d >= 3) {
                                                    document.getElementById('ordersneaker').disabled = false;
                                                }
                                            }

                                        });
                                        $('#phone').blur(function () {
                                            if ($('#phone').val().trim() === '') {
                                                document.getElementById('checkphone').style = 'display:visible;color:red;font-size:12px';
                                                document.getElementById('ordersneaker').disabled = true;
                                                b = 0;
                                            } else {
                                                b = 1;
                                                document.getElementById('checkphone').style = 'display:none';
                                                d = a + b + c;
                                                if (d >= 3) {
                                                    document.getElementById('ordersneaker').disabled = false;
                                                }
                                            }
                                        });
                                        $('#address').blur(function () {
                                            if ($('#address').val().trim() === '') {
                                                document.getElementById('checkad').style = 'display:visible;color:red;font-size:12px';
                                                document.getElementById('ordersneaker').disabled = true;
                                                c = 0;
                                            } else {
                                                c = 1;
                                                document.getElementById('checkad').style = 'display:none';
                                                d = a + b + c;
                                                if (d >= 3) {
                                                    document.getElementById('ordersneaker').disabled = false;
                                                }
                                            }
                                        });


                                        shoe.render();

                                        shoe.cart.on('shoe_checkout', function (evt) {
                                            var items, len, i;
                                            if (this.subtotal() > 0) {
                                                items = this.items();
                                                for (i = 0, len = items.length; i < len; i++) {
                                                }
                                            }
                                        });</script>
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
                                        });</script>
        <!--quantity-->
        <script>
            $(document).ready(function (c) {
                $('.close1').on('click', function (c) {
                    $('.rem1').fadeOut('slow', function (c) {
                        $('.rem1').remove();
                    });
                });
            });</script>
        <script>
            $(document).ready(function (c) {
                $('.close2').on('click', function (c) {
                    $('.rem2').fadeOut('slow', function (c) {
                        $('.rem2').remove();
                    });
                });
            });</script>
        <script>
            $(document).ready(function (c) {
                $('.close3').on('click', function (c) {
                    $('.rem3').fadeOut('slow', function (c) {
                        $('.rem3').remove();
                    });
                });
            });</script>

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
            });</script>
        <!-- //end-smoth-scrolling -->
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

        <!--Xu ly so luong-->
        <script>

            function downFunction(id, sz) {

                var quantity = document.getElementById('' + id + '-' + sz).value;
                var size = sz;
                alert(size + quantity);
                if (quantity > 1) {
                    quantity--;
                    document.getElementById('' + id + '-' + sz).value = quantity;
                    $.post('Home/getGioHang.htm', {'id': id, 'sl': quantity, 'ck': "all", 'size': size}, function (data) {
                        console.log(id);
                        $('body').html(data);
                    });

                } else {

                    document.getElementById('check-' + id + '').setAttribute("style", "display:none");
                    $.post('Home/getGioHang.htm', {'id': id, 'sl': -1, 'ck': "all", "size": size}, function (data) {
                        $('body').html(data);
                    });
                }

            }
            function upFunction(id, sz) {
                var quantity = document.getElementById('' + id + '-' + sz).value;
                var size = sz;
                //                alert(size + quantity);
                quantity++;
                console.log(quantity);
                document.getElementById('' + id + '-' + sz).value = quantity;
                $.post('Home/getGioHang.htm', {'id': id, 'sl': quantity, 'ck': "all", "size": size}, function (data) {
                    console.log(id);
                    $('body').html(data);
                });

            }
        </script>
        <script>
            function checkout() {
                $.post("Home/payment.htm", $('#formCheckout').serialize(), function (data) {
                    $('.modal-body').html(data);
                });
            }
        </script>
    </body>

</html>