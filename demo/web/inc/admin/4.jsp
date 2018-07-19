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
        <title>User Manage Page</title>
    </head>
    <body>
        <h1>User Manage</h1>
        <div class="content-user row no-margin">
            <div class="col-md-3 content-image tx-al-c mg-t-10">
                <img class="mg-b-10" src="images/t1.jpg" width="200"/>
                <button class="btn btn-img">Choose Image</button>
            </div>
            <div class="col-md-9 content-edit">
                <div class="edit-control col-md-10 mg-b-10 mg-t-10">
                    <label class="edit-label">User ID</label>
                    <input name="IDSP" type="text" class="edit-field" value=""/>
                </div>
                <div class="edit-control col-md-10 mg-b-10 mg-t-10">
                    <label class="edit-label">Password</label>
                    <input name="IDSP" type="text" class="edit-field" value=""/>
                </div>
                <div class="edit-control col-md-10 mg-b-10 mg-t-10">
                    <label class="edit-label" style="float:left">Is Admin:</label>
                    <div class="edit-field" style="float:left">
                        <div class="tx-al-c" style="width:40%;float:left">
                            <label class="mg-r-5">Admin</label>
                            <input type="radio"  name="isAdmin" />
                        </div>
                        <div class="tx-al-c" style="width:40%;float:left">
                            <label class="mg-r-5">Staff</label>
                            <input type="radio" name="isAdmin" />
                        </div>
                    </div>
                </div>
                <div class="edit-control col-md-10 mg-b-10 mg-t-10">
                    <label class="edit-label">Info</label>
                    <input name="info" type="text" class="edit-field" value=""/>
                </div>
                <div class="button-group col-md-12 tx-al-r">
                    <button onclick="" type="button" class="mg-r-5 btn btn-add">Add New</button>
                    <button onclick="" type="button" class="mg-r-5 btn btn-save">Save</button>
                    <button onclick="" type="button" class="btn btn-delete">Delete</button>
                </div>
            </div>
            <div class="col-md-12 table-content">
                <div class="row mg-t-10">
                    <h1>Bill Table</h1>
                    <div class="col-md-12">
                        <div class="white-box">
                            <div class="table-responsive">
                                <form id="formComment" action="" method="post">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Username</th>
                                                <th>Password</th>
                                                <th>IsAdmin</th>
                                                <th>Image</th>
                                                <th>Info</th>
                                                <th>Edit</th>
                                                <th> </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td><p>Admin</p></td>
                                                <td><p>abc@123</p></td>
                                                <td>True</td>
                                                <td>
                                                    <img class="mg-b-10" src="images/t1.jpg" width="50"/>
                                                </td>
                                                <td>ádjhjkasdhjdaskjasdjasdhkjsdakj</td>
                                                <td>
                                                    <button onclick="" type="button" class="btn btn-edit">edit</button>
                                                </td>
                                                <td>
                                                    <div class="checkbox">
                                                        <label style="font-size: 1.5em; padding-left: 8px;">
                                                            <input type="hidden" id="count" value="">
                                                            <input onclick="" type="checkbox" value="" id="checkBox">
                                                            <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td><p>sadasdads</p></td>
                                                <td><p>abc@123</p></td>
                                                <td>False</td>
                                                <td>
                                                    <img class="mg-b-10" src="images/t3.jpg" width="50"/>
                                                </td>
                                                <td>ádjhjkasdhjdaskjasdjasdhkjsdakj</td>
                                                <td>
                                                    <button onclick="" type="button" class="btn btn-edit">edit</button>
                                                </td>
                                                <td>
                                                    <div class="checkbox">
                                                        <label style="font-size: 1.5em; padding-left: 8px;">
                                                            <input type="hidden" id="count" value="">
                                                            <input onclick="" type="checkbox" value="" id="checkBox">
                                                            <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td><p>Admin</p></td>
                                                <td><p>abc@123</p></td>
                                                <td>False</td>
                                                <td>
                                                    <img class="mg-b-10" src="images/t2.jpg" width="50"/>
                                                </td>
                                                <td>ádjhjkasdhjdaskjasdjasdhkjsdakj</td>
                                                <td>
                                                    <button onclick="" type="button" class="btn btn-edit">edit</button>
                                                </td>
                                                <td>
                                                    <div class="checkbox">
                                                        <label style="font-size: 1.5em; padding-left: 8px;">
                                                            <input type="hidden" id="count" value="">
                                                            <input onclick="" type="checkbox" value="" id="checkBox">
                                                            <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                                        </label>
                                                    </div>
                                                </td>
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
    </body>
</html>
