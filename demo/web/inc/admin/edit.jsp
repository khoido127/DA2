<%-- 
    Document   : edit
    Created on : Jul 10, 2018, 2:33:59 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <base href="${pageContext.servletContext.contextPath}/">
        <meta http-equiv="Cache-Control" content="no-store"/>
        <style>
            .boxSlide{
                width: 300px;
                height: 320px;
            }
        </style>
    </head>
    <body>
        <h2 class="custom-head">Management </h2>
        <hr class="mg-l-20 mg-r-20">
        <%  response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server  
        %>
        <form id="formProduct" role="form" action="admin/saveToEdit.htm" method="post" enctype="multipart/form-data">
            <!-- content product -->
            <c:forEach var="sp" items="${listEdit}">
                <div class="row top-content mg-b-20">

                    <div style="margin-bottom: 10px;" class="content-left-panel col-md-4">
                        <div class="single-right-left ">
                            <div class="grid images_3_of_2">
                                <div class="boxSlide">
                                    <img id="anhDaiDien" style="margin-bottom: 10px;width: 300px; height: 240px;" src="${src}" alt="image"/>
                                    <div style="width: 100%; display: flex;justify-content: space-around;" >
                                        <input name="idImage" id="idImage" type="hidden" value="1" />
                                        <c:forEach var="s" items="${listSlide}" varStatus="st">
                                            <input type="hidden" id="index-${st.index+1}" value="${st.index+1}" />
                                            <input type="hidden" id="fileName-${st.index+1}" value="${s.url}" />
                                            <img onclick="getImage('images/product/${sp.IDLoai}/${sp.IDSP}/${s.url}', '${st.index+1}')" id="thumbImage-${st.index+1}" style="width: 80px;height: 80px;cursor: pointer;" src="${s.url}" />
                                        </c:forEach>

                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="content-right-panel col-md-8 p-l-0">
                        <div class="row" style="">

                            <div class="addnew-product">
                                <div class="row">
                                    <div class="col-md-10 col-sm-10">
                                        <div class="edit-control mg-b-10 mg-t-10">
                                            <label class="edit-label">Product ID:</label>
                                            <input id="nameImage" name="nameImage" type="hidden" value="" />
                                            <!--<input type="hidden" name="idsp" value="" />-->
                                            <input ${status} name="IDSP" type="text" maxlength="20" class="edit-field" value="${sp.IDSP}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-10 col-sm-10">
                                        <div class=" edit-control mg-b-10 mg-t-10">
                                            <label class="edit-label">Product Name:</label>
                                            <input name="TenSP" type="text" class="edit-field" maxlength="50" value="${sp.tenSP}"/>
                                        </div>
                                    </div>
                                         <div class="col-md-10 col-sm-10">
                                        <div class="edit-control mg-b-10 mg-t-10">
                                            <label class="edit-label">Brand:</label>
                                            <select name="IDLoai" id="loaiSP" style="height: 30px">
                                                <c:forEach var="l" items="${listLoai}">
                                                    <option ${l.selected} value="${l.IDLoai}">${l.tenLoai}</option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-10 col-sm-10">
                                        <div class="edit-control mg-b-10 mg-t-10">
                                            <label class="edit-label">Price:</label>
                                            <input name="GiaSP" type="text" class="numberfield" id="numberfield" maxlength="6" value="${sp.giaSP}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-10 col-sm-10">
                                        <div class="edit-control mg-b-10 mg-t-10">
                                            <label class="edit-label">PriceSale:</label>
                                            <input name="GiaSPKM" type="text" class="numberfield"  id="numberfield1" maxlength="6" value="${sp.giaSPKM}"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-md-10 col-sm-10">
                                        <div class="edit-control mg-b-10 mg-t-10">
                                            <label style="position: relative;top: -88px;" class="edit-label">Description:</label>
                                            <textarea maxlength="300" placeholder="Description" cols="20" rows="5" name="moTa" class="edit-field" >${sp.moTa}</textarea>
                                        </div>
                                    </div>
                                   
                                </div>

                            </div>

                        </div>

                    </div>

                    <div style="margin-top: 10px;" class="button-content col-md-12 tx-al-r p-r-20">
                        <div class="col-md-4 button-content-left tx-al-l">
                            <input value="Choose Image" multiple="false" accept="image/*" onchange="getFileUpload(event)" id="uploadImage" name="fileUpload" type="file" />
                        </div>
                        <div class="col-md-8 button-content-right">
                            <div class="tx-al-r">
                                <button onclick="addNew()" type="button" class="btn btn-icon btn-new" >New</button>
                                <!--<button onclick="getDataToSave('${sp.IDSP}')" id="save" type="button" class="btn" value="Save" >Save</button>-->
                                <input onclick="getDataToSave()" type="submit" class="btn btn-icon btn-save" value="Save" />
                                <button id="deleteSP" disabled onclick="pageDeleteSP()" data-toggle="modal" data-target="#modal-delete" type="button" class="btn btn-icon btn-delete" >Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </form>
        <!--Xu ly phan hinh anh slide-->
        <script>
        $("#numberfield").keyup(function() {
        $("#numberfield").val(this.value.match(/[0-9.]*/));
        });
        $("#numberfield1").keyup(function() {
        $("#numberfield1").val(this.value.match(/[0-9.]*/));
        });
            var nameImage = "";
            for (var i = 1; i <= 3; i++) {
                nameImage = nameImage + document.getElementById('index-' + i).value + ".jpg" + ";";

            }
            document.getElementById('nameImage').value = nameImage;
//                alert(nameImage);
            function getImage(s, id) {
//                    alert(nameImage);
                for (var i = 1; i <= 3; i++) {

                    if (i == id) {
                        document.getElementById('thumbImage-' + i).setAttribute("style", "border:1px solid red;width:80px;height:80px;");
                    } else {
                        document.getElementById('thumbImage-' + i).setAttribute("style", "width:80px;height:80px;");
                    }
                }

                var src = document.getElementById('thumbImage-' + id).src;
                document.getElementById('anhDaiDien').src = src;
                document.getElementById('idImage').value = id;
            }

        </script>
    </body>
</html>
