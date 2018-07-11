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
        
        <style>
            .boxSlide{
                width: 300px;
                height: 320px;
            }
        </style>
    </head>
    <body>
        <form role="form" action="admin/saveToEdit.htm" method="post" enctype="multipart/form-data">
            <!-- content product -->
            <c:forEach var="sp" items="${listEdit}">
                <div class="row top-content mg-b-20">

                    <div style="margin-bottom: 10px;" class="content-left-panel col-md-4">
                        <div class="single-right-left ">
                            <div class="grid images_3_of_2">
                                <div  class="boxSlide">
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
                                    <div class="col-md-6">
                                        <div class=" mg-b-10 mg-t-10">
                                            <label class="edit-label">Product ID:</label>
                                            <input id="nameImage" name="nameImage" type="hidden" value="" />
                                            <!--<input type="hidden" name="idsp" value="" />-->
                                            <input ${status} name="IDSP" type="text" class="edit-field" value="${sp.IDSP}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mg-b-10 mg-t-10">
                                            <label class="edit-label">Product Name:</label>
                                            <input name="TenSP" type="text" class="edit-field" value="${sp.tenSP}"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mg-b-10 mg-t-10">
                                            <label class="edit-label">Price:</label>
                                            <input name="GiaSP" type="text" class="edit-field" value="${sp.giaSP}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mg-b-10 mg-t-10">
                                            <label class="edit-label">PriceSale:</label>
                                            <input name="GiaSPKM" type="text" class="edit-field" value="${sp.giaSPKM}"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="mg-b-10 mg-t-10">
                                            <label style="position: relative;top: -52px;" class="edit-label">Description:</label>
                                            <textarea maxlength="350" placeholder="Description" cols="20" rows="5" name="moTa" class="edit-field" >${sp.moTa}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mg-b-10 mg-t-10">
                                            <label class="edit-label">Brand:</label>
                                            <select name="IDLoai" id="loaiSP">
                                                <c:forEach var="l" items="${listLoai}">
                                                    <option ${l.selected} value="${l.IDLoai}">${l.tenLoai}</option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                    <div style="margin-top: 10px;" class="button-content col-md-12 tx-al-r p-r-20">
                        <div class="col-md-4 button-content-left tx-al-l">
                            <input multiple="false" accept="image/*" onchange="getFileUpload(event)" id="uploadImage" name="fileUpload" type="file" />
                        </div>
                        <div class="col-md-8 button-content-right">
                            <div class="tx-al-r">
                                <button onclick="addNew()" type="button" class="btn" >AddNew</button>
                                <!--<button onclick="getDataToSave('${sp.IDSP}')" id="save" type="button" class="btn" value="Save" >Save</button>-->
                                <input type="submit" class="btn" value="Save" />
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </form>
    </body>
</html>
