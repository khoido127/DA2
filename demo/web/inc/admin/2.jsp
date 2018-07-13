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
            <h1>Product Description</h1>

            <div class="col-md-12">
                <div class="white-box">
                    <h3 class="box-title">Description table</h3>
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
                                            <td>${st.index+1}</td>
                                            <td>
                                                <img id="anhDaiDien-${st.index+1}" src="${sp.hinhCTSP}"  style="width: 200px; height: 160px">
                                                <input name="fileUpload" multiple accept="image/*" id="uploadImage-${st.index+1}" onchange="getFileUploadDescription(event,${st.index+1})" type="file" class="btn" value="Choose Image"/>
                                            </td>
                                            <td>
                                                <textarea id="tieude-${st.index+1}" class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="100" >${sp.tieudeCTSP}</textarea>
                                            </td>
                                            <td>
                                                <textarea id="mota-${st.index+1}" class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500">${sp.motaCT}</textarea>
                                            </td>
                                            <td>
                                                <input id="sumIndex" type="hidden" name="sumIndex" value="${sumIndex}" />
                                                <input type="hidden" name="idloai" value="${sp.idLoai}" />
                                                <input type="hidden" id="tieude" name="tieude" value="" />
                                                <input type="hidden" id="mota" name="mota" value="" />
                                                <input type="hidden" id="image" name="image" value="" />
                                                <input id="image-${st.index+1}" type="hidden" value="${sp.tenHinh}" />
                                                <input id="tieude-${st.index+1}" type="hidden" name="tieude" value="${sp.tieudeCTSP}" />
                                                <input id="id" type="hidden" name="IDSP" value="${sp.IDSP}" />
                                                <input id="vitri" name="vitri" value="${st.index+1}" type="hidden" />
                                                <input id="mota-${st.index+1}" type="hidden" name="mota" value="${sp.motaCT}" />
                                                <button onclick='saveToEditDescription("${st.index+1}")' type="button" class="btn">Save</button>
                                                <!--<input type="submit" value="Save" />-->
                                            </td>
                                            <td><button data-toggle="modal" data-target="#modal-delete" onclick="pageDeleteDescription('${st.index+1}')" type="button" class="btn btn-trash">Delete</button></td>
                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="button-bottom tx-al-r mg-r-20">
                    <input onclick="addNewDescription()" type="button" class="btn" value="Add New"/>
                </div>
            </div>
        </div>

        <hr>
        <div class="row mg-t-10">
            <h1> Product Review</h1>
            <div class="col-md-12">
                <div class="white-box">
                    <h3 class="box-title">Review table</h3>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>NAME</th>
                                    <th>EMAIL</th>
                                    <th>COMMENT</th>
                                    <th>REPLY</th>
                                    <th>SAVE</th>
                                    <th>DELETE</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td><p>guest</p></td>
                                    <td><p>guest123@gmail.com</p></td>
                                    <td>
                                        <p class="comment-field">asdasdasdasdasdasdasddfasdfasdfasdf</p>
                                    </td>
                                    <td>
                                        <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"></textarea>
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-edit" value="Edit"/>
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-trash" value="Delete"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><p>guest</p></td>
                                    <td><p>guest123@gmail.com</p></td>
                                    <td>
                                        <p class="comment-field">asdasdasdasdasdasdasddfasdfasdfasdf</p>
                                    </td>
                                    <td>
                                        <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-edit" value="Edit"/>
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-trash" value="Delete"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td><p>guest</p></td>
                                    <td><p>guest123@gmail.com</p></td>
                                    <td>
                                        <p class="comment-field">asdasdasdasdasdasdasddfasdfasdfasdf</p>
                                    </td>
                                    <td>
                                        <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-edit" value="Edit"/>
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-trash" value="Delete"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td><p>guest</p></td>
                                    <td><p>guest123@gmail.com</p></td>
                                    <td>
                                        <p class="comment-field">asdasdasdasdasdasdasddfasdfasdfasdf</p>
                                    </td>
                                    <td>
                                        <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-edit" value="Edit"/>
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-trash" value="Delete"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
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
            for (var i = 1; i <= vitri; i++) {
                if (func == "delete" && vitri == i) {
                    dem = 1;
                    continue;
                }
                hinh = hinh + "CT" + i + ".jpg" + ";";
                tieude = tieude + document.getElementById('tieude-' + i).value + "^";
                mota = mota + document.getElementById('mota-' + i).value + "^";
            }
//            alert(dem);
//            alert(hinh);
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
        function addNewDescription() {
            var id = document.getElementById('id').value;

            alert(id);
            $.post("admin/showDescription.htm", {'function': 'add', 'id': id}, function (data) {
                $('body').html(data);
            });
        }
    </script>

</html>
