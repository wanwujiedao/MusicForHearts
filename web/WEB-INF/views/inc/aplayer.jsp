<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${ctx}/static/plugs/APlayer/dist/APlayer.min.css">
<script src="${ctx}/static/plugs/APlayer/dist/APlayer.min.js"></script>
<style>
    .player-wrap{
        position: fixed;
        width: 100%;
        margin: auto;
        height: 60px;
        z-index: 999;
    }
    .arrowplayer{
        font-size: 35px;
        padding-top:20px ;
    }
</style>
<script>
    $(function(){


    });
</script>
<div class="player-wrap">
    <div class="col-md-1 arrowplayer"><span class="glyphicon glyphicon-hand-left"></span></div>
<div id="song_player" class="aplayer col-d-10">
    <pre class="aplayer-lrc-content"></pre>
</div>
</div>
