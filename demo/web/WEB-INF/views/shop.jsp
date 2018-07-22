<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Shop Z4 Sneakers</title>
        <style>
            #listChoice li{
                cursor: pointer;
                margin:6px 0;
            }
            #listChoice li a{
                color: black;
                text-decoration: none;
            }
            #listChoice li a:hover{
                color: #fa5400;
            }
        </style>
        <%@include file="/inc/lib.jsp" %>
    </head>

    <body>

        <%@include file="/inc/toppage.jsp" %>
        <!-- top Products -->
        <div class="ads-grid_shop">
            <div class="shop_inner_inf">
                <!-- tittle heading -->

                <!-- //tittle heading -->
                <!-- product left -->
                <div class="side-bar col-md-3">
                    <div class="search-hotel">
                        <h3 class="agileits-sear-head">Search Here..</h3>
                        <form action="<%=request.getContextPath()%>/Home/pageShop.htm" method="get">
                            <input type="search" placeholder="Product name..." name="tenSP" required="">

                            <input type="submit" value=" ">
                        </form>

                    </div>
                    <!-- price range -->
                    <%
                        int i = 0;
                        String type = "all";
                        String code = request.getParameter("code");
                        if (code != null) {
                            String[] s = code.split("@");
//                        String type = request.getAttribute("type").toString();
                            type = s[1];
                        }
                    %>
                    <div class="range">
                        <h3 class="agileits-sear-head">Price range</h3>
                        <ul class="dropdown-menu6">
                            <li>

                                <div id="slider-range"></div>
                                <input type="text" id="amount" style="border: 0; color: #ffffff; font-weight: normal;" />
                            </li>
                        </ul>
                        <div class="left-side">
                            <h3 class="agileits-sear-head">Brand</h3>
                            <ul>

                                <c:forEach var="t" items="${listLoai}">
                                    <li>
                                        <input onclick="getPageNumber(1, '${t.IDLoai}')" value="${t.IDLoai}" type="radio" name="radio-group" ${t.checked} >
                                        <span class="span">${t.tenLoai}</span>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>

                    </div>

                    <!-- //price range -->

                    <!-- deals -->
                    <div class="deal-leftmk left-side">
                        <h3 class="agileits-sear-head">Special Deals</h3>
                        <c:forEach var="sp" items="${listtopsp}">
                            <div class="special-sec1">
                                <div class="col-xs-4 img-deals">
                                    <img src="images/product/${sp.IDLoai}/${sp.IDSP}/${sp.hinhSP}" alt="">
                                </div>
                                <div style="margin:2px 0;" class="col-xs-8 img-deal1">
                                    <h3><a href="Home/pageSingle.htm?code=${sp.IDSP}">${sp.tenSP}</a></h3>
                                    <a href="Home/pageSingle.htm?code=${sp.IDSP}">$${sp.giaSP}</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- //deals -->

                </div>
                <!-- //product left -->
                <!-- product right -->
                <div class="left-ads-display col-md-9">
                    <div class="wrapper_top_shop">
                        <div style="margin-bottom: 20px;float: left;">Page

                            <c:forEach var="p" items="${listPage}">

                                <%  String chuoi = request.getAttribute("idPage").toString();
                                    int idPage = Integer.parseInt(chuoi);
                                    request.setAttribute("id", idPage);
                                    int dem = 0;
                                    i++;
                                    if ((idPage - i) == 0) {
                                        dem = 1;

                                %>
                                <style>
                                    #pageNumber<%= idPage%>{
                                        font-weight: 400;
                                        background: #189eff;
                                        color: #fff; 
                                    }
                                </style>
                                <%
                                    }
                                %>

                                <a onclick="getPageNumber(${p.pageNumber}, '<%=type%>')" id="pageNumber<%=i%>" class="page-number ">${p.pageNumber}</a>
                            </c:forEach>
                        </div>
                        <%
                            String id = request.getAttribute("id").toString();
                        %>
                        <div style="float: right;">
                            <div onclick="showChoice()" class="sort" style="z-index: 100;position: relative;width: 200px;height: 40px;float: right;border: 1px solid #E5E5E5;margin-right: 15px;">
                                <span style="font-weight: bold;margin:8px 14px;display: inline-block">SORT BY: </span>
                                <span style="position: absolute;top: 6px;right: 10px; "><i class="fa fa-chevron-down"></i></span>
                                <ul id="listChoice" style="display: none;">
                                    <li><a href="Home/pageShop.htm?code=<%=id%>@<%=type%>@asc">Price: $-$$</a></li>
                                    <li><a href="Home/pageShop.htm?code=<%=id%>@<%=type%>@desc">Price: $$-$</a></li>
                                </ul>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <!-- product-sec1 -->
                        <div class="product-sec1">
                            <!-- product -->
                            <%----%>
                            <c:forEach var="sp" items="${listsp}">

                                <div class="col-md-4 product-men">
                                    <div class="product-shoe-info shoe">

                                        <div class="men-pro-item">
                                            <div class="men-thumb-item">
                                                <img class="anhchinh" src="images/product/${sp.IDLoai}/${sp.IDSP}/${sp.hinhSP}" alt="">
                                                <img class="anhphu" src="images/product/${sp.IDLoai}/${sp.IDSP}/${sp.hinhPhu}" alt="">
                                                <div class="men-cart-pro">
                                                    <div class="inner-men-cart-pro">
                                                        <button onclick="viewDetail('${sp.IDSP}')" data-toggle="modal" data-target="#modal-cart" class="link-product-add-cart">Quick View</button>
                                                    </div>
                                                </div>
                                                <span class="product-new-top">New</span>
                                            </div>
                                            <div class="item-info-product">
                                                <p class="name-product">
                                                    <a href="Home/pageSingle.htm?code=${sp.IDSP}">${sp.tenSP}</a>
                                                </p>
                                                <div class="info-product-price">
                                                    <div class="grid_meta">
                                                        <div class="product_price">
                                                            <div class="grid-price ">
                                                                <span style="color: #eb694b;" class="money ">$${sp.giaSP}</span>
                                                                <del style="font-size: 16px;margin-left: 5px;" class="money">${sp.giaSPKM}</del>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="shoe single-item hvr-outline-out">
                                                        <form action="" method="get">
                                                            <input type="hidden" name="idsp" value="${sp.IDSP}">
                                                            <input type="hidden" name="giasp" value="${sp.giaSP}">
                                                            <input type="hidden" name="shoe_item" value="Bank Sneakers">
                                                            <input type="hidden" name="amount" value="635.00">
                                                        </form>
<!--                                                        <button data-toggle="modal" data-target="#modal-cart" onclick="getGioHang('${sp.IDSP}');" class="shoe-cart pshoe-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i></button>-->
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
                            <!-- //product -->
                            <div class="clearfix"></div>
                        </div>

                        <!-- //product-sec1 -->
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <!-- //top products -->
        <!-- footer -->
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
        <!-- price range (top products) -->
        <script src="js/jquery-ui.js"></script>
        <script>
                                                            //<![CDATA[ 
                                                            $(window).load(function () {
                                                                $("#slider-range").slider({
                                                                    range: true,
                                                                    min: 70,
                                                                    max: 600,
                                                                    values: [70, 600],
                                                                    slide: function (event, ui) {
                                                                        console.log($("#amount").val(ui.values[0]));
                                                                        $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                                                                    }
                                                                });

                                                                $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

                                                            }); //]]>
        </script>
        <!-- //price range (top products) -->

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
            //Lay du lieu pageNumber de phan trang
            function getPageNumber(id, type) {
                window.location.href = "Home/pageShop.htm?code=" + id + "@" + type;

            }
            //Lay du lieu loc ra theo LoaiSP
            function getLoai(type) {
                window.location.href = "Home/filterOfLoaiSP.htm?id=" + id + "&type=" + type;

            }
        </script>
        <script>
            var i = 0;
            function showChoice() {
                i++;
                if (i > 1) {
                    document.getElementById('listChoice').setAttribute("style", "display:none");
                    i = 0;
                } else {
                    document.getElementById('listChoice').setAttribute("style", "display:block;margin: 3px 9px;background-color: white;line-height: 20px;width: 190px;list-style: none; padding: 14px 15px;border: 1px solid #E5E5E5;border-top:0;font-size: 13px;");
                }
            }
        </script>
        <script>

            function getGioHang(id) {
             
                $.post('Home/getGioHang.htm', {'id': id}, function (data) {
//                    location.reload(true);
                    $('#modal-cart').on('hidden.bs.modal', function () {
                        location.reload();
                        
                    });
                    $(".modal-body").html(data);

                });
            }
        </script>
    </body>

</html>