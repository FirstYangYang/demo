<%@ Page Language="C#" AutoEventWireup="true" CodeFile="layer.aspx.cs" Inherits="layer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>layer用法</title>
     <script src="jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="layer.js" type="text/javascript"></script>
    <script type="text/javascript">
        var jq_191 = $.noConflict(true);
    </script>
    <script>
        jq_191(function () {
            jq_191(".Demo").click(function () {
                var id = jq_191(this).attr("id");
                switch (id) 
                {
                    case "D1": d1(); break;
                    case "D2": d2(); break;
                    case "D3": d3(); break;
                    case "D4": d4(); break;
                    case "D5": d5(); break;
                }
            })


            //提示框，带确定[提示内容，图标编号]
            function d1() {
                layer.alert('恭喜您成功注册本网站帐号', 1);
            }

            //信息框[提示内容，几秒后关闭，图标编号]
            function d2() {
                layer.msg('前端攻城师贤心', 2, 2);
            }

            //询问框

            //快捷调用：layer.confirm();
            function d3() {
                jq_191.layer({
                    shade: [0], //不显示遮罩
                    area: ['auto', 'auto'], //宽度，高度
                    dialog: {
                        msg: '你是否喜欢前端开发？', //提示内容
                        btns: 2, //按钮个数
                        type: 2, //图标编号
                        btn: ['是', '否'], //按钮内容
                        yes: function () {
                            layer.msg('您选择了是。', 2, 1);
                        },
                        no: function () {
                            layer.msg('您选择了否', 2, 4);
                        }
                    }
                });
            }


            //加载中
            function d4() {
                var loadi = layer.load("加载中.......");
                jq_191(".xubox_shade").click(function () {
                    layer.close(loadi);
                });
            }

            //iframe层之正中央，可用于播放视频
            function d5() {
                jq_191.layer({
                    type: 2,
                    title: '天之痕三个人的时光-半抱琵琶版',
                    iframe: { src: 'http://www.tudou.com/v/Rvy0IbYmBrQ/&resourceId=0_04_05_99/v.swf' },
                    area: ['750px', '466px'],
                    offset: ['100px', '']
                });
            }



        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" margin:50px;">
    <input id="D1" class="Demo" type="button" value="提示框" />
    <input id="D2" class="Demo" type="button" value="信息框" />
    <input id="D3" class="Demo" type="button" value="询问框" />
    <input id="D4" class="Demo" type="button" value="加载中" />
    <input id="D5" class="Demo" type="button" value="弹窗视频" />
    </div>
    </form>
</body>
</html>
