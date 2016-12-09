<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Address.aspx.cs" Inherits="Address" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%= BLL.Sys.Config.getSiteConfig("", "", "")%>
    <uc:info ID="global1" runat="server" />
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/city-picker.css" rel="stylesheet" type="text/css" />

    
    <style>
        #save{
            background: #17804d none repeat scroll 0 0;
    border: 0 none;
    color: #fff;
    cursor: pointer;
    font-size: 14px;
    font-weight: bold;
    height: 32px;
    text-align: center;
    width: 75px;

        }
        em{font-style:normal;}
    </style>
</head>

<body>
    <!--头部-->
    <uc:head ID="head1" runat="server" />
    <!--头部-->
    <div class="space_hx">&nbsp;</div>
    <div class="inner" style="margin-top: 20px;">
        <div class="content">
            <h2 class="cona">当前位置：<a href="/" title="首页">首页</a> >  <a href="Address.aspx">收货地址</a>
            </h2>
            <div class="conb">
                <div class="MainContent">
                    <div class="user clearfix">
                        <uc:left ID="left1" runat="server" nav="4" />
                        <div class="u_r">
                            <div class="user_m clearfix">
                                <div class="address">
                                      <form name="formMsg" id="formMsg"  method="post">
                                    <ul class="reg ads_a">
                                        <li class="clearfix">
                                            <span class="title"><em id="ti">新增收货地址</em></span>
                                            <div class="li_m">电话号码、手机号选填一项,其余均为必填项</div>
                                        </li>
                                        <li class="clearfix dz">
                                            <span class="title">所在地区<em>*</em></span>
                                            <div class="li_m">
                                               <div id="distpicker">
				<div class="form-group">
					<div style="position: relative;">
						<input id="city-picker3" name="city" class="form-control" readonly type="text" value="江苏省/常州市/溧阳市" data-toggle="city-picker">
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-warning" id="reset" type="button">重置</button>
					<button class="btn btn-danger" id="destroy" type="button">确定</button>
				</div>
			</div>
                                            </div>
                                        </li>
                                        <li class="clearfix xxdz">
                                            <span class="title">详细地址<em>*</em></span>
                                            <div class="li_m">
                                                <textarea name="KK_CsgAddress" id="address" cols="" rows=""></textarea>
                                                <div id="note" class="note"><font color="#777">建议您如实填写详细的收货地址，例如街道名称，门牌号码，楼层和房间号等信息</font></div>  
  
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <span class="title">邮政编码</span>
                                            <div class="li_m">
                                                <input name="KK_CsgPostcode" id="postcode" type="text" placeholder="如您不清楚邮递区号，请填写000000">
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <span class="title">收货人姓名<em>*</em></span>
                                            <div class="li_m">
                                                <input name="KK_CsgName" type="text" id="name" placeholder="长度不超过25个字符">
                                            </div>
                                        </li>
                                        <li class="clearfix sj">
                                            <span class="title">手机号码</span>
                                            <div class="li_m">
                                                
                                                <input name="KK_CsgMobile" id="phone" type="text" placeholder="电话号码、手机号码必须填一项">
                                            </div>
                                        </li>
                                        <li class="clearfix tel">
                                            <span class="title">电话号码</span>
                                            <div class="li_m">
                                               
                                                <input name="KK_CsgTel" id="tel" style="width:200px;" type="text" placeholder="区号-电话号码">
                                            </div>
                                        </li>
                                        <li class="clearfix mr">
                                            <span class="title">&nbsp;</span>
                                            <div class="li_m">
                                                <input name="KK_IsCheck"   type="checkbox" value="0" id="mr">
                                                <label for="mr"><span>设置为默认收货地址</span></label>

                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <span class="title">&nbsp;</span>
                                            <div class="li_m">
                                                <input  type="hidden" id="hid" name="hid" value=""/>
                                                <input name="" id="save" type="button" value="保存">
                                            </div>
                                        </li>
                                    </ul>
                                          </form>
                                    <div class="space_hx">&nbsp;</div>
                                    <table class="ads_b" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <th scope="col">收货人</th>
                                            <th scope="col">所在地区</th>
                                            <th scope="col">详细地址</th>
                                            <th scope="col">邮编</th>
                                            <th scope="col">电话/手机</th>
                                            <th scope="col">操作</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                        <%foreach(DataRow dr in dt.Rows){ %>
                                        <tr>
                                            <td><%=dr["csgname"] %></td>
                                            <td><%=dr["CsgProv"] %> <%=dr["CsgCity"] %>  <%=dr["CsgCounty"] %> </td>
                                            <td><%=dr["CsgAddress"] %></td>
                                            <td><%=dr["CsgPostcode"] %></td>
                                            <td><%=dr["CsgTel"] %>  <%=dr["CsgMobile"] %> </td>
                                            <td><a href="javascript:edit('<%=dr["id"] %>')" >修改</a> | <a href="javascript:del('<%=dr["id"] %>')">删除</a></td>

                                            <td>
                                                <%if(dr["IsCheck"].ToString()=="1"){ %>
                                                <a href="" class="x_mr active">默认地址</a>
                                                <%}else{ %>
                                                <a href="" class="x_mr">默认地址</a>

                                                <%} %>
                                            </td>

                                        </tr>
                                        <%} %>
                                      
                                      
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="space_hx">&nbsp;</div>
    <!--底部-->
    <uc:foot ID="foot1" runat="server" />
    <script>

        $(function () {
            $("input[type='checkbox']").click(function () {
                if ($("#mr").attr("checked") == "checked")
                    $("#mr").val(1);
                   
                 else 
                   
                    $("#mr").val(0);


                
            });
        });
        function del(id) {

            $.ajax({
                type: "POST",
                url: "ajax/dizhi.aspx?action=del",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: {"id":id},
               dataType: "json",
               beforeSend: function () {
                   layer.load("正在删除，请稍后...");
               },
                success: function (result) {
                    layer.closeAll("loading");
                    if (result) {
                        if (result.status == "success") {
                            layer.msg(result.content,function () {
                                window.location = "address.aspx";
                            });
                        } else {
                            layer.msg(result.content);
                        }
                    } else {
                        layer.msg("网络错误！");
                    }
                }
            });


          

        }
        $("#save").click(
            function () {
                var address = $("#address").val();
                if (address == "") {
                    layer.msg("收货人地址不能为空！");
                    return false;
                }
                var currentVal = $("#name").val();
                if (currentVal == "") {
                    layer.msg("收货人名称不能为空！");
                    return false;
                }
                var s = $("#phone").val();
                if (s == "") {
                    layer.msg("手机号码不能为空！");
                    return false;
                }
                $.ajax({
                    type: "POST",
                    url: "ajax/dizhi.aspx?action=edit",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: $("#formMsg").serialize(),
                    dataType: "json",
                    beforeSend: function () {
                        layer.load("正在保存，请稍后...");
                    },
                    success: function (result) {
                        layer.closeAll("loading");
                        if (result) {
                            if (result.status == "success") {
                                layer.msg(result.content, function () {
                                    window.location = "address.aspx";
                                });
                            } else {
                                layer.msg(result.content);
                            }
                        } else {
                            layer.msg("网络错误！");
                        }
                    }
                });


            }

            )

        function edit(id) {
            $("#ti").html('修改地址');
            $.ajax({
                type: "POST",
                url: "ajax/dizhi.aspx?action=modify",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: { "id": id },
                dataType: "json",
              
                success: function (result) {
                    layer.closeAll("loading");
                    if (result) {
                        if (result.status == "success") {
                           
                            $('#city-picker3').citypicker('destroy');
                            $("#city-picker3").val(result.CsgProv + "/" + result.CsgCity + "/" + result.CsgCounty);
                           
                            $("#address").val(result.CsgAddress);
                            $("#postcode").val(result.CsgAddress);
                            $("#phone").val(result.CsgMobile);
                            $("#name").val(result.CsgName);
                            $("#tel").val(result.CsgTel);
                            $("#mr").val(result.IsCheck);
                            $("#hid").val(id);
                            if(result.IsCheck=="1")
                              
                                $("[name = KK_IsCheck]:checkbox").attr("checked", true);
                            else 
                                $("[name = KK_IsCheck]:checkbox").attr("checked", false);

                        } else {
                            layer.msg(result.content);
                        }
                    } else {
                        layer.msg("网络错误！");
                    }
                }
            });

        }
    </script>
<script src="js/bootstrap/js/bootstrap.min.js"></script>
<script src="js/city-picker.data.js"></script>
    <script src="js/city-picker.js"></script>
    <script src="js/main.js"></script>
    <!--底部-->
    
</body>
</html>

