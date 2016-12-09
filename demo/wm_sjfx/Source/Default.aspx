<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%= BLL.Sys.Config.getSiteConfig("", "", "")%>
    <uc:info ID="global1" runat="server" />
</head>
<body>

<!--头部-->
<uc:head ID="head1" runat="server" />
      <uc:banner ID="banner1" runat="server" />
<!--底部-->

    
    <link href="css/owl.carousel.css" rel="stylesheet" />
    <script src="js/owl.carousel.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#scroll').owlCarousel({
            items: 4,
            autoPlay: true,
            navigation: true,
            navigationText: ["", ""],
            scrollPerPage: true
        });
    });
</script>
    <div class="pro">
  <h2>品牌与产品</h2>
  <h3></h3>
  <h4>永远奉行“一切为了用户”这一宗旨为目标</h4>
</div>
<div class="scroll-outer">
  <div id="scroll" class="owl-carousel">     
          <div class="item">
            <a href="Product.aspx"  title="长寿之源（乾坤清）" ><img src="images/pro1.png"  alt="长寿之源（乾坤清）" title="长寿之源（乾坤清）"><h2></h2></a>
            <div class="txt">
                <h3><a href="Product.aspx"  title="长寿之源（乾坤清）" >长寿之源（乾坤清）</a></h3>
               
            </div>
        </div>        <div class="item">
            <a href="Product.aspx"  title="纳米球斯太尔小盒" ><img src="images/pro2.jpg"  alt="纳米球斯太尔小盒" title="纳米球斯太尔小盒"><h2></h2></a>
            <div class="txt">
                <h3><a href="Product.aspx" title="纳米球斯太尔小盒" >纳米球斯太尔小盒</a></h3>
               
            </div>
        </div>        <div class="item">
             <a href="Product.aspx"  title="长寿之源（乾坤清）" ><img src="images/pro1.png"  alt="长寿之源（乾坤清）" title="长寿之源（乾坤清）"><h2></h2></a>
            <div class="txt">
                <h3><a href="Product.aspx"  title="长寿之源（乾坤清）" >长寿之源（乾坤清）</a></h3>
               
            </div>
        </div>
      
      <div class="item">
            <a href="Product.as[x"  title="纳米球斯太尔小盒" ><img src="images/pro2.jpg"  alt="纳米球斯太尔小盒" title="纳米球斯太尔小盒"><h2></h2></a>
            <div class="txt">
                <h3><a href="Product.aspx" title="纳米球斯太尔小盒" >纳米球斯太尔小盒</a></h3>
               
            </div>
        </div>       

  </div>
  <div class="clear"> </div>
</div>
<div class="about">
  <h2>公司简介</h2>
  <h3></h3>
  <h4>永远奉行“一切为了用户”这一宗旨为目标</h4>
  <div class="inner">
    <div class="aba"> <p>　公司倡导以人为本的管理理念，重视人才培养科技创新，产学研结合，自2006年，自筹资金委托北京航空航天大学，组织科研人员，进行固体润滑剂材料和制备技术的研究开发。2007年与北京航空航天大学签署了技术开发协议，建立了长期的战略性合作关系。与北京航空航天大学共同成立了“金属非晶体新材料新技术中试及博士研究生实习基地”。2009年经山东省科技厅批准依托山东万众科技有限公司和北京航空航天大学材料科学与工程学院，组建了“山东省微纳米球机械节能工程技术研究中心”。在以北京航空航天大学材料科学与工程学院教授、博士生导师，教育部长江学者特聘教授、国家杰出青年基金获得者，国家“973项目”首席科学家张涛教授为首的科研团队的共同努力下，历经四年时间成功研发了适用于燃油机动车节能减排产品“原子自组装纳米球固体润滑剂”。该产品于2009年6月顺利通过了山东省科技成果鉴定，鉴定结论为：该润滑油添加剂用于汽车发动机，可降低油耗、增加动力，效果明显。具有高硬度、低杨氏模量和低表面能特点的润滑剂，其成分设计及制备工艺具有创新性，填补了润滑油合金基添加剂的技术空白，在合金基成分润滑油添加剂方面达到了国际领先水平。</p>
<p>&nbsp;</p>
<p><br /><br /></p> <a href="About.aspx"  class="more">了解更多>></a> <br>
      <br>
      <br>
      <br>
      <br>
      <div class="clear"></div>
    </div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
</div>
<uc:foot ID="foot1" runat="server" />
<!--底部-->
</body>
</html>
