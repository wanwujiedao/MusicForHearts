<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/inc/meta.jsp" %>

		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/user/register.css"/>

<div id="myParCont">
	<div class="row" id="content">
		<div class="vbox">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8" id="register_content">
					<!--头像信息-->
					<div class="clearfix text-center m-t">
							<div class="inline">
								<div class="easypiechart" data-percent="75" data-line-width="5" data-bar-color="#4cc0c1" data-track-Color="#f5f5f5" data-scale-Color="false" data-size="134" data-line-cap='butt' data-animate="1000">
								    <div class="thumb-lg">
								    	<img src="/sources/useravatar/default_avatar.png" class="img-circle" id="imgpre" width="150" height="150" alt="...">
								    </div>
								</div>
							</div>
					</div>
					<br />
					<!-- 基本信息填写 -->
					<small class="text-muted m-b">
						<form action="${ctx}/user/register" class="bs-example form-horizontal" id="register_form"  method="post" enctype="multipart/form-data" onsubmit="return check(this)">

							<div class="form-group">

								<label class="col-lg-2 col-md-2 control-label" for="photos">头像：</label>
								<div class="col-lg-9 col-md-9">
									<input type="file" class="filestyle" name="photos" id="photos" data-classButton="btn btn-default" data-classInput="form-control inline v-middle input-s">
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-2 col-md-2 control-label" for="username">用户名：</label>
			                   	<div class="col-lg-9 col-md-9">
			                    	<input type="text" name="username" id="username" class="form-control" title="用户名"  placeholder="请填写用户名" required="required">
			                   	</div>
			                   	<div class="col-lg-1 col-md-1 flag-img-box" id="username_flag">
			                   		
			                   	</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 col-md-2 control-label" for="password">密码：</label>
			                   	<div class="col-lg-9 col-md-9">
			                    	<input type="password" name="password" id="password"  title="密码" class="form-control" placeholder="请填写密码" required="required">
			                   	</div>
								<div class="col-lg-1 col-md-1 flag-img-box" id="password_flag">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 col-md-2 control-label" for="password2">确认密码：</label>
			                   	<div class="col-lg-9 col-md-9">
			                    	<input type="password" name="password2" id="password2"  title="确认密码" class="form-control" placeholder="请确认密码" required="required">
			                   	</div>	
			                   	<div class="col-lg-1 col-md-1 flag-img-box" id="password2_flag">
			                   	</div>
							</div>
							<div class="form-group">
								<label id="email_label" class="col-lg-2 col-md-2 control-label" for="email">邮箱：</label>
								<div class="col-lg-9 col-md-9">
									<input type="email" name="email" id="email" class="form-control"  title="邮箱" placeholder="请输入常用邮箱" required="required">
								</div>
								<div class="col-lg-1 col-md-1 flag-img-box" id="email_flag">
								</div>
							</div>

							<div class="form-group">
			                    <label id="name_label" class="col-lg-2 col-md-2 control-label" for="name">真实姓名：</label>
			                    <div class="col-lg-9 col-md-9">
			                        <input type="text" name="name" id="name" class="form-control"  title="真实姓名" placeholder="请输入您的真实姓名">
			                    </div>
		                    </div>


		                    <div class="form-group">
				                 <label class="col-lg-2 col-md-2 control-label">性别：</label>
				                 <div class="col-lg-9 col-md-9">
				                    <div class="radio">
					                    <label>
					                      <input type="radio" name="sex" id="optionsRadios1" value="1" checked>男
					                    </label>
					                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                    <label>
					                      <input type="radio" name="sex" id="optionsRadios2" value="0">女
					                    </label>
				                    </div>
				                </div>
							</div>



							<div class="form-group">
			                   <label class="col-lg-2 col-md-2 control-label" for="qq">QQ：</label>
			                   <div class="col-lg-9 col-md-9">
			                     <input type="text" name="qq" id="qq"  title="QQ号码" class="form-control" placeholder="请填写QQ">
			                   </div>
								<div class="col-lg-1 col-md-1 flag-img-box" id="qq_flag">
								</div>
			                </div>

							<div class="form-group">
								<label class="col-lg-2 col-md-2 control-label" for="tel">手机号码：</label>
								<div class="col-lg-9 col-md-9">
									<input type="text" name="tel" id="tel"  title="手机号码" class="form-control" placeholder="请填写手机号码">
								</div>
								<div class="col-lg-1 col-md-1 flag-img-box" id="tel_flag">
								</div>
							</div>


							<div class="form-group">
			                   <label class="col-lg-2 col-md-2 control-label" for="info">个人介绍：</label>
			                   <div class="col-lg-9 col-md-9">
			                     <input type="text" name="info" id="info" class="form-control"  title="个人简介" placeholder="请填写个人介绍">
			                   </div>
			                </div>
			                <div class="form-group">
			                   <div class="col-lg-offset-2 col-lg-9 col-md-offset-2 col-md-9">
			                     <button type="submit" id="register_sumbit" class="btn btn-primary text-right">注册</button>
			                   </div>
			                </div>
						</form>
					</small>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
		<script src="${ctx}/static/js/apps/server/register.js" type="text/javascript" charset="utf-8"></script>
	</div>
</div>

