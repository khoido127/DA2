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
        <title>Bill Manage Page</title>
    </head>
    <body>
        <h1>Describe Bill</h1>
        <div class="content-bill row no-margin">
            <div class="bill-details">
                <div class="row">
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">Time</label>
                        <input type="text" class="edit-field" name="ngay"/>
                    </div>
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label" style="float:left">Type :</label>
                        <div class="edit-field" style="float:left">
                            <div class="tx-al-c" style="width:40%;float:left">
                                <label class="mg-r-5">In</label>
                                <input type="radio"  name="type" />
                            </div>
                            <div class="tx-al-c" style="width:40%;float:left">
                                <label class="mg-r-5">Out</label>
                                <input type="radio" name="type" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">ID Bill</label>
                        <input type="text" class="edit-field" name="IDHD"/>
                    </div>
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">Product Name</label>
                        <input type="text" class="edit-field" name="TenSP"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">Size</label>
                        <input type="text" class="edit-field" name="Size"/>
                    </div>
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">Quantity</label>
                        <input type="text" class="edit-field" name="SL"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">Price</label>
                        <input type="text" class="edit-field" name="Gia"/>
                    </div>
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <div class="col-md-4 tx-al-c">
                            <label class="mg-r-5">In Progess</label>
                            <input type="radio" name="status" />
                        </div>
                        <div class="col-md-4 tx-al-c">
                            <label class="mg-r-5">On Way</label>
                            <input type="radio" name="status" />
                        </div>
                        <div class="col-md-4 tx-al-c">
                            <label class="mg-r-5">Payed</label>
                            <input type="radio" name="status" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">Order By</label>
                        <input type="text" class="edit-field" name="TenKH"/>
                    </div>
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">Phone</label>
                        <input type="text" class="edit-field" name="SDT"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">Address</label>
                        <input type="text" class="edit-field" name="diaChi"/>
                    </div>
                    <div class="col-md-6 mg-b-10 mg-t-10 edit-control">
                        <label class="edit-label">Total:</label>
                        <span class="edit-field tx-al-l">2000$</span>
                    </div>
                </div>
            </div>
            <div class="button-group col-md-12 tx-al-r">
                <button onclick="" type="button" class="mg-r-5 btn btn-add">Add New</button>
                <button onclick="" type="button" class="mg-r-5 btn btn-save">Save</button>
                <button onclick="" type="button" class="btn btn-delete">Delete</button>
            </div>
            <div class="bill-table col-md-12">
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
                                                <th>Time</th>
                                                <th>Type</th>
                                                <th>ID Bill</th>
                                                <th>Product Name</th>
                                                <th>Size</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                                <th>Order By</th>
                                                <th>Phone</th>
                                                <th>Edit</th>
                                                <th> </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td><p>04/23/18</p></td>
                                                <td><p>Xuat</p></td>
                                                <td>
                                                    HD012
                                                </td>
                                                <td>adidas NMD</td>
                                                <td>36</td>
                                                <td>3</td>
                                                <td>200$</td>
                                                <td>In progess</td>
                                                <td>Nguyen Van A</td>
                                                <td>0932786592</td>
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
                                                <td>2</td>
                                                <td><p>04/13/18</p></td>
                                                <td><p>Nhap</p></td>
                                                <td>
                                                    HD012
                                                </td>
                                                <td>jordan 23</td>
                                                <td>36</td>
                                                <td>1</td>
                                                <td>500$</td>
                                                <td>Pay</td>
                                                <td>Nguyen Van D</td>
                                                <td>0932783246</td>
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
