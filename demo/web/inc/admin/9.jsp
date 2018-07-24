<%-- 
    Document   : productDetail
    Created on : Jul 6, 2018, 10:07:17 AM
    Author     : ASUS
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <base href="${pageContext.servletContext.contextPath}/" />
        <title>Storage Manage Page</title>
    </head>
    <body>
        <div class="content-bill row no-margin">

            <div class="col-md-5 tx-al-c">
                <h1 class="mg-b-20"><a target="_blank" href="Home/pageSingle.htm?code=${idsp}">${idsp}</a></h1>
                <image src="${img}" width="300" />
            </div>
            <div class="col-md-7">
                <div class="button-group col-md-12 tx-al-r" >
                    <div style="float:left;">
                        <label>Size: </label><input onclick="clearText()" id="sizeNew" type="text" value="" placeHolder="Input size"/>
                        <label>Quantity: </label><input id="slNew" type="number" value="" /><br />
                        <span style="color:red;font-style: italic;" id="showError"></span>
                    </div>
                    <div>
                        <button onclick="getDataToInsert('${stt}','${idsp}')" type="button" class="mg-r-5 btn btn-add">Add New</button>
                    </div>
                </div>
                <div class="bill-table col-md-12">
                    <div class="row mg-t-10">
                        <div class="col-md-12">
                            <div class="white-box">
                                <div class="table-responsive">
                                    <form id="formKho" action="" method="post">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Size</th>
                                                    <th>Quantity</th>
                                                    <th>Save</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <tr>
                                                    <td>${st.index+1}</td>
                                                    <td>
                                                        <input type="hidden" id="idsp" value="${idsp}" />
                                                        <input id="chSize" type="hidden" value="${chSize}" />
                                                        <input id="chSL" type="hidden" value="${chSL}" />
                                                        <select id="selectValue" onchange="getValue()">
                                                            <c:forEach var="kho" items="${listKho}" varStatus="st">
                                                                <option id="size-${st.index}"  value="${kho.size}">${kho.size}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td><input id="sl" type="number" name="Quantity" value="${sl1}" /></td>
                                                    <td><button onclick="getDataToEdit('${stt}', '${idsp}')" type="button" class="btn btn-save" >Save</button></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <script>
                                                        function getValue() {
//                                                                alert("Hello");
                                                            var value = document.getElementById('selectValue').value;
                                                            var chSize = document.getElementById('chSize').value;
                                                            var chSL = document.getElementById('chSL').value;
                                                            var size = chSize.split(";");
                                                            var sl = chSL.split(";");
                                                            for (var i = 0; i < chSize.length; i++) {
                                                                if (value === size[i]) {
                                                                    document.getElementById('sl').value = sl[i];
//                                                                        alert(sl[i]);
                                                                }
                                                            }
//                                                                alert(chSL);
//                                                                alert(value);
//                                                                alert(ch);
                                                        }
                                                        function getDataToEdit(stt, id) {
                                                            var value = document.getElementById('selectValue').value;
                                                            var sl = document.getElementById('sl').value;
                                                            alert(value + sl + stt + id);
                                                            $.post("admin/getDataToEdit.htm", {'size': value, 'sl': sl, 'stt': stt, 'id': id}, function (data) {
                                                                $('body').html(data);
                                                            });
                                                        }
                                                        function getDataToInsert(stt,id) {
                                                            var dem = 0;
                                                            var sizeNew = document.getElementById('sizeNew').value;
                                                            var slNew = document.getElementById('slNew').value;
                                                            var chSize = document.getElementById('chSize').value.split(";");
                                                            var chSL = document.getElementById('chSL').value.split(";");
                                                            for (var i = 0; i < chSize.length; i++) {
                                                                if (chSize[i] === sizeNew) {
                                                                    dem = 1;
                                                                    break;
                                                                }
                                                            }
                                                            if (dem == 0) {
                                                                sizeNew = document.getElementById('chSize').value + ";" + sizeNew;
                                                                slNew = document.getElementById('chSL').value + slNew + ";";
                                                                alert(sizeNew + slNew);
                                                                $.post("admin/getDataToInsert.htm", {'sizeNew': sizeNew, 'slNew': slNew, 'stt': stt, 'id': id}, function (data) {
                                                                    $('body').html(data);
                                                                });
                                                            } else {
                                                                document.getElementById('showError').innerHTML = "Size exist!";
                                                            }
                                                        }
                                                        function clearText() {
                                                            document.getElementById('showError').innerHTML = "";
                                                        }
        </script>
    </body>
</html>
