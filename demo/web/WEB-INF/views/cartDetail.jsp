<%-- 
    Document   : cartDetail
    Created on : Jun 15, 2018, 1:44:43 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid">

    <span class="box-cart">
        <c:forEach var="sp" items="${listcart}">
            <div style="border-bottom: 1px solid black;" class="fluid-container">
                <div class="row product-cart">
                    <div class="col-md-3"><img style="width: 80px;height: 80px;" src="images/product/${sp.idLoai}/${sp.IDSP}/${sp.hinhSP}" /></div>
                    <div style="text-align: left;" class="col-md-5">${sp.tenSP}</div>
                    <div class="col-md-2">x${sp.soluong}</div>
                    <div class="col-md-2">$${sp.giaSP}</div>

                </div>

            </div>
        </c:forEach>
        <div class="fluid-container">
            <div class="row">
                <div style="font-weight: bold;text-align: left;" class="col-md-6 f-20">Subtotal</div>
                <div style="font-weight: bold;text-align: right;" class="col-md-6 f-20">$${tongtien}</div>
            </div>
        </div>

        <div class="fluid-container">
            <div class="row">

                <div style="cursor: pointer; font-weight: bold;text-align: center;text-transform: uppercase;font-size: 18px;color: #eb694b;" class="col-md-12">Checkout</div>
            </div>
        </div>
    </span>

</div>
