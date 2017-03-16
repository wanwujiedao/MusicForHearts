/**
 * Created by dzx on 2016/3/14.
 */

var songranking=function(data,type,playurl){
    $('#player-slide').show();
     var ctx=playurl.split('/')[1];
    var albumpage='/'+ctx+'/page/album';
    var downurl=  '/'+ctx+'/music/download';
    var songstr='<tr><th>播放状态</th><th>歌曲名称</th><th>歌手名称</th><th>专辑名称</th><th>时长</th><th>收藏量</th><th>下载量</th><th>播放量</th><th>综合排行</th><th>下载</th></tr>';



    $.each(data, function (index, iteam) {
        songstr+='<tr><td class="isplay" id="'+iteam.name+'" url="'+iteam.url+'"><span class="glyphicon glyphicon-play"></span></td><td id="'+iteam.id+'" class="song">'+iteam.name+'</td><td  id="'+iteam.artistid+'" class="artist">'+iteam.artistname+'</td><td class="album" id="'+iteam.albumid+'">'+iteam.albumname+'</td><td class="song-time">'+iteam.time+'</td><td class="collectcount">'+iteam.collectcount+'</td><td class="downloadcount">'+iteam.downloadcount+'</td><td class="playcount">'+iteam.playcount+'</td><td class="counts">'+iteam.rank+'</td><td><a class="download-music"><span class="glyphicon glyphicon-download-alt"></span></a></td></tr>';
    });
    $('#songlist').html(songstr);


    $('td').css({
        'text-align':'center',
        'cursor': 'hand'
    });
    $('.song-time').css({
        'cursor': 'pointer !important'
    });
    $('th').css({
        'text-align':'center'
    });
    $('.download-music').css({
        'color':'#FFF000'
    });
if(type==0){
    $('.collectcount').css({
        'color':'#FF0000'
    });
}else if(type==1){
    $('.downloadcount').css({
        'color':'#FF0000'
    });
}else if(type==2){
    $('.playcount').css({
        'color':'#FF0000'
    });
}else{
    $('.counts').css({
        'color':'#FF0000'
    });
}

    //事件

    //下载
    $('.download-music').click(function(){
        var music_id=$(this).parents('tr').find('.song')[0].id;
        window.open(downurl+'?id='+music_id);
    });
    //本页面播放
    $('.isplay').click(function(){
        if( $(this).find('span').attr('class')=='glyphicon glyphicon-play'){
            $('.isplay').find('span').prop('class','glyphicon glyphicon-play');
            $(this).find('span').prop('class','glyphicon glyphicon-pause');

            var song_id=$(this).parents('tr').find('.song').attr('id');

            var song_name=this.id;
            var song_artist=$(this).parents('tr').find('.artist').text();
            var song_url=$(this).attr('url');
            var song = {
                'song_id':song_id ,
                'title': song_name,
                'artist': song_artist,
                'mp3':song_url
            }
            addToPlayList(song);
            $('#player-slide').prop('class','player-hide');
            $('#player-slide').find('span').prop('class','glyphicon glyphicon-chevron-down');
            $(".player-wrap").animate({
                'bottom': '0px'
            });


        }else{
            $(this).find('span').prop('class','glyphicon glyphicon-play');
            $("#jplayer_N").jPlayer('pause');
            $('#player-slide').prop('class','player-show');
            $('#player-slide').find('span').prop('class','glyphicon glyphicon-chevron-up');
            $(".player-wrap").animate({
                'bottom': '-60px'
            });

        }
    });
    //跳到单独播放页面
    $('.song').click(function(){
        alert(this.id)
    });

    //跳到专辑界面
    $('.album').click(function(){
        location.href=albumpage+'?albumid='+this.id;
    });


    //跳到歌手界面
    $('.artist').click(function(){
        location.href=artistpage+'?id='+this.id;
    });
}