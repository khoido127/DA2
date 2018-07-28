
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Home Page Z4 Sneakers</title>
        <%@include file="/inc/lib.jsp" %>
    </head>

    <body>
        <!-- banner -->
        <%@include file="/inc/toppage.jsp" %>
        <!-- top Products -->
        <div class="ads-grid_shop">
            <div class="shop_inner_inf">
                <div class="privacy about">
                    <h3>Pay<span>ment</span></h3>
                    <!--/tabs-->
                    <div class="responsive_tabs">
                        <div id="horizontalTab">
                            <ul class="resp-tabs-list">
                                <li>Cash on delivery (COD)</li>
                                <li>Credit/Debit</li>
                            </ul>
                            <div class="resp-tabs-container">
                                <!--/tab_one-->
                                <div class="tab1">
                                    <div class="pay_info">
                                        <div class="vertical_post check_box_agile">
                                            <h5>COD</h5>
                                            <div class="checkbox">
                                                <div class="check_box_one cashon_delivery">
                                                    <label class="anim">
                                                        <input type="checkbox" class="checkbox">
                                                        <span> We also accept Credit/Debit card on delivery. Please Check with the agent.</span> 
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="submit"><span>Submit</span></button>
                                </div>
                                <!--//tab_one-->
                                <div class="tab2">
                                    <div class="pay_info">
                                        <form action="#" method="post" class="creditly-card-form agileinfo_form">
                                            <section class="creditly-wrapper wthree, w3_agileits_wrapper">
                                                <div class="credit-card-wrapper">
                                                    <div class="first-row form-group">
                                                        <div class="controls">
                                                            <label class="control-label">Name on Card</label>
                                                            <input class="billing-address-name form-control" type="text" name="name" placeholder="John Smith">
                                                        </div>
                                                        <div class="w3_agileits_card_number_grids">
                                                            <div class="w3_agileits_card_number_grid_left">
                                                                <div class="controls">
                                                                    <label class="control-label">Card Number</label>
                                                                    <input class="number credit-card-number form-control" type="text" name="number" inputmode="numeric" autocomplete="cc-number"
                                                                           autocompletetype="cc-number" x-autocompletetype="cc-number" placeholder="&#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149;">
                                                                </div>
                                                            </div>
                                                            <div class="w3_agileits_card_number_grid_right">
                                                                <div class="controls">
                                                                    <label class="control-label">CVV</label>
                                                                    <input class="security-code form-control" Â· inputmode="numeric" type="text" name="security-code" placeholder="&#149;&#149;&#149;">
                                                                </div>
                                                            </div>
                                                            <div class="clear"> </div>
                                                        </div>
                                                        <div class="controls">
                                                            <label class="control-label">Expiration Date</label>
                                                            <input class="expiration-month-and-year form-control" type="text" name="expiration-month-and-year" placeholder="MM / YY">
                                                        </div>
                                                    </div>
                                                    <button class="submit"><span>Make a payment </span></button>
                                                </div>
                                            </section>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//tabs-->
                </div>

            </div>
            <!-- //payment -->

            <div class="clearfix"></div>
        </div>
        <!-- //top products -->
        <!-- footer -->
        <%@include file="/inc/footerpage.jsp" %>
        <a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
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
        <!-- easy-responsive-tabs -->
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

        <!-- credit-card -->
        <script type="text/javascript" src="js/creditly.js"></script>
        <link rel="stylesheet" href="css/creditly.css" type="text/css" media="all" />

        <script type="text/javascript">
            $(function () {
                var creditly = Creditly.initialize(
                        '.creditly-wrapper .expiration-month-and-year',
                        '.creditly-wrapper .credit-card-number',
                        '.creditly-wrapper .security-code',
                        '.creditly-wrapper .card-type');

                $(".creditly-card-form .submit").click(function (e) {
                    e.preventDefault();
                    var output = creditly.validate();
                    if (output) {
                        // Your validated credit card output
                        console.log(output);
                    }
                });
            });
        </script>
        <!-- //credit-card -->


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