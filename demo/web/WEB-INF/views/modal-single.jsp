<%-- 
    Document   : modal-single
    Created on : May 21, 2018, 10:16:43 PM
    Author     : Visible
--%>
<style>
    .flex-control-thumbs{
        margin-left: 14px;
    }
</style>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <div class="row">
        <c:forEach var="sp" items="${listsp}">
            <div class="col-md-6 single-right-left ">
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
            <div class="col-md-6 single-right-left simpleCart_shelfItem">
                <h3 style="margin:10px 0;">${sp.tenSP}</h3>
                <p><span style="color: #eb694b;" class="item_price">$${sp.giaSP}</span>
                    <del style="font-size: 28px;">${sp.giaSPKM}</del>
                </p>
                <p style="color: #eb694b;font-size: 16px;font-weight: 600;">${sp.saveMoney}</p>
<!--                <div class="color-quality">
                    <div class="color-quality-right">
                        <h5 style="font-weight: bold;">Size:</h5>
                        <select id="country1" onchange="change_country(this.value)" class="frm-field required sect">
                            <option value="null">36</option>
                            <option value="null">37</option> 						
                        </select>
                    </div>
                </div>-->
<!--                <h5 style="margin-top: 20px;font-weight: bold;">QTY</h5>
                <div style="margin-top: 14px;margin-left: 0;" class="row">
                    <div class="product-quantity col-md-6">
                        <span onclick="minusFunction();" id="minus" class="product-minus"><i class="fa fa-minus"></i></span>
                        <input type="number" min="1" size="2" class="quantity" name="quantity" id="quantity" value="1" max="30">
                        <span onclick="plusFunction()" id="plus" class="product-plus"><i class="fa fa-plus"></i></span>


                    </div>

                    <div class="occasion-cart col-md-6">
                        <div class="shoe single-item single_page_b">
                            <form action="#" method="post">
                                <input type="hidden" name="cmd" value="_cart">
                                <input type="hidden" name="add" value="1">
                                <input type="hidden" name="shoe_item" value="Chikku Loafers">
                                <input type="hidden" name="amount" value="405.00">
                                <input style="margin-top: 2px;" type="submit" name="submit" value="Add to cart" class="button add">

                                <a href="#" data-toggle="modal" data-target="#myModal1"></a>
                            </form>

                        </div>

                    </div>
                    <span id="outofquantity" style="color: red;font-style: italic"></span>
                </div>-->
                <div class="description-cart">
                    <p>${sp.moTa}</p>
                </div>
                <a href="Home/pageSingle.htm?code=${sp.IDSP}" style="display: block;text-decoration: none;color: #eb694b; padding: 16px 30px;text-transform: uppercase; text-align: center;font-size: 18px;font-weight: bold;border-top:1px solid #cccccc; border-bottom: 1px solid #cccccc;">View full details</a>
            </div>
        </c:forEach>
    </div>
</div>


<!-- //top products -->


