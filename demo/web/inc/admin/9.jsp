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
            <h2 class="custom-head mg-l-20 tx-al-l"><a target="_blank" href="Home/pageSingle.htm?code=${idsp}">${idsp}</a> Storage Management</h2>
            <div class="col-md-5 tx-al-c">
                <image src="${img}" width="300" style="border-radius: 5px" />
            </div>
            <div class="col-md-7">
                <div class="button-group col-md-12 tx-al-r">
                    <div class="col-md-6 col-sm-6 tx-al-l mg-b-10">
                        <label class="edit-label">Size: </label>
                        <input onclick="clearText()" class="numberfield" id="sizeNew" maxlength="2" pattern="([0-9]|[0-9]|[0-9])" type="text" value=""/>
                    </div>
                    <div class="col-md-6 col-sm-6 tx-al-l mg-b-10">
                        <label class="edit-label">Quantity: </label>
                        <input id="slNew" maxlength="3" class="numberfield" pattern="([0-9]|[0-9]|[0-9])" type="text" value=""/>
                        
                    </div>
                    <div class="col-md-12 tx-al-r">
                                                                <span style="color:red;font-style: italic;" id="showError"></span>
                    </div>
                    <div class="col-md-12 tx-al-r">
                                            <button onclick="getDataToInsert('${stt}', '${idsp}')" type="button" class="mg-r-5 btn btn-icon btn-addnew">Add New</button>
                    </div>
                    <div class="bill-table col-md-12 mg-t-10">
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
                                                <td><input id="sl" type="text" name="Quantity" class="numberfield" maxlength="3" pattern="([0-9]|[0-9]|[0-9])" value="${sl1}" /></td>
                                                <td><button onclick="getDataToEdit('${stt}', '${idsp}')" type="button" class="icon icon-save" ></button></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
            <script>
                                                    $("#sl").keyup(function () {
                                                        $("#sl").val(this.value.match(/[0-9]*/));
                                                    });
                                                    $("#slNew").keyup(function () {
                                                        $("#slNew").val(this.value.match(/[0-9]*/));
                                                    });
                                                    $("#sizeNew").keyup(function () {
                                                        $("#sizeNew").val(this.value.match(/[0-9]*/));
                                                    });
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
                                                    function getDataToInsert(stt, id) {
                                                        var dem = 0;
                                                        var sizeNew = document.getElementById('sizeNew').value;
                                                        var slNew = document.getElementById('slNew').value;
                                                        var chSize = document.getElementById('chSize').value.split(";");
                                                        var chSL = document.getElementById('chSL').value.split(";");
                                                        if(sizeNew === "" && slNew === ""){
                                                            document.getElementById('showError').innerHTML = "Please, Insert Size and Quantity!";
                                                        }
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
                                                        }
                                                        else {
                                                            document.getElementById('showError').innerHTML = "This size already exists!";
                                                        }
                                                        
                                                    }
                                                    function clearText() {
                                                        document.getElementById('showError').innerHTML = "";
                                                    }
            </script>
    </body>
</html>
