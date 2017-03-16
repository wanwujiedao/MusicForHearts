<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<style>
    .apply-know{
        width: 800px;
        margin: auto;
        margin-top: 30px;
    }
    .apply-know p {
        line-height: 20px;
        font-size: 15px;
        font-family: 幼圆;
        color: #458B00;;
        transition: 0.2s ease-out;
        -moz-transition: 0.2s ease-out;
        -webkit-transition: 0.2s ease-out;
    }

    .apply-know p:hover {
        color: #000000;
        width: auto;
        transform: scale(1.05);
        -ms-transform: scale(1.05);
        -moz-transform: scale(1.05);
        -webkit-transform: scale(1.05);
        background-color: #BCE8F1;
    }
    #toapply{
        margin-top: 30px;
    }
</style>

<div class="col-md-10 col-md-offset-1">
    <div class="applyknow">
        <center><h3>申请须知</h3></center>
        <span>&nbsp;&nbsp;&nbsp;尊敬的用户${currentUser.username}，您好！欢迎您常驻音乐唯懂我心网站，您可以在在本网站欣赏音乐，本页面是为了壮大本站的联盟，您可以申请管理员职位，只要超级管理员通过即可成为本网站的管理员，当然申请管理员必须有如下要求。</span>

        <div class="apply-know">
            <p>1.首先您的等级需要达到10级以上（包含10级）</p>

            <p>2.有过对该网站进行评价</p>

            <p>3.必须是普通用户</p>

            <p>4.最终决策：超级管理员</p>
        </div>
    </div>

    <div class="myapply col-md-8 col-md-offset-2">
        <form id="myapply_form" action="${ctx}/apply" method="post" onsubmit="return checkapply()">
            <div class="form-group  has-feedback">
                <label for="reason" class="control-label col-md-2"><font color="#458B00">申请理由:</font></label>

                <div class="form-group" style="display: none">
                    <label class="col-lg-2 col-md-2 control-label" for="userid">用户ID：</label>
                    <div class="col-lg-9 col-md-9">
                        <input type="text" name="userid" id="userid" class="form-control" value="${currentUser.id}" title="用户ID"   required="required">
                    </div>
                </div>

                <div class="col-md-11">
                    <textarea name="reason" id="reason" type="text"  class="form-control" placeholder="请输入申请理由"  title="申请理由" rows="3"></textarea>
                </div>
                <div class="col-sm-3 col-sm-offset-7">
                    <input type="submit" id="toapply" class="btn btn-success btn-block"  value="提交申请理由"/>
                </div>
            </div>
        </form>
    </div>

</div>
<script>



   function checkapply(){
       if(currentUser[0].grade<10){
           window.wxc.xcConfirm('申请信息：尊敬的用户，您的等级尚未达到10级，不能提交申请！', window.wxc.xcConfirm.typeEnum.info, {
               title: "小提醒"
           });
           return false;
       }
       if(true){}//对是否有过评价进行处理
       if(currentUser[0].permission!=1){
           window.wxc.xcConfirm('申请信息：尊敬的用户，您不是普通用户，不能提交申请！', window.wxc.xcConfirm.typeEnum.info, {
               title: "小提醒"
           });
           return false;
       }
       if($('#reason').val()==''){
           window.wxc.xcConfirm('申请信息：尊敬的用户，申请理由为空，不能提交申请！', window.wxc.xcConfirm.typeEnum.info, {
               title: "小提醒"
           });
           $('#reason').focus();
           return false;
       }
       return true;
   }
</script>