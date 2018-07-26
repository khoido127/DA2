<%-- 
    Document   : productDetail
    Created on : Jul 6, 2018, 10:07:17 AM
    Author     : ASUS
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Description Page</title>
    </head>
    <body>
        <!--content product description-->

        <div class="row mg-t-10">
            <h2 class="custom-head tx-al-l mg-l-20"><a style="text-decoration: none;" target="_blank" href="Home/pageSingle.htm?code=${idsp}">${idsp}</a> Description Table</h2>
            
            <div class="col-md-12">
                <div class="white-box">
                    <div class="table-responsive">
                        <form id="formEditDescription" action="admin/saveToEditDescription.htm" method="post" enctype="multipart/form-data">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>IMAGE</th>
                                        <th>TITLE</th>
                                        <th>DESCRIPTION</th>
                                        <th>SAVE</th>
                                        <th>DELETE</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="sp" items="${listCTSP}" varStatus="st">
                                        <tr>
                                            <td class="tx-al-c">${st.index+1}</td>
                                            <td>
                                                <img id="anhDaiDien-${st.index+1}" src="${sp.hinhCTSP}"  style="width: 200px; height: 160px; border-radius: 5px">
                                                <input name="fileUpload" multiple accept="image/*" id="uploadImage-${st.index+1}" onchange="getFileUploadDescription(event,${st.index+1})" type="file" class="btn" value="Choose Image"/>
                                            </td>
                                            <td class="tx-al-c">
                                                <textarea id="tieude-${st.index+1}" class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="4" maxlength="100" >${sp.tieudeCTSP}</textarea>
                                            </td>
                                            <td class="tx-al-c">
                                                <textarea id="mota-${st.index+1}" class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="8" maxlength="500">${sp.motaCT}</textarea>
                                            </td>
                                            <td class="tx-al-c">
                                                <input id="sumIndex" type="hidden" name="sumIndex" value="${sumIndex}" />
                                                <input type="hidden" name="idloai" value="${sp.idLoai}" />
                                                <input type="hidden" id="tieude" name="tieude" value="" />
                                                <input type="hidden" id="mota" name="mota" value="" />
                                                <input type="hidden" id="image" name="image" value="" />
                                                <input id="image-${st.index+1}" type="hidden" value="${sp.tenHinh}" />
                                                <!--<input id="tieude-${st.index+1}" type="hidden" name="tieude" value="${sp.tieudeCTSP}" />-->
                                                <input id="id" type="hidden" name="IDSP" value="${sp.IDSP}" />
                                                <input id="vitri" name="vitri" value="${st.index+1}" type="hidden" />
                                                <!--<input id="mota-${st.index+1}" type="hidden" name="mota" value="${sp.motaCT}" />-->
                                                <button onclick='saveToEditDescription("${st.index+1}")' type="button" class="icon icon-save"></button>
                                                <!--<input type="submit" value="Save" />-->
                                            </td>
                                            <td  class="tx-al-c">
                                                <div onclick="deleteDescription()" class="checkbox">
                                                    <label style="font-size: 1.5em; padding-left: 8px;">
                                                        <input type="hidden" id="count" value="" />
                                                        <input type="checkbox" value="${st.index+1}" id="checkBox">
                                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="button-bottom tx-al-r mg-r-20">
                    <input onclick="addNewDescription()" type="button" class="btn btn-icon btn-addnew" value="Add New"/>
                    <button id="checkDeleteDescription" data-toggle="modal" data-target="#modal-delete" onclick="pageDeleteDescription()" type="button" class="btn btn-icon btn-delete" disabled>Delete</button>
                </div>
            </div>
        </div>

        <hr>

        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <!-- end content product decription-->
    </body>
    <script>
                        function getImage(s, id) {
//                    alert(nameImage);
                            var src = document.getElementById('thumbImage-' + id).src;
                            document.getElementById('anhDaiDien').src = src;
                            document.getElementById('idImage').value = id;
                        }
    </script>
    <!--Xử lý phần Upload file khi click upload 1 image thì sẽ show image cho xem trước-->
    <script>
        var getFileUploadDescription = function (event, index) {
            var input = event.target;
            var reader = new FileReader();

            reader.onload = function () {
//                var id = document.getElementById('idImage').value;
                var nameFileUpload = document.getElementById('uploadImage-' + index).files[0].name;
                var dataURL = reader.result;
                var image = document.getElementById('anhDaiDien-' + index);
//                        console.log(image.src);
                image.src = dataURL;

            };
            reader.readAsDataURL(input.files[0]);
        };

    </script>
    <!--End-->
    <!--Get data form to Save-->
    <script>
        function saveToEditDescription(vitri, del) {
//            alert(vitri);
//            alert(del);
            var dem = 0;
            var func = del;
            var sumIndex = document.getElementById('sumIndex').value;
            var tieude = "", mota = "", hinh = "";
            for (var i = 1; i <= sumIndex; i++) {
                if (func === "delete") {
                    if (vitri === i) {
                        dem = 1;
                        continue;
                    }
                }
                hinh = hinh + "CT" + i + ".jpg" + ";";
                tieude = tieude + document.getElementById('tieude-' + i).value + "^";
                mota = mota + document.getElementById('mota-' + i).value + "^";
            }
//            alert(dem);
//            alert(hinh);
//            alert(tieude);
//            alert(mota);
            document.getElementById('tieude').value = tieude;
            document.getElementById('mota').value = mota;
            document.getElementById('image').value = hinh;
            //            document.getElementById('mota').value = mota;
            document.getElementById('vitri').value = vitri;
            document.getElementById('formEditDescription').submit();

        }
        ;
    </script>
    <script>
        function pageDeleteDescription() {
            var inputs = document.getElementsByTagName("input");
            var id = "";
            var count = "";
            var n = "";
            var hinh = "", tieude = "", mota = "";
            for (var i = 0; i < inputs.length; i++) {
                var input = inputs[i];
                if (inputs[i].name == "IDSP") {
                    id = inputs[i].value;
                }
                if (inputs[i].type == "checkbox" && inputs[i].checked) {
                    count = count + inputs[i].value + ";";
                } else if (inputs[i].type == "checkbox") {
                    n = n + inputs[i].value + ";";
                }
            }
            var ch = n.split(";");
//            alert(ch.length);
            for (var i = 0; i < ch.length - 1; i++) {
                hinh = hinh + "CT" + ch[i] + ".jpg" + ";";
                tieude = tieude + document.getElementById('tieude-' + ch[i]).value + "^";
                mota = mota + document.getElementById('mota-' + ch[i]).value + "^";
            }
            document.getElementById('tieude').value = tieude;
            document.getElementById('mota').value = mota;
            document.getElementById('image').value = hinh;
//            alert(id);
            $.post("admin/pageDeleteDescription.htm", {'hinh': hinh, 'tieude': tieude, 'mota': mota, 'id': id}, function (data) {
                $('.modal-body').html(data);
            });
//            document.getElementById('formEditDescription').submit();
//            alert(n);
//            alert(hinh);
//            alert(tieude);
//            alert(mota);
        }
    </script>
    <script>
        function addNewDescription() {
            var id = document.getElementById('id').value;
//            alert(id);
            $.post("admin/showDescription.htm", {'function': 'add', 'id': id}, function (data) {
                $('body').html(data);
            });
        }
    </script>
    <script>
        function deleteDescription() {
            var inputs = document.getElementsByTagName("input");
            var count = "";
            for (var i = 0; i < inputs.length; i++) {
                var input = inputs[i];
                if (inputs[i].type == "checkbox" && inputs[i].checked) {
                    count = count + inputs[i].value + ";";
                }
            }
            document.getElementById('count').value = count;
            alert(document.getElementById('count').value);
            if (count.length > 0) {
                document.getElementById('checkDeleteDescription').disabled = false;
            } else {
                document.getElementById('checkDeleteDescription').disabled = true;
            }
        }
    </script>
</html>
