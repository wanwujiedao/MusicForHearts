<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${ctx}/static/css/music/music.css"/>
<div class="music-wrap">
    <div class="music-shadow">
    </div>
    <div class="music-detail">
        <h2 style="text-align: center;color: #FF0000"></h2>
        <hr>
        <div class="music-cont" style="color: #FFFFFF">
            <div class="col-xs-3" id="music-avatar"><img alt="音乐封面" /></div>
            <div class="col-xs-8 col-xs-offset-1 music-basic ">
                <div id="music-type"><span></span></div>
                <div id="music-artist"><span></span></div>
                <div id="music-album"><span></span></div>
                <div id="music-playcount"><span></span></div>
                <div id="music-collectcount"><span></span></div>
                <div id="music-downloadcount"><span></span></div>
                <div id="music-time"><span></span></div>
            </div>
            <div id="music-info" class="col-xs-offset-1"><span></span>
            </div>

        </div>
        <hr>
        <div class="music-dao"><span class="releasetime col-xs-5 col-xs-offset-3 "></span><span class="col-xs-3 col-xs-offset-1 btn-dao">确定</span></div>
    </div>
</div>
