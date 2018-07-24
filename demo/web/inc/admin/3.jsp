<%-- 
    Document   : 3
    Created on : Jul 14, 2018, 10:49:32 AM
    Author     : ASUS
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <base href="${pageContext.servletContext.contextPath}/" >
        <title>Product Comment Page</title>
    </head>
    <body>
        <h3>${notShow}</h3>
        <div class="row mg-t-10">
            <h1> Product Review: <a target="_blank" href="Home/pageSingle.htm?code=${idsp}">${idsp}</a></h1>
            <div class="col-md-12">
                <div class="white-box">
                    <h3 class="box-title">Review table</h3>
                    <div class="table-responsive">
                        <form id="formComment" action="" method="post">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>NAME</th>
                                        <th>EMAIL</th>
                                        <th>COMMENT</th>
                                        <th>DATE</th>
                                        <th>REPLY</th>
                                        <th>SAVE</th>
                                        <th>DELETE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cm" items="${listcm}" varStatus="st">
                                        <tr>
                                            <td>${st.index+1}</td>
                                            <td><p>${cm.name}</p></td>
                                            <td><p>${cm.email}</p></td>
                                            <td>
                                                <p class="comment-field">${cm.message}</p>
                                            </td>
                                            <td>${cm.ngayCM}</td>
                                            <td>
                                                <textarea id="reply-${st.index+1}" class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500">${cm.reply}</textarea>
                                            </td>
                                            <td>
                                                <input type="hidden" name="stt" id="stt" value="${cm.stt}" />
                                                <input type="hidden" name="messageReply" id="messageReply" value="" />
                                                <input type="hidden" name="idsp" value="${cm.IDSP}" />
                                                <button onclick="getDataToSaveComment('${st.index+1}', '${cm.stt}')" type="button" class="icon icon-save"></button>
                                            </td>
                                            <td>
                                                <button data-toggle="modal" data-target="#modal-delete" onclick="pageDeleteComment('${cm.stt}', '${cm.IDSP}')" type="button" class="icon icon-delete"></button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <!--Lấy dữ liệu comment để save-->
        <script>
            function getDataToSaveComment(vitri, stt) {
//                alert(vitri + stt);
                alert(document.getElementById('reply-' + vitri).value);
                var reply = document.getElementById('reply-' + vitri).value;
                document.getElementById('stt').value = stt;
                document.getElementById('messageReply').value = reply;
                $.post("admin/getDataToSaveComment.htm", $('#formComment').serialize(), function (data) {
                    $('body').html(data);
                });
            }
        </script>
        <script>
            function pageDeleteComment(stt,id){
                $.post("admin/pageDeleteComment.htm", {'stt': stt, 'id': id}, function (data) {
                $('.modal-body').html(data);
            });
            }
        </script>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
    </body>
</html>
