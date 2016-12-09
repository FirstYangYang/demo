<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BsProItemMore.aspx.cs" Inherits="admin_BsProItemMore" %>

<!--数据操作的页面模板-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>产品明细</title>
    <link href="../style/Style.css" rel="stylesheet" />
    <link href="../style/upload.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../script/jquery-1.7.2.min.js"></script>
    <script type='text/javascript' src="../script/swfupload/swfupload.js"></script>
    <script type='text/javascript' src="../script/swfupload/swfupload.queue.js"></script>
    <script type="text/javascript" src="../script/swfupload/swfupload.handlers.js"></script>
    <script type="text/javascript">
        //初始化上传控件 5.水印 是1 否0  6.生成缩略图 是1 否0
        $(function () {
            InitSWFUpload("../ajax/upload_ajax.ashx", "Filedata", "10240 KB", "../script/swfupload/swfupload.swf", 0, 1);
        });
    </script>
    <script type="text/javascript" src="../script/jQueryPlugin.js"></script>
    <script type="text/javascript" src="../script/JavaScript.js"></script>
    <link href="../script/ui/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="../script/ui/js/ligerBuild.min.js" type="text/javascript"></script>
    <script charset="utf-8" src="../hn_editor/kindeditor.js"></script>
    <script charset="utf-8" src="../hn_editor/lang/zh_CN.js"></script>

    <script type="text/javascript">
        KindEditor.ready(function (K) {
            window.editor = K.create('#KK_Content', { width: '98%', height: '400px' });
        });
    </script>
</head>
<body>
    <div class="column_Box mainAutoHeight">
    <form id="frmList" runat="server">
    <div id="divHead" class="divHead">
      
        <div style="clear: both; font-size: 1px; height: 1px;">
        </div>
    </div>
    <!--Foot-->
    <div id="divDtls" class="divFoot body" runat="server">
        <div class="tab">
            <ul>
                <li class="current"><a href="javascript:" onfocus="blur()">基本信息</a></li>
                <li><a href="javascript:" onfocus="blur()">详细描述</a></li>
            </ul>
        </div>
        <div class="wrapBox">
            <input type="text" runat="server" id="PKID" visible="false" />
            <div class="body">
                <table class="defaultTbl" cellpadding="1px" cellspacing="1px">
                    <colgroup>
                        <col width="120px" />
                        <col />
                        <col width="120px" />
                        <col />
                    </colgroup>
                    <tr style="display:none;">
                        <td class="tdLeft">
                            产品编号：
                        </td>
                        <td colspan="3">
                            <input class="textBg" title="产品编号" type="text" lock="1" runat="server" id="KK_Code" style="width: 250px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdLeft">
                            产品分类：
                        </td>
                        <td colspan="3">
                            <asp:DropDownList runat="server" title="产品分类" CssClass="dropList" ID="KK_Bs_ProKindCode">
                            </asp:DropDownList>
                        </td>
                     </tr>
                    <tr>
                        <td class="tdLeft">
                            产品名称：
                        </td>
                        <td colspan="3">
                            <input class="textBg" title="名称" type="text" runat="server" id="KK_Name" style="width: 250px" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="tdLeft">
                            项目简述：
                        </td>
                        <td colspan="3">
                            <input class="textBg" title="简述 type="text" runat="server" id="KK_Notes" style="width: 250px" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="tdLeft">
                            产品图片：
                        </td>
                        <td colspan="3">
                            <div class="hn_upload">
                                <input type="text" class="txtInput normal" lock="1" />
                                <div class="upload_btn">
                                    <span id="upload"></span>
                                </div>
                                <label>
                                    &nbsp;可以上传多张图片。图片最小尺寸：500px * 285px ，请按照图片比例上传</label>
                                <div class="clear">
                                </div>
                                <input type="hidden" id="focus_photo" name="focus_photo" runat="server" class="input_1"
                                    value="" />
                                <!--封面隐藏值.结束-->
                                <!--上传提示.开始-->
                                <div id="show">
                                </div>
                                <!--上传提示.结束-->
                                <!--图片列表.开始-->
                                <div id="show_list">
                                    <ul>
                                        <asp:Literal ID="LitAlbumList" runat="server"></asp:Literal>
                                    </ul>
                                </div>
                                <!--图片列表.结束-->
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdLeft">
                            排 序：
                        </td>
                        <td colspan="3">
                            <input class="textBg" value="0" title="排序" type="text" runat="server" id="KK_sortNo"
                                style="width: 250px" />
                        </td>
                    </tr>
                    <tr style="display:none;">
                        <td class="tdLeft">
                            属性：
                        </td>
                        <td colspan="3">
                            <%--<asp:CheckBox ID="KK_Status" Text="隐藏" runat="server" />&nbsp;&nbsp;--%>
                            <asp:CheckBox
                                ID="KK_isPromote" Text="是否推荐" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body">
                <table class="defaultTbl" cellpadding="1px" cellspacing="1px">
                    <colgroup>
                        <col width="120px" />
                        <col />
                        <col width="120px" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="tdLeft">
                            产品详细：
                        </td>
                        <td class="tdContent" colspan="3">
                            <textarea title="产品详细" runat="server" id="KK_Content"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <table class="defaultTbl" cellpadding="1px" cellspacing="1px">
            <colgroup>
                <col width="120px" />
                <col />
                <col width="120px" />
                <col />
            </colgroup>
            <tr>
                <td class="tdLeft">
                    操 作：
                </td>
                <td>
                    <asp:Button ID="btnSvAdd" runat="server" CssClass="SrvButton" Text="保存新增" Visible="false"
                        OnClick="btnSvAdd_Click" />&nbsp;
                    <asp:Button ID="btnSvEdit" runat="server" CssClass="SrvButton" Text="保存修改" Visible="false"
                        OnClick="btnSvEdit_Click" />&nbsp;
                    <input type="button" id="btnReturn" runat="server" class="SrvButton" value="关　　闭"
                        onclick="window.close();" />
                </td>
            </tr>
        </table>
    </div>
    <div id="divHelp" class="divFoot" style="margin-top: 40px; display: none">
        <table class="defaultTable" cellpadding="1px" cellspacing="1px">
            <tr>
                <th colspan="4">
                    功能操作说明
                </th>
            </tr>
            <tr>
                <td class="lefttd" style="width: 150px">
                    ［新增记录］
                </td>
                <td colspan="3">
                    点击［新增记录］打开详细内容界面，输入完相应信息后，点击下方的［保存新增］。
                </td>
            </tr>
            <tr>
                <td class="lefttd" style="width: 150px">
                    ［删除选中项］
                </td>
                <td colspan="3">
                    首先选中列表中的行记录(可多选)，点击［删除选中项］，删除选中的行记录，删除后不可恢复。
                </td>
            </tr>
        </table>
    </div>
    </form></div>
</body>
</html>
