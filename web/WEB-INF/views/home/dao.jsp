<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/inc/taglibs.jsp" %>
<%@ include file="/WEB-INF/views/inc/meta.jsp" %>
<%@ include file="/WEB-INF/views/inc/link.jsp" %>
<script src="${ctx}/static/plugs/qtdist/viewer.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/plugs/qtdist/viewer.css"/>
<script type="text/javascript">

 $(function(){
	 $('.images').viewer({
			inline:true,
			button:false,
			colse:true,
		});
 });

</script>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}


.AiTingSpan{
font-size: 2em;
margin-left: 40px;
margin-top: 110px;
color: #CD2990;
}

#AiTing img{
	width: 240px;
	height: 160px;
	border: 1px solid white;
}
div.imgs{
	width: 1050px;
	height: 550px;
	margin: auto;
	margin-top: 80px;
}
ul.images>li{
	float: left;
	list-style: none;
}
ul.images>li.clear{
	clear: both;
}

</style>
<div class="row" style="margin-top: 30px">
<div class="home-bar home-myhome"><span>开发家园</span></div>
	<div>

		<div id="AiTing">
			<div class="imgs">
				<ul class="images">
					<li><img src="/sources/numberImg/1.jpg" alt="Picture"></li>
					<li><img src="/sources/numberImg/2.jpg" alt="Picture 2"></li>
					<li><img src="/sources/numberImg/3.jpg" alt="Picture 3"></li>
					<li><img src="/sources/numberImg/4.jpg" alt="Picture"></li>
					<li><img src="/sources/numberImg/5.jpg" alt="Picture 2"></li>
					<li><img src="/sources/numberImg/6.jpg" alt="Picture 3"></li>
					<li><img src="/sources/numberImg/7.jpg" alt="Picture"></li>
					<li><img src="/sources/numberImg/8.jpg" alt="Picture 2"></li>
					<li><img src="/sources/numberImg/9.jpg" alt="Picture 3"></li>
					<li><img src="/sources/numberImg/10.jpg" alt="Picture"></li>
					<li><img src="/sources/numberImg/11.jpg" alt="Picture 2"></li>
					<li><img src="/sources/numberImg/12.jpg" alt="Picture 3"></li>
					<li class="clear"></li>
				</ul>
			</div>
		</div>
		</div>

</div>
