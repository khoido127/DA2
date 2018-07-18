
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Z4 Shop</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <%@include file="/inc/lib.jsp" %>
        <style>
            .flexslider ol{
                margin-left: 2px;
            }
        </style>
    </head>

    <body> 

        <!-- top Products -->
        <%@include file="/inc/toppage.jsp" %>

        <div class="ads-grid_shop">
            <div class="shop_inner_inf">
                <c:forEach var="sp" items="${listsp}">
                    <div class="col-md-4 single-right-left ">
                        <div class="grid images_3_of_2">
                            <div class="flexslider">

                                <ul class="slides">
                                    <c:forEach var="u" items="${listurl}">
                                        <li data-thumb="images/product/${sp.IDLoai}/${sp.IDSP}/${u.url}">
                                            <div class="thumb-image"> <img src="images/product/${sp.IDLoai}/${sp.IDSP}/${u.url}" data-imagezoom="true" class="img-responsive"> </div>
                                        </li>
                                    </c:forEach>

                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 single-right-left simpleCart_shelfItem">
                        <h3>${sp.tenSP}</h3>
                        <p style="float: left;"><span class="item_price">$${sp.giaSP}</span>
                            <del>${sp.giaSPKM}</del>
                        </p>

                        <div style="clear: both;"></div>
                        <div class="color-quality">
                            <div class="color-quality-right">
                                <h5 style="float: left;">Size:<span style="display: inline-block;margin: 0 12px;" id="choose-size"></span><span id="status" style="color: red; font-size: 14px;display: inline-block;margin-left: 108px;font-style: italic;"></span></h5> 
                                <input type="hidden" id="statusSize" value="F" />
                                <div style="clear: both;"></div>
                                <div id="size" class="row">
                                    <div style="display: flex;" class="col-md-6">
                                        <c:forEach var="kho" items="${listkho}" varStatus="st">
                                            <div class="wrap-size">
                                                <input id="index" type="hidden" value="${sumIndex}" />
                                                <input id="idsp" type="hidden" value="${sp.IDSP}" />
                                                <span id="size-detail-${st.index}" onclick="getSize('${kho.size}',${st.index}, '${kho.trangthai}', '${sp.IDSP}')" class="custom-size">${kho.size}</span>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h5 style="margin-top: 20px;">QTY</h5>
                        <div style="margin-top: 14px;margin-left: 0;" class="row">
                            <div class="product-quantity col-md-4">
                                <span onclick="downFunction('${sp.IDSP}');" id="minus" class="product-minus"><i class="fa fa-minus"></i></span>
                                <input type="number" min="1" size="2" class="quantity" name="quantity" id="sl" value="${soluong}" max="30">
                                <span onclick="upFunction('${sp.IDSP}')" id="plus" class="product-plus"><i class="fa fa-plus"></i></span>
                                <span style="border:0;color: red;font-style: italic;font-size:12px;width:100%; display:block" id="outofstock"></span>
                            </div>

                            <div class="occasion-cart col-md-8">
                                <!--<input type="hidden" id="tongtien" value="${tongtien}" />-->
                                <div class="shoe single-item single_page_b">
                                    <input type="hidden" id="sz" value=""/>

                                    <input onclick="checkout('${sp.IDSP}');" id="add-to-cart" type="button"  value="Add to cart" class="btn btn-add">
                                </div>

                            </div>
                            <span id="outofquantity" style="color: red;font-style: italic"></span>
                        </div>

                        <div class="description-cart">
                            <p style="text-align: justify;">${sp.moTa}</p>
                        </div>
                    </div>

                    <div class="clearfix"> </div>
                    <!--/tabs-->
                    <div class="responsive_tabs">
                        <div id="horizontalTab">
                            <ul class="resp-tabs-list">
                                <li>Description</li>
                                <li>Reviews</li>
                                <li style="display: none">Information</li>
                            </ul>
                            <div class="resp-tabs-container">
                                <!--/tab_one-->
                                <div class="tab1">
                                    <div style="width: 100%" class="single_page">
                                        <c:forEach var="ctsp" items="${listctsp}" varStatus="st">
                                            <c:set var="p" value="${st.index}"></c:set>
                                            <c:choose>
                                                <c:when test="${p%2==0}">
                                                    <div class="row">

                                                        <div class="col-md-6"><img style="width: 600px;height: 540px;" src="images/product/${sp.IDLoai}/${sp.IDSP}/${ctsp.hinhCTSP}" /></div>
                                                        <div class="col-md-6">
                                                            <h3>${ctsp.tieudeCTSP}</h3>
                                                            <p>${ctsp.motaCT}</p>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <h3>${ctsp.tieudeCTSP}</h3>
                                                            <p>${ctsp.motaCT}</p>
                                                        </div>
                                                        <div class="col-md-6"><img style="width: 100%" src="images/product/${sp.IDLoai}/${sp.IDSP}/${ctsp.hinhCTSP}" /></div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!--//tab_one-->
                                <div class="tab2">
                                    <div class="single_page">
                                        <div class="bootstrap-tab-text-grids">
                                            <div class="bootstrap-tab-text-grid">
                                                <div class="bootstrap-tab-text-grid-left">
                                                    <img src="images/t1.jpg" alt=" " class="img-responsive">
                                                </div>
                                                <div class="bootstrap-tab-text-grid-right">
                                                    <ul>
                                                        <li><a href="#">Z4 Team</a></li>
                                                    </ul>
                                                    <p>Being a legionnaire meant walking, crawling, running and climbing, day and night. It wasn't about fighting, but about navigating and surviving in some of the world's most hostile environments.</p>
                                                </div>
                                                <div class="clearfix"> </div>
                                            </div>
                                            <div class="add-review">
                                                <h4>add a review</h4>
                                                <form action="Home/insertComment.htm" method="get">
                                                    <input value="${sp.IDSP}" type="hidden" name="IDSP" />
                                                    <input type="text" name="Name" placeholder="Name" required="Name">
                                                    <input type="email" name="Email" placeholder="Email" required="Email">
                                                    <textarea name="Message" placeholder="Message" required=""></textarea>
                                                    <input type="submit" value="SEND">
                                                </form>
                                                <c:forEach var="c" items="${listcm}">
                                                    <div style="height: 90px;border-bottom: 1px solid #E8E8E8;min-height: 50px;min-width: 100px;margin-top: 20px;margin-bottom: 20px;" class="comment">
                                                        <span style="display: block;float: left; margin-right:10px;margin-top: 6px;padding: 10px 10px;background-color: #F5F5F5; border-radius: 100%;"><img src="images/user.png" /></span>
                                                        <div style="float: left;">
                                                            <p style="font-weight: bold;font-size: 15px;">${c.name}</p>
                                                            <p style="color: gray;">${c.message}</p>
                                                            <p style="color: rgba(0,0,0,0.54);font-size: 12px;">${c.ngayCM}</p>
                                                        </div>
                                                    </div>
                                                    ${c.reply}
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="tab3" style="display:none">
                                <div class="single_page">
                                    <h6>Shoe Rock Vision(SRV) Sneakers (Blue)</h6>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elPellentesque vehicula augue eget nisl ullamcorper, molestie
                                        blandit ipsum auctor. Mauris volutpat augue dolor.Consectetur adipisicing elit, sed do eiusmod tempor incididunt
                                        ut lab ore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco. labore et dolore
                                        magna aliqua.</p>
                                    <p class="para">Lorem ipsum dolor sit amet, consectetur adipisicing elPellentesque vehicula augue eget nisl ullamcorper, molestie
                                        blandit ipsum auctor. Mauris volutpat augue dolor.Consectetur adipisicing elit, sed do eiusmod tempor incididunt
                                        ut lab ore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco. labore et dolore
                                        magna aliqua.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--//tabs-->
                <!-- /new_arrivals -->
                <div class="new_arrivals">
                    <h3>Featured Products</h3>
                    <!-- random 4 product -->
                    <c:forEach var="s" items="${listtopsp}">
                        <div class="col-md-3 product-men women_two">
                            <div class="product-shoe-info shoe">
                                <div class="men-pro-item">
                                    <div class="men-thumb-item">
                                        <img src="images/product/${s.IDLoai}/${s.IDSP}/${s.hinhSP}" alt="">
                                        <div class="men-cart-pro">
                                            <div class="inner-men-cart-pro">
                                                <button onclick="viewDetail('${s.IDSP}')" data-toggle="modal" data-target="#modal-cart" class="link-product-add-cart">Quick View</button>
                                            </div>
                                        </div>
                                        <span class="product-new-top">New</span>
                                    </div>
                                    <div class="item-info-product">
                                        <h4 style="height: 50px;line-height: 24px;">
                                            <a href="Home/pageSingle.htm?code=${s.IDSP}">${s.tenSP} </a>
                                        </h4>
                                        <div class="info-product-price">
                                            <div class="grid_meta">
                                                <div class="product_price">
                                                    <div class="grid-price ">
                                                        <span style="color: #eb694b;" class="money ">$${s.giaSP}</span>
                                                        <del style="font-size: 13px;margin-left: 4px;" class="money">${s.giaSPKM}</del>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="shoe single-item hvr-outline-out">
                                                <form action="#" method="post">
                                                    <input type="hidden" name="cmd" value="_cart">
                                                    <input type="hidden" name="add" value="1">
                                                    <input type="hidden" name="shoe_item" value="Shuberry Heels">
                                                    <input type="hidden" name="amount" value="575.00">
                                                    <button type="submit" class="shoe-cart pshoe-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i></button>
                                                    <a href="#" data-toggle="modal" data-target="#myModal1"></a>
                                                </form>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- The Modal -->
                        <div id="modal-cart" class="modal" tabindex="-1" role="dialog">

                            <div  class="modal-dialog modal-lg" role="document">
                                <div style="border:5px solid #cccccc; border-radius: 0;" class="modal-content">
                                    <div style="border: 0;" class="modal-header">

                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div style="border: 0;" class="modal-footer">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End Modal-->
                    </c:forEach>

                    <!-- //random 4 product -->
                    <div class="clearfix"></div>
                </div>
                <!--//new_arrivals-->

            </div>
        </div>

        <!-- //top products -->

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

        <!--Xu ly so luong-->
        <!--        <script>
        
                    var quantity = document.getElementById('quantity').value;
                    var outofqty = document.getElementById('outofquantity');
                    function minusFunction() {
                        if (quantity > 1) {
                            quantity--;
                            outofqty.innerHTML = "";
                        } else {
                            quantity = 1;
                            outofqty.innerHTML = "";
                        }
        
                        console.log(quantity);
                        document.getElementById('quantity').value = quantity;
        
                    }
                    function plusFunction() {
                        if (quantity < 5) {
                            quantity++;
                            outofqty.innerHTML = "";
                        } else {
                            quantity = 5;
                            outofqty.innerHTML = "Bạn chỉ được mua tối đa 5 sản phẩm!";
                        }
        
                        console.log(quantity);
                        document.getElementById('quantity').value = quantity;
        
                    }
                </script>-->

        <!--Xu ly so luong-->
        <script>

            function downFunction(id) {
                var size = document.getElementById('choose-size').innerHTML;
                var quantity = document.getElementById('sl').value;
                if (quantity > 1) {
                    document.getElementById('add-to-cart').removeAttribute("disabled");
                    document.getElementById('outofstock').innerHTML = "";
                    quantity--;
                    document.getElementById('sl').value = quantity;
                    $.post('Home/getGioHang.htm', {'id': id, 'sl': quantity, 'ck': "single", 'size': size}, function (data) {
                        console.log(id);
//                        $("body").html(data);
                    });
                } else {
                    quantity = 1;
//                    document.getElementById('box-' + id + '').setAttribute("style", "display:none");
                    document.getElementById('sl').value = quantity;
                }

            }
            function upFunction(id, giagoc) {
                var size = document.getElementById('choose-size').innerHTML;
                var quantity = document.getElementById('sl').value;
                quantity++;
                if (quantity > 5) {
                    quantity = 5;
                    document.getElementById('outofstock').innerHTML = "You can't buy more than 5 products! Please, contact us for more information.";
                    document.getElementById('add-to-cart').setAttribute("disabled", "");
                    document.getElementById('sl').value = quantity;
                } else {

                    document.getElementById('sl').value = quantity;
//                    $.post('Home/getGioHang.htm', {'id': id, 'sl': quantity, 'ck': "single", 'size': size}, function (data) {
//                        console.log(id);
////                    $('body').html(data);
//
//                    });
                }

            }


        </script>

        <!--Get Size-->
        <script>
            var st = document.getElementById('statusSize').value;
            if (st === "F") {
                console.log(st);
                document.getElementById('size-detail-' + 0 + '').setAttribute("style", "cursor: pointer;color: #FFC226;");
                document.getElementById('choose-size').innerHTML = document.getElementById('size-detail-' + 0 + '').innerHTML;
                document.getElementById('sz').value = "35";
//                var size = document.getElementById('choose-size').innerHTML;
//                var id = document.getElementById('idsp').value;
            }
            function getSize(size, index, trangthai, id) {
                var sumIndex = document.getElementById('index').value;
                console.log(sumIndex);
                console.log(index);
                for (var i = 0; i < sumIndex; i++) {
                    console.log(i);
                    if (i === index) {
                        console.log(trangthai);
                        document.getElementById('size-detail-' + i + '').setAttribute("style", "cursor: pointer;color: #FFC226;");
                        document.getElementById('status').innerHTML = trangthai;
                        document.getElementById('statusSize').value = "T";
                        document.getElementById('sz').value = size;
                    } else {
                        console.log("null");
                        document.getElementById('size-detail-' + i + '').setAttribute("style", "cursor: pointer;color: white;");

                    }
                }
                console.log(document.getElementById('statusSize').value);
                document.getElementById('choose-size').innerHTML = size;
//                $.post('Home/getGioHang.htm', {'id': id, 'ck': "single", 'size': size, 'st': "1"}, function (data) {
//                    $('body').html(data);
//                });
                console.log(document.getElementById('statusSize').value);
            }
        </script>
        <!--Checkout-->
        <script>

            function checkout(id) {
                var size = document.getElementById('sz').value;
                var sl = document.getElementById('sl').value;
                if (size == null) {
                    size = "35";
                }
                alert(size + sl);
                $.post('Home/getGioHang.htm', {'id': id, 'ck': "all", 'size': size, 'sl': sl}, function (data) {
                    $('body').html(data);
                });
//                window.location = ("Home/getGioHang.htm?ck=all");
            }
        </script>
    </body>

</html>