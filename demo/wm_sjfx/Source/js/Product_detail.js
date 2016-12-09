//添加购物车
function saveShppingCart(id, toCheckout) {

   
    var qty = 1;
    if (id == '') {
        var id = $("#txtProId").val();
        qty = $("#selQty").val();
    }
    else {
        var id = id;
        qty = 1
    }
    $.ajax({
        type: "post",
        url: "ajax/UpdateCart.aspx",
        data: { "action": "add", "pid": id, "qty": qty, "size": "" },
        success: function (data) {
            if (data == "1") {
                if (toCheckout)
                { location.assign("Checkout.aspx"); } else
                { location.assign("ShopCar.aspx"); }

            }
            else if (data == "0") {
                window.location = "login.aspx";

            }
        },
        error: function () {
            alert("添加到购物车失败！");
        }
    });
}
function ChooseSize(obj) {
    $("#siez_choose").html("已选择“<span>" + obj + "</span>”")
    $("#ProSize").val(obj)
}

//更新数量
function setProNum(id, qty, size) {

    if (!isNaN(qty)) {
        $.ajax({
            type: "post",
            url: "ajax/UpdateCart.aspx",
            data: { "action": "edit", "pid": id, "qty": qty, "size": size },
            success: function (data) {
                if (data == "1") {
                    window.location = "ShopCar.aspx";
                }
            }
        });
    } else {
        alert("输入数量不正确,请重新输入!");
    }
}

//删除购物车产品
function delProInCart(proCode) {
    if (confirm("确认要删除该商品？")) {
        $.ajax({
            type: "post",
            url: "ajax/UpdateCart.aspx",
            data: { "action": "del", "pid": proCode },
            success: function (data) {
                if (data == "1") {
                    window.location = "ShopCar.aspx";
                }
            }
        });
    }
}
//清空购物车
function clearShopCar() {
    if (confirm("确认要清空购物车?")) {
        location.href = "ajax/UpdateCart.aspx?action=clear";
    }
}

//添加到收藏夹
function saveFav(id) {
    $.ajax({
        type: "post",
        url: "ajax/AddFav.aspx",
        data: { "action": "add", "id": id },
        success: function (data) {
            if (data == "1") {
                alert("收藏成功!");
                //var answer = confirm("是否转到商品收藏列表?");
                //if (answer) {
                //    window.location = "myfav.html"
                //}
            } else {
                alert("收藏失败,请先登录!");
                window.location = "logins.aspx";
            }
        }

    });
}

//添加礼品到收藏夹
function saveGiftFav(id, from) {

    if (id == '') {
        var id = $('#txtProId').val();
    }
    else {
        var id = id;
    }

    $.ajax({
        type: "post",
        url: "ajax/AddFav.aspx",
        data: { "action": "addgift", "id": id },
        success: function (data) {
            if (data == "1") {
                alert("礼品收获收藏成功!");
                var answer = confirm("是否转到礼品收藏列表?");
                if (answer) {
                    window.location = "myGiftfav.aspx"
                }
            } else {
                alert("收藏失败,请先登录!");
                window.location = "login.aspx?from=" + from;
            }
        }

    });

}

//删除收藏商品
function deleteFav(pid) {
    if (confirm("确认要删除该收藏？")) {
        $.ajax({
            type: "post",
            url: "ajax/AddFav.aspx",
            data: { "action": "del", "id": pid },
            success: function (data) {
                if (data == "1") {
                    window.location = "myfav.aspx";
                    alert("删除成功!");
                }
            }
        })
    }
}

//删除收藏礼品
function deleteGiftFav(pid) {
    if (confirm("确认要删除该收藏？")) {
        $.ajax({
            type: "post",
            url: "ajax/AddFav.aspx",
            data: { "action": "delgift", "id": pid },
            success: function (data) {
                if (data == "1") {
                    window.location = "myGiftFav.aspx"
                    alert("删除成功!");
                }
            }
        })
    }
}
//发表咨询
function squest() {
    var pid = $("#txtProId").val();
    var title = $("input[name='pointType']:checked").val();
    if (title == undefined) {
        $("#pointerror").show();
    }
    else {
        $("#pointerror").hide();
    }
    var Textarea1 = $("#Textarea1").val();
    $.ajax({
        type: "post",
        url: "ajax/quan.aspx",
        data: { "action": "add", "id": pid, "title": title, "content": Textarea1 },
        success: function (data) {
            if (data == "1") {
                alert('添加咨询成功');
                window.location.reload();

            }
            else {
                alert("添加咨询失败,请先登录!");
                window.location = "Login.html";

            }
        }

    })
}
//发表评价
function scommnet() {
    var pid = $("#txtProId").val();
    var grade = $("input[name=grade]:checked").val();
    var title = $("#cotitle").val();
    var content = $("#cocontent").val();
    if (grade == undefined) {
        alert('请评分');
        return false;
    }
    if (title.length == 0) {
        alert('请输入标题');
        return false;
    }
    if (content.length <= 10) {
        alert('内容必须大于10字符');
        return false;
    }

    $.ajax({
        type: "post",
        url: "ajax/quan.aspx",
        data: { "action": "coadd", "id": pid, "grade": grade, "title": title, "content": content },
        success: function (data) {
            if (data == "1") {
                alert('添加评价成功');
                window.location.reload();

            }
            else {
                alert("添加评价失败,请先登录!");
                window.location = "Login.html";

            }
        }

    })

}
function cancel_order() {
    var answer = confirm("确认取消订单？")
    if (answer) {
        var orderCode = $("#orderCode").val();
        $.ajax({
            type: "post",
            url: "ajax/checkorder.aspx",
            data: { "action": "cancel", "ordercode": orderCode },
            success: function (data) {
                if (data == "1") {
                    alert('订单取消成功!');
                    window.location.reload();
                }
            }
        })
    }
}

function cancel_ordergift() {
    var answer = confirm("你确认取消礼品订单吗?")
    if (answer) {
        var orderCode = $("#orderCode").val();
        $.ajax({
            type: "post",
            url: "ajax/checkorder.aspx",
            data: { "action": "cancelgift", "ordercode": orderCode },
            success: function (data) {
                if (data == "1") {
                    alert('取消礼品订单成功');
                    window.location.reload();

                }
            }

        })
    }
}

function submitorder(orderCode) {
    var answer = confirm("您确认收到商品?")
    if (answer) {
        if (!orderCode)
            orderCode = $("#orderCode").val();
        $.ajax({
            type: "post",
            url: "ajax/checkorder.aspx",
            data: { "action": "comfirm", "ordercode": orderCode },
            success: function (data) {
                if (data == "1") {
                        window.location.reload();
                }
            }

        })

    }
}

function submitgiftorder() {
    var answer = confirm("你确认收到礼品吗?")
    if (answer) {
        var orderCode = $("#orderCode").val();
        $.ajax({
            type: "post",
            url: "ajax/checkorder.aspx",
            data: { "action": "confirmgift", "ordercode": orderCode },
            success: function (data) {
                if (data == "1") {
                    alert('订单已经完成，感谢你的支持');
                    window.location.reload();

                }
            }

        })

    }
}

function order_pay() {
    var answer = confirm("是否现在进行在线支付?")
    if (answer) {
        var orderCode = $("#orderCode").val();
        //var payType = $("input[name=payType]:checked").val();
        var payType = $("#payType").val();

        window.location = "pay/paystart.aspx?code=" + payType + "&type=OD&num=" + orderCode;
    }
}


function check_out(code) {
    var op = $("#hn_county option:selected").html();
    if (code == "03") {
        $.ajax({
            type: "post",
            url: "ajax/checkarea.aspx",
            data: { "name": op },
            success: function (data) {
                if (data != "1") {
                    $(".payType")[2].checked = false;
                    alert('你所在的地区暂不支持货到付款，请重新选择');
                }

            }

        })
    }

}
$(function () {
    $(".cartProNum a").bind('click', function () {
        var obj = $(this);
        var classtype = obj.attr("class");
        var proId = obj.attr("proid");
        var buynum = obj.siblings(".buynum").val();
        var size = "";
        if (classtype == "minus")
        {
            if (buynum > 1)
                buynum--;
            else
                return;
            setProNum(proId, buynum, size)
        } else if (classtype == "add")
        {
            if (buynum >= 9999)
                return;
            buynum++;
            setProNum(proId, buynum, size)
        }
    })
    //使用积分购买
    $("#J_Point #tmallPoint_1").attr("checked", false);
    $("#J_Point #tmallPoint_1").bind('click', function () {
        var choose = $(this).attr("checked");       
        if (choose == "checked") {
            $("#J_Point").removeClass("point-off");
        } else {
            $("#J_Point").addClass("point-off");
        }
    })
    
    try {
        totalpay = parseFloat(totalpay).toFixed(1);
    } catch (e) {

    }
    $("#J_PointInput").bind('keyup', function () {
        var point = $(this).val();
       
        if (isNaN(point)) {
            $(".mui-msg").show();
            $(this).val(0);
            $(".mui-msg-content").html("使用景观币必须为大于或等于0的整数");
            return;
        }
        if (point > (usableScore/10)) {
            $(".mui-msg-content").html("本次最多可用" + usableScore/10+ "景观币");
            point = usableScore/10;
            $(this).val(usableScore/10);
            $(".mui-msg").show();
        } else if (point > parseInt(totalpay))
        {
            point = parseInt(totalpay);
            $(this).val(point);
            
        } else {
            $(".mui-msg").hide();
        }
        var deliverPay = parseFloat($("#deliverPay").html());//物流
        var proFee = parseFloat($("#proFee").val())//货款
        var subPya = parseFloat(point).toFixed(1);
        var lastPay = parseFloat(totalpay - subPya);
   
        var lastPay2 = parseFloat(lastPay + deliverPay).toFixed(1);
       
        $("#proFee").val(lastPay.toFixed(1));
        $("#proFeeall").html(lastPay.toFixed(1));
        $("#J_Discharge").html(subPya);//积分抵换
        $("#totalPay").html(lastPay2);//需要支付
    });
   
})
