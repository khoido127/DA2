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
        <title>Brand Page</title>
    </head>
    <body>
        <div class="brand-page">
            <div class="field-content row no-margin">
                <div class="addnew-product">
                    <div class="col-md-10 mg-b-10 mg-t-10">
                        <label class="edit-label">Brand ID:</label>
                        <input type="text" class="edit-field" value=""/>
                    </div>
                    <div class="col-md-10 mg-b-10 mg-t-10">
                        <label class="edit-label">Brand Name:</label>
                        <input type="text" class="edit-field" value=""/>
                    </div>
                </div>
                <div class="button-content tx-al-r col-md-12">
                    <input type="button" class="btn" value="Add New" />
                                    <input type="button" class="btn" value="Save" />
                </div>
                
            </div>
            <div class="table-content row no-margin">
                 <div class="white-box">
                        <h3 class="box-title">Brand table</h3>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>BRAND ID</th>
                                        <th>BRAND NAME</th>
                                        <th>EDIT</th>
                                        <th>DELETE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td class="txt-oflo">AD</td>
                                        <td>Adidas</td>
                                        <td>
                                            <input type="button" class="btn btn-edit" value="Edit"/>
                                        </td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td class="txt-oflo">NK</td>
                                        <td>Nike</td>
                                        <td>
                                            <input type="button" class="btn btn-edit" value="Edit"/>
                                        </td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td class="txt-oflo">JD</td>
                                        <td>Jordan</td>
                                        <td>
                                            <input type="button" class="btn btn-edit" value="Edit"/>
                                        </td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td class="txt-oflo">PB</td>
                                        <td>Palladium Boost</td>
                                        <td>
                                            <input type="button" class="btn btn-edit" value="Edit"/>
                                        </td>
                                        <td>
                                            <input style="display: none" type="checkbox" class="custom-checkbox"/>
                                            <input type="button" class="btn btn-trash" value="Delete"/>
                                        </td>
                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
        </div>
    </body>
</html>
