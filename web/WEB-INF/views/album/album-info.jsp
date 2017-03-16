<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<style type="text/css">


    .album-wrap{
        margin-top: 20px;
    }
    .album-other>span{
        display: block;
        font-family: "微软雅黑";
        font-weight: bold;
        font-size: 18px;
        margin-top: 12px;
    }
    .album-poster>img{
        height: 250px;
        width: 250px;
        border-radius:12px ;
    }
    .album-other{
        height: 250px;
    }
</style>

<div class="album-wrap col-md-10 col-md-offset-1">

    <div class="album-msg">
        <div class="album-poster col-md-4">
            <img title="专辑封面" alt="专辑封面" id="album-poster"/>
        </div>
        <div class="album-other col-md-8">
            <span id="album-name"></span>
            <span id="album-artist"></span>
            <span id="album-addtime"></span>

            <span id="album-info"></span>
        </div>
    </div>
</div>

<script type="text/javascript">
    var albumid=${albumid};
    var albumurl=$_ctx+'/album/findAlbumById';
    $(function(){
        $.post(albumurl,{
            albumid:albumid
        },function(data,stadius){
            if(stadius=='success'){
                $('#album-poster').prop('src',data.albumposter);
                $('#album-name').text('专辑名称：'+data.albumname);
                $('#album-artist').text('专辑歌手：'+data.albumartist);
                $('#album-addtime').text('发布时间：'+data.albumaddtime);
                $('#album-info').text('专辑介绍：'+data.albuminfo);
            }else{
                window.wxc.xcConfirm('获取数据失败！！', window.wxc.xcConfirm.typeEnum.error,{
                    title: "温馨提示"
                });
            }
        })
    })
</script>