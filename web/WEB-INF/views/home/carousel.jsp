<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${ctx}/static/css/home/carousel.css">

<div id="carousel-example-generic" class="carousel slide " 	data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		<li data-target="#carousel-example-generic" data-slide-to="3"></li>
		<li data-target="#carousel-example-generic" data-slide-to="4"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<a href="${ctx }/page/mv-player?id=1">
				<img src="/sources/carousel/carousel0.jpg" alt="..." class="carouselimg">
			</a>
			<div class="carousel-caption">
				<h3>RUN TO YOU: 许阁《Along the Days》</h3>
			</div>
		</div>
		<div class="item">
			<a
				href="${ctx }/page/mv-player?id=16"><img
				src="/sources/carousel/carousel1.jpg" alt="..." class="carouselimg"></a>
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<a
				href="${ctx }/page/mv-player?id=31">
				<img src="/sources/carousel/carousel2.jpg" alt="..." class="carouselimg">
			</a>
			<div class="carousel-caption">

				<h3>李荣浩《满座》</h3>

			<%----%>
				<%--<p class="text">李荣浩新专辑《有理想》第二波主打《满座》MV首播！词曲由李荣浩创作，陈宏一执导MV。李荣浩从自我出发，重新审视活在当下的孤独快乐和大不易，看似消极却早有领悟。得失不过是过程，就算没有高朋满座的辉煌，若能体验人生寻求自我，何尝不是另一种灿烂。</p>--%>

					<%--担任center，这也是她参加的最后一张单曲，完整版PV已经公开！新曲PV由#高橋栄樹#担当导演，以交--%>

					<%--接棒位主题，用一首元气的歌曲来讲述分别，「会いたかった」中的灯塔好怀念！</p>-->--%>

			</div>
		</div>
		<div class="item">
			<a
				href="${ctx }/page/mv-player?id=27">
				<img src="/sources/carousel/carousel3.jpg" alt="..." class="carouselimg">
			</a>
			<div class="carousel-caption">

				<h3></h3>
				<!-- <p class="text">罗志祥新专辑《真人秀?》第三波主打《幸福特调》MV官方版首播！罗志祥首度与韩国女 子组合miss
				 	A秀智合作，充满幸福感的特调蜜情歌！MV由导演邝盛掌镜，让人惊喜的是秀智的中文歌词 唱得非常标准，今年最受关注的男女对唱情歌！</p>-->
			</div>
		</div>
		<div class="item">
			<a
				href="${ctx }/page/mv-player?id=24">
				<img src="/sources/carousel/carousel4.jpg" alt="..." class="carouselimg">
			</a>
			<div class="carousel-caption">
				<h3>王铮亮《相爱一场》</h3>

				<p class="text">《相爱一场》是一首温柔却虐心的情歌，以纯净的钢琴伴奏开场，王铮亮安静的娓娓

					道来一场过往爱情里留下的残念，那些无法遗忘的遗憾心情，在王铮亮温柔的歌声中渗透进心里，勾起 无尽的酸楚。</p>

			</div>


		</div>

		<!-- Controls -->
		<a class="left carousel-control myarrow"
			href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-menu-left" aria-hidden="true" ></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control myarrow" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>



