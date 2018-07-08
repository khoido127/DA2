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
        <title>Product Detail Page</title>
    </head>
    <body>
                            <!-- content product -->
                    <div class="row top-content mg-b-20">
                        <div class="content-left-panel col-md-4">
                            <div class="single-right-left ">
                                <div class="grid images_3_of_2">
                                    <div class="flexslider">

                                        <ul class="slides">
                                            <li data-thumb="images/product/AD/ADNMD-CS2PS-BLK/CT1.jpg">
                                                <div class="thumb-image"> <img src="images/product/AD/ADNMD-CS2PS-BLK/CT1.jpg" data-imagezoom="true" class="img-responsive" style="width: 320px; height: 280px"> </div>
                                            </li>
                                            <li data-thumb="images/product/AD/ADNMD-CS2PS-BLK/CT2.jpg">
                                                <div class="thumb-image"> <img src="images/product/AD/ADNMD-CS2PS-BLK/CT2.jpg" data-imagezoom="true" class="img-responsive" style="width: 320px; height: 280px"> </div>
                                            </li>
                                            <li data-thumb="images/product/AD/ADNMD-CS2PS-BLK/CT3.jpg">
                                                <div class="thumb-image"> <img src="images/product/AD/ADNMD-CS2PS-BLK/CT3.jpg" data-imagezoom="true" class="img-responsive" style="width: 320px; height: 280px"> </div>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="content-right-panel col-md-8 p-l-0">
                            <div class="row" style="">
                                <div class="addnew-product">
                                    <div class=" mg-b-10 mg-t-10">
                                        <label class="edit-label">Product ID:</label>
                                        <input type="text" class="edit-field" value=""/>
                                    </div>
                                    <div class="mg-b-10 mg-t-10">
                                        <label class="edit-label">Product Name:</label>
                                        <input type="text" class="edit-field" value=""/>
                                    </div>
                                    <div class="mg-b-10 mg-t-10">
                                        <label class="edit-label">Price:</label>
                                        <input type="text" class="edit-field" value=""/>
                                    </div>
                                    <div class="mg-b-10 mg-t-10">
                                        <label class="edit-label">Brand:</label>
                                        <input type="text" class="edit-field" value=""/>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="button-content col-md-12 tx-al-r p-r-20">
                            <div class="col-md-4 button-content-left tx-al-l">
                                <input type="button" class="btn" value="Choose Image" />
                            </div>
                            <div class="col-md-8 button-content-right">
                                <div class="tx-al-r">
                                    <input type="button" class="btn" value="Add New" />
                                    <input type="button" class="btn" value="Save" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="white-box">
                        <h3 class="box-title">Product table</h3>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>NAME</th>
                                        <th>STATUS</th>
                                        <th>DATE</th>
                                        <th>PRICE</th>
                                        <th>EDIT</th>
                                        <th>DELETE</th>
                                        <th>PRODUCT DETAIL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td class="txt-oflo">Elite admin</td>
                                        <td>SALE</td>
                                        <td class="txt-oflo">April 18, 2017</td>
                                        <td><span class="text-success">$24</span></td>
                                        <td>
                                            <input type="button" class="btn btn-edit" value="Edit"/>
                                        </td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-detail" value="Detail"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td class="txt-oflo">Real Homes WP Theme</td>
                                        <td>EXTENDED</td>
                                        <td class="txt-oflo">April 19, 2017</td>
                                        <td><span class="text-info">$1250</span></td>
                                        <td>
                                            <input type="button" class="btn btn-edit" value="Edit"/>
                                        </td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-detail" value="Detail"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td class="txt-oflo">Ample Admin</td>
                                        <td>EXTENDED</td>
                                        <td class="txt-oflo">April 19, 2017</td>
                                        <td><span class="text-info">$1250</span></td>
                                        <td>
                                            <input type="button" class="btn btn-edit" value="Edit"/>
                                        </td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-detail" value="Detail"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td class="txt-oflo">Medical Pro WP Theme</td>
                                        <td>TAX</td>
                                        <td class="txt-oflo">April 20, 2017</td>
                                        <td><span class="text-danger">-$24</span></td>
                                        <td>
                                            <input type="button" class="btn btn-edit" value="Edit"/>
                                        </td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                        <td>
                                            <input type="button" class="btn btn-detail" value="Detail"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- end content product -->
    </body>
</html>
