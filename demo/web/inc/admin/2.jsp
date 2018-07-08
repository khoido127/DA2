<%-- 
    Document   : productDetail
    Created on : Jul 6, 2018, 10:07:17 AM
    Author     : ASUS
--%>

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
                        <h1> Product Description</h1>
                        <div class="col-md-12">
                            <div class="white-box">
                                <h3 class="box-title">Description table</h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>IMAGE</th>
                                                <th>TITLE</th>
                                                <th>DESCRIPTION</th>
                                                <th>DELETE</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <img src="images/product/AD/ADNMD-CS2PS-BLK/CT1.jpg"  style="width: 200px; height: 160px">
                                                    <input type="button" class="btn" value="Choose Image"/>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="100"></textarea>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"></textarea>
                                                </td>
                                                <td>
                                                    <input type="button" class="btn btn-trash" value="Delete"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>
                                                    <img src="images/product/AD/ADNMD-CS2PS-BLK/CT2.jpg"  style="width: 200px; height: 160px">
                                                    <input type="button" class="btn" value="Choose Image"/>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="100"> </textarea>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                                </td>
                                                <td>
                                                    <input type="button" class="btn btn-trash" value="Delete"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>
                                                    <img src="images/product/AD/ADNMD-CS2PS-BLK/CT3.jpg"  style="width: 200px; height: 160px">
                                                    <input type="button" class="btn" value="Choose Image"/>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="100"> </textarea>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                                </td>
                                                <td>
                                                    <input type="button" class="btn btn-trash" value="Delete"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>
                                                    <img src="images/product/AD/ADNMD-CS2PS-BLK/CT2.jpg"  style="width: 200px; height: 160px">
                                                    <input type="button" class="btn" value="Choose Image"/>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="100"> </textarea>
                                                </td>
                                                <td>
                                                    <textarea class="custom-textarea" placeholder="Remember, be nice!" cols="30" rows="3" maxlength="500"> </textarea>
                                                </td>
                                                <td>
                                                    <input type="button" class="btn btn-trash" value="Delete"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="button-bottom tx-al-r mg-r-20">
                                <input type="button" class="btn" value="Save"/>
                                <input type="button" class="btn" value="Add New"/>
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
                    <!-- end content product decription-->
    </body>
</html>
