<%-- 
    Document   : cartDetail
    Created on : Jun 15, 2018, 1:44:43 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    #up{
        position: absolute;
        top: 10px;
        background: url(images/up.png) no-repeat -8px -10px;
        width: 15px;
        height: 12px;
        display: inline-block;
    }
    #down{
        position: absolute;
        top: 20px;
        background: url(images/down.png) no-repeat -8px -10px;
        width: 15px;
        height: 12px;
        display: inline-block;
    }
</style>
<div class="container-fluid">
    <%

        String idsp = String.valueOf(request.getAttribute("idsp"));
    %>
    <span class="box-cart">

        <c:forEach var="sp" items="${listcart}">


            <div id="box-${sp.IDSP}" style="border-bottom: 1px solid black;" class="fluid-container">
                <c:set var="IDSP" value="${sp.IDSP}"></c:set>
                <c:set var="ID" value="<%=idsp%>"></c:set>
<!--                <span><c:out value="${IDSP}"></c:out></span> -->
                    <div class="row">
                        <div class="col-md-2"><img style="width: 80px;height: 80px;" src="images/product/${sp.idLoai}/${sp.IDSP}/${sp.hinhSP}" /></div>
                    <div style="text-align: left;" class="col-md-4">${sp.tenSP}</div>
                    <div style="position: relative;" class="col-md-4">
                        <input name="ID" type="hidden" value="${sp.IDSP}" />
                        <input id="${sp.IDSP}" style="width: 40px;height: 40px;text-align: center;" type="text" value="${sp.soluong}" />
                        <a id="up" onclick="upFunction('${sp.IDSP}');" ></a>
                        <a id="down" onclick="downFunction('${sp.IDSP}');" ></a>
                        <c:if test="${IDSP==idsp}">
                            <br />
                            ${stock}
                        </c:if>

                        <!--<input style="color: red;font-style: italic;" type="text" value="Bạn không được mua quá 5 sản phẩm!" />-->

                    </div>

                    <div class="col-md-2">$${sp.giaSP}</div>

                </div>

            </div>
        </c:forEach>
        <div class="fluid-container">
            <div class="row">

                <div style="font-weight: bold;text-align: left;" class="col-md-6 f-20">Subtotal</div>
                <div id="tongtien" style="font-weight: bold;text-align: right;" class="col-md-6 f-20">$${tongtien}</div>

            </div>
        </div>

        <div class="fluid-container">
            <div class="row">
                <div onclick="checkout();" style="cursor: pointer; font-weight: bold;text-align: center;text-transform: uppercase;font-size: 18px;color: #eb694b;" class="col-md-12">Checkout</div>
            </div>
        </div>
    </span>
    <!--Xu ly so luong-->
    <script>


        function downFunction(id) {

            var quantity = document.getElementById('' + id + '').value;
            if (quantity > 1) {
                quantity--;
                document.getElementById('' + id + '').value = quantity;
                $.post('Home/getGioHang.htm', {'id': id, 'sl': quantity, 'ck': ck}, function (data) {
                    console.log(id);
                    $(".modal-body").html(data);
                });

            } else {

                document.getElementById('box-' + id + '').setAttribute("style", "display:none");
                $.post('Home/getGioHang.htm', {'id': id, 'sl': -1, 'ck': ck}, function (data) {
                    $(".modal-body").html(data);
                });
            }

        }
        function upFunction(id, giagoc) {
            var quantity = document.getElementById('' + id + '').value;
            var ck=false;
            quantity++;
            console.log(quantity);
            document.getElementById('' + id + '').value = quantity;
            $.post('Home/getGioHang.htm', {'id': id, 'sl': quantity, 'ck': ck}, function (data) {
                console.log(id);
                $(".modal-body").html(data);

            });


        }


    </script>
    <!--Checkout-->
    <script>
        function checkout() {
            var sum=document.getElementById('tongtien').innerHTML;
            window.location = ("Home/getGioHang.htm?ck=all&sum="+sum);
        }
    </script>
</div>
