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
        <title>Storage Manage Page</title>
    </head>
    <body>
        <div class="content-bill row no-margin">
            <div class="col-md-5 tx-al-c">
                <h1 class="mg-b-20">Product Name</h1>
                <image src="images/no-image.jpg" width="300" />
            </div>
            <div class="col-md-7">
            <div class="button-group col-md-12 tx-al-r">
                <button onclick="" type="button" class="mg-r-5 btn btn-add">Add New</button>
            </div>
            <div class="bill-table col-md-12">
                <div class="row mg-t-10">
                    <div class="col-md-12">
                        <div class="white-box">
                            <div class="table-responsive">
                                <form id="formComment" action="" method="post">
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
                                                <td>1</td>

                                                <td>
                                                    <input type="number" name="Size" value="" />
                                                </td>
                                                <td><input type="number" name="Quantity" value="" /></td>
                                                <td><input type="button" class="btn btn-save" value="Save"/></td>
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
    </body>
</html>
