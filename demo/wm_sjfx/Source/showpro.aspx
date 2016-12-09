<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showpro.aspx.cs" Inherits="showpro" %>



<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%= BLL.Sys.Config.getSiteConfig(""+drDetail["name"]+"--产品详情", "", "")%>

    <uc:info ID="global1" runat="server" />

 <link href="css/pro.css" rel="stylesheet" />
    <script src="js/Product_detail.js"></script>
</head>
<body>
<!-- head -->
    <uc:head ID="head1" runat="server" />
   

  
<%--        <uc:banner ID="banner1" runat="server" />--%>

<!--fullSlidea end--> 

 

<!-- content -->
<div class="inner" style="margin-top:20px;"><!-- <div class="lm">
<h2>产品中心<b>·</b></h2>
<ul>

</ul>
</div>
-->
  <div class="content"> <h2 class="cona">当前位置：<a href="index.htm" tppabs="/" title="首页">首页</a> >  <a href="product.aspx">产品介绍</a> 

    </h2>
<div class="conb"> 

 	<div class="showall">
	                <!--left -->
	                <div class="showbot">
                    <div id="showbox" style="width: 400px; height: 400px; position: relative;">
                        
                        
                        
                        
                        
                        
                        
                    <div style="position: relative; width: 400px; height: 400px; top: 0px; left: 0px;"><b style="display:block;">

                        <img style="display: block; width: 400px; height: 400px;" src="upload/product/<%=drDetail["pic"] %>">

                                                                                                       </b><span style="position: absolute; left: 200px; top: 62px; display: none; z-index: 5; width: 200px; height: 200px;"></span></div><p style="position: absolute; overflow: hidden; top: 0px; display: none; width: 400px; height: 400px; left: 410px;"><img style="max-width: none; max-height: none; position: relative; left: -400px; top: -124px; width: 800px; height: 800px;" src="images/photos/img01.png"></p></div><!--展示图片盒子-->
                        <div id="showsum" style="overflow: hidden; height: 62px; width: 345px; position: relative;">
                        	<!--展示图片里边-->
                        <p style="position: absolute; left: 0px; top: 0px; width: 414px;">

                            <span class="sel" style="float: left; margin-left: 7px; width: 60px; height: 60px; overflow: hidden; position: relative;">
                                <img src="upload/product/small/<%=drDetail["pic"] %>" style="max-width: 100%; max-height: 100%; position: relative;" width="60" height="60"></span>

                        </p>
                            <div style="clear:both;width:100%;"></div></div>
                        <p class="showpage">
                            <a href="javascript:void(0);" id="showlast"> &lt; </a>
                            <a href="javascript:void(0);" id="shownext"> &gt; </a>
                        </p>
                        </div>
                        <!--conet -->
                        <div class="tb-property">
                        	<div class="tr-nobdr">
                        		<h3> <%=drDetail["name"] %></h3>
                        	</div>
                        		<div class="txt">
                        			<span class="nowprice">￥<a href="#" style="color:#f73a3a; font-size:36px;"><%=drDetail["Price"] %></a></span>
                        			<div class="cumulative">
                        				<span class="number ty1">累计售出<br><em id="add_sell_num_363"><%=drDetail["sale"] %></em></span>
                        				
                        			</div>
                        		</div>
                        	<div class="txt-h">
                        		<span class="tex-o">简介</span>
                        		<ul class="glist" id="glist" data-monitor="goodsdetails_fenlei_click">
                        			<li><a title="<%=  BLL.Product.Kind.getKindName(drDetail["BS_ProKindCode"].ToString(),"") %>" href=""><%=  BLL.Product.Kind.getKindName(drDetail["BS_ProKindCode"].ToString(),"") %></a></li>
                        			
                        		<!--<li><a title="红色36g" href="">红色36g</a></li>
                        			<li><a title="蓝色16g" href="">红色36g</a></li>-->
                        		</ul>
                        	</div>
                        	<script>
                        	    $(document).ready(function () {
                        	        
                        	        var t = $("#text_box");
                        	     
                        	        $('#min').attr('disabled', true);
                        	       
                        	        $("#add").click(function () {
                        	            t.val(parseInt(t.val()) + 1)
                        	            if (parseInt(t.val()) != 1) {
                        	                $('#min').attr('disabled', false);
                        	            }

                        	        })
                        	      
                        	        $("#min").click(function () {
                        	            t.val(parseInt(t.val()) - 1);
                        	            if (parseInt(t.val()) == 1) {
                        	                $('#min').attr('disabled', true);
                        	            }

                        	        })
                        	    });
                        	</script>  
                        	<div class="gcIpt">
                        		<span class="guT">数量</span>
                        		<input id="min" name="" value="-" disabled="disabled" type="button">  
                        		<input id="text_box" name="" value="1" style="width:30px; text-align: center; color: #0F0F0F;" type="text">  
                        		<input id="add" name="" value="+" type="button">
                        		<span class="Hgt"></span>
                        	</div>
                        	<div class="nobdr-btns">
                        		<button class="addcart hu" onclick="javascript:saveShppingCart('<%=drDetail["id"] %>');"><img src="images/shop.png" width="25" height="25">加入购物车</button>
                        		<button class="addcart yh" onclick="javascript:saveShppingCart('<%=drDetail["id"] %>',1);"><img src="images/ht.png" width="25" height="25">立即购买</button>
                        	</div>
                        	<div class="guarantee">
                        		<span>邮费：￥42&nbsp;&nbsp;</span>
                        	</div>
                        </div>
                        <!--right -->
                        
                    </div>
	<div class="detail">
                		<div class="active_tab" id="outer">
													<ul class="act_title_left">
														
														<li class="act_active">
															<a href="#">商品介绍</a>
														</li>
														
													</ul>
													
													<div class="clear"></div>
												</div>
												<div id="content" class="active_list"> 
													<!--0-->
													<div id="ui-a" class="ui-a">
												        <%=drDetail["content"] %>
												   </div>
												 
												 
												</div>
												
                	</div>
 </div>
 </div>
  </div>
  <div class="clear"></div>
    


    <uc:foot ID="foot1" runat="server" />


 
</body>
</html>
