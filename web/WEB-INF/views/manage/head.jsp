<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<style type="text/css">
    .manage-menu {
        background-color: #2F4F4F;
        color: #FFFEFA;
        margin: auto;
        font-size: 18px;
        height: 60px;
    }

    .dao-menu ,.da-menu{
        text-align: center;
        float: left;
        margin-left: 15px;
        width: 100px;
        line-height: 60px;
        cursor: pointer;
        transition: 0.4s ease-out;
        -moz-transition: 0.4s ease-out;
        -webkit-transition: 0.4s ease-out;
    }

    .dao-menu:hover {
        background: #000000;
        color: #00FF00;
    }

    .clickmenu {
        background: #483D8B;
        color: #EED2EE;
    }
</style>

<script>

    $(function(){
        if(currentUser[0]!=null){
            if(currentUser[0].permission>1){
                $('#logintrue-username').text(currentUser[0].username);
                $('#logintrue-poster').prop('src', currentUser[0].userposter);
            }
        }


        $('.dao-menu').click(function(){
            //$('.dao-menu').removeClass('clickmenu');
            location.href = $_ctx+'/manage/'+this.id;
        });


    })
</script>

<div class="manage-menu row">
    <div class="col-md-10 col-md-offset-1">
        <div class="dao-menu" id="home-page" style="float: left;width: 200px">音乐&nbsp;<font color="#FF0000"><span
                class="glyphicon glyphicon-headphones"></span></font>&nbsp;唯懂我心</div>
        <div class="dao-menu" id="user-show">用户管理</div>
        <div class="dao-menu" id="music-show">音乐管理</div>
        <div class="dao-menu" id="advice-show">留言管理</div>
        <div class="dao-menu" id="noticy-show">通知管理</div>
        <div class="dao-menu" id="complain-show">举报管理</div>
        <div class="dao-menu" id="super-manage">超管专区</div>
        <div class="da-menu"><img width="35px" style="height: 35px; border-radius: 50%" id="logintrue-poster"/>&nbsp;<span  id="logintrue-username"></span></div>
    </div>
</div>